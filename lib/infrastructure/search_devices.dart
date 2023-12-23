import 'dart:collection';
import 'dart:io';
import 'dart:isolate';

import 'package:cbj_integrations_controller/domain/i_network_utilities.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors_connector_conjecture.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:network_tools/network_tools.dart';

class SendToIsolate {
  SendToIsolate(this.sendPort, this.projectPath, {this.portByVendor});
  SendPort sendPort;
  String projectPath;
  HashMap<VendorsAndServices, List<int>>? portByVendor;
}

class BackFromIsolate {
  BackFromIsolate(this.vendorsAndServices, this.genericUnsupportedDE);
  VendorsAndServices vendorsAndServices;
  GenericUnsupportedDE genericUnsupportedDE;
}

class SearchDevices {
  void dispose() {
    for (final Isolate isolate in isolates) {
      isolate.kill();
    }
  }

  List<Isolate> isolates = [];

  Future<void> startSearchIsolate() async {
    final String projectPath = await SystemCommandsManager().getLocalDbPath();

    /// For mdns search
    final mdnsReceivePort = ReceivePort();
    SendToIsolate searchDevices =
        SendToIsolate(mdnsReceivePort.sendPort, projectPath);
    final Isolate mdnsIsolate = await Isolate.spawn(
      _searchAllMdnsDevicesAndSetThemUp,
      searchDevices,
    );

    mdnsReceivePort.listen((data) {
      if (data is GenericUnsupportedDE) {
        VendorsConnectorConjecture().setMdnsDeviceByCompany(data);
      }
    });

    mdnsIsolate.errors.listen((event) {
      icLogger.f('Mdns isolate had crashed $event');
    });
    isolates.add(mdnsIsolate);

    // TODO: Does not work on Android https://github.com/osociety/network_tools_flutter/issues/31
    if (!Platform.isAndroid) {
      /// For ping search
      final ReceivePort pingReceivePort = ReceivePort();
      searchDevices = SendToIsolate(pingReceivePort.sendPort, projectPath);

      final Isolate pingIsolate = await Isolate.spawn(
        _searchPingableDevicesAndSetThemUpByHostName,
        searchDevices,
      );

      pingReceivePort.listen((data) {
        if (data is GenericUnsupportedDE) {
          VendorsConnectorConjecture().setHostNameDeviceByCompany(data);
        }
      });
      pingIsolate.errors.listen((event) {
        icLogger.f('Ping isolate had crashed $event');
      });
      isolates.add(pingIsolate);
    }

    /// For port search
    final HashMap<VendorsAndServices, List<int>>? ports =
        VendorsConnectorConjecture().portsToScen();
    final ReceivePort portReceivePort = ReceivePort();
    searchDevices = SendToIsolate(
      portReceivePort.sendPort,
      projectPath,
      portByVendor: ports,
    );

    final Isolate portIsolate = await Isolate.spawn(
      _searchAllByPorts,
      searchDevices,
    );

    portReceivePort.listen((data) {
      if (data is BackFromIsolate) {
        VendorsConnectorConjecture().setHostNameDeviceByPort(
          data.vendorsAndServices,
          data.genericUnsupportedDE,
        );
      }
    });
    portIsolate.errors.listen((event) {
      icLogger.f('Port isolate had crashed $event');
    });
    isolates.add(portIsolate);
  }

  Future<void> _searchAllMdnsDevicesAndSetThemUp(
    SendToIsolate sendToIsolate,
  ) async {
    await configureNetworkTools(sendToIsolate.projectPath);
    final SendPort sendPort = sendToIsolate.sendPort;
    try {
      while (true) {
        while (true) {
          // TODO: mdns search crash if there is no local internet connection
          // but crash can't be cached using try catch.
          // InternetConnectionChecker().hasConnection; check if there is
          // connection to the www which is not needed for mdns search.
          // we need to replace this part with check that return true if
          // there is local internet connection/ device is connected to
          // local network.
          final bool result = await InternetConnectionChecker().hasConnection;
          if (result) {
            break;
          }
          icLogger.w('No internet connection detected, will try again in 2m to'
              ' search mdns in the network');
          await Future.delayed(const Duration(minutes: 2));
        }
        final List<ActiveHost> activeHostList = await _searchMdnsDevices();
        for (final ActiveHost activeHost in activeHostList) {
          final GenericUnsupportedDE entity =
              await INetworkUtilities.instance.activeHostToEntity(activeHost);
          sendPort.send(entity);
        }

        await Future.delayed(const Duration(minutes: 2));
      }
    } catch (e) {
      icLogger.e('Mdns search error\n$e');
    }
  }

  /// Get all the host names in the connected networks and try to add the device
  Future<void> _searchPingableDevicesAndSetThemUpByHostName(
    SendToIsolate sendToIsolate,
  ) async {
    await configureNetworkTools(sendToIsolate.projectPath);
    final SendPort sendPort = sendToIsolate.sendPort;

    while (true) {
      await searchForAdress((subnet) async {
        try {
          await for (final ActiveHost activeHost
              in HostScanner.getAllPingableDevicesAsync(
            subnet,
            lastHostId: 126,
          )) {
            sendPort.send(
              await INetworkUtilities.instance.activeHostToEntity(activeHost),
            );
          }

          // Spits to 2 requests to fix error in snap https://github.com/CyBear-Jinni-user/CBJ_Hub_Snap/issues/2
          await for (final ActiveHost activeHost
              in HostScanner.getAllPingableDevicesAsync(
            subnet,
            firstHostId: 127,
          )) {
            sendPort.send(
              await INetworkUtilities.instance.activeHostToEntity(activeHost),
            );
          }
        } catch (e) {
          icLogger.i('Ping search Error $e');
        }
      });

      await Future.delayed(const Duration(seconds: 5));
    }
  }

  Future searchForAdress(Future Function(String subnet) callback) async {
    final List<NetworkInterface> networkInterfaceList =
        await NetworkInterface.list();

    for (final NetworkInterface networkInterface in networkInterfaceList) {
      for (final InternetAddress address in networkInterface.addresses) {
        final String ip = address.address;
        if (!ip.contains('.')) {
          continue;
        }
        final String subnet = ip.substring(0, ip.lastIndexOf('.'));
        await callback(subnet);
      }
    }
  }

  Future<List<ActiveHost>> _searchMdnsDevices() async {
    final List<ActiveHost> activeHostList = [];

    for (ActiveHost activeHost in await MdnsScanner.searchMdnsDevices(
      forceUseOfSavedSrvRecordList: true,
    )) {
      // In some cases for some reason we get empty result when trying to
      // resolve mdns name to ip, the only way we found to fix that is to
      // use resolve it using avahi-resolve-host-name
      // TODO: Check if this part can be deleted after pr https://github.com/osociety/network_tools/pull/165#issuecomment-1826405925

      if (activeHost.address == '0.0.0.0') {
        final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;

        final String? mdnsSrvTarget = mdnsInfo?.mdnsSrvTarget;
        if (mdnsSrvTarget == null) {
          continue;
        }

        final String? deviceIp = await SystemCommandsManager()
            .getIpFromMdnsName(mdnsSrvTarget, mdnsInfo!.mdnsServiceType);
        if (deviceIp == null) {
          continue;
        }
        try {
          activeHost = activeHost..internetAddress = InternetAddress(deviceIp);
        } catch (e) {
          icLogger.e('Error setting internet address $e');
        }
      }

      final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;

      if (mdnsInfo != null) {
        activeHostList.add(activeHost);
      }
    }
    return activeHostList;
  }

  Future<void> _searchAllByPorts(
    SendToIsolate sendToIsolate,
  ) async {
    if (sendToIsolate.portByVendor == null) {
      return;
    }
    await configureNetworkTools(sendToIsolate.projectPath);
    final SendPort sendPort = sendToIsolate.sendPort;
    while (true) {
      await searchForAdress((subnet) async {
        for (final MapEntry<VendorsAndServices, List<int>> vendorPorts
            in sendToIsolate.portByVendor!.entries) {
          final VendorsAndServices vendor = vendorPorts.key;
          for (final int port in vendorPorts.value) {
            final stream2 = HostScanner.scanDevicesForSinglePort(
              subnet,
              port,
            );

            stream2.listen(
              (activeHost) async {
                final BackFromIsolate backFromIsolate = BackFromIsolate(
                  vendor,
                  await INetworkUtilities.instance
                      .activeHostToEntity(activeHost),
                );
                sendPort.send(backFromIsolate);
              },
            );
          }
        }
        await Future.delayed(const Duration(seconds: 3));
      });
    }
  }

  // /// Searching for mqtt devices
  // Future<void> _searchDevicesByMqttPath(SendPort sendPort) async {
  //   // getIt<TasmotaMqttConnectorConjecture>().discoverNewDevices();
  // }

  // /// Devices that we need to insert in to the other search options but didn't
  // /// got to it yet.
  // /// We do implement here the start of the search for convince organization
  // /// and since putting it in the constructor of singleton will be called
  // /// before all of our program.
  // Future<void> _notImplementedDevicesSearch(SendPort sendPort) async {
  //   // YeelightConnectorConjecture().discoverNewDevices();
  // }
}
