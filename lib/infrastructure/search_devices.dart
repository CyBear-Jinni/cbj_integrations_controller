import 'dart:collection';
import 'dart:io';
import 'dart:isolate';

import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/domain/i_network_utilities.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors_connector_conjecture.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SendToIsolate {
  SendToIsolate(
    this.sendPort,
    this.projectPath,
    this.networkUtilitiesType, {
    this.portByVendor,
  });
  SendPort sendPort;
  String projectPath;
  HashMap<VendorsAndServices, List<int>>? portByVendor;
  INetworkUtilities? networkUtilitiesType;
}

class BackFromIsolate {
  BackFromIsolate(this.vendorsAndServices, this.genericUnsupportedDE);
  VendorsAndServices vendorsAndServices;
  DeviceEntityBase genericUnsupportedDE;
}

class SearchDevices {
  void dispose() {
    for (final Isolate isolate in isolates) {
      isolate.kill();
    }
  }

  List<Isolate> isolates = [];

  Future<void> startSearchIsolate(
    INetworkUtilities? networkUtilitiesType,
  ) async {
    final String projectPath = await SystemCommandsManager().getLocalDbPath();

    /// For mdns search
    final mdnsReceivePort = ReceivePort();
    SendToIsolate searchDevices = SendToIsolate(
      mdnsReceivePort.sendPort,
      projectPath,
      networkUtilitiesType,
    );
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
    // if (!Platform.isAndroid) {
    /// For ping search
    final ReceivePort pingReceivePort = ReceivePort();
    searchDevices = SendToIsolate(
      pingReceivePort.sendPort,
      projectPath,
      networkUtilitiesType,
    );

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
    // }

    /// For port search
    final HashMap<VendorsAndServices, List<int>>? ports =
        VendorsConnectorConjecture().portsToScen();
    final ReceivePort portReceivePort = ReceivePort();
    searchDevices = SendToIsolate(
      portReceivePort.sendPort,
      projectPath,
      networkUtilitiesType,
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
    INetworkUtilities.instance = sendToIsolate.networkUtilitiesType;

    await INetworkUtilities.instance
        .configureNetworkTools(sendToIsolate.projectPath);

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

        await for (final DeviceEntityBase entity
            in INetworkUtilities.instance.searchMdnsDevices()) {
          sendPort.send(entity);
        }
      }
    } catch (e) {
      icLogger.e('Mdns search error\n$e');
    }
  }

  /// Get all the host names in the connected networks and try to add the device
  Future<void> _searchPingableDevicesAndSetThemUpByHostName(
    SendToIsolate sendToIsolate,
  ) async {
    INetworkUtilities.instance = sendToIsolate.networkUtilitiesType;
    await INetworkUtilities.instance
        .configureNetworkTools(sendToIsolate.projectPath);

    final SendPort sendPort = sendToIsolate.sendPort;

    while (true) {
      await searchForAdress((subnet) async {
        try {
          final Stream<DeviceEntityBase> pingStream1 = INetworkUtilities
              .instance
              .getAllPingableDevicesAsync(subnet, lastHostId: 126);
          await for (final DeviceEntityBase entity in pingStream1) {
            sendPort.send(entity);
          }

          // Spits to 2 requests to fix error in snap https://github.com/CyBear-Jinni-user/CBJ_Hub_Snap/issues/2
          final Stream<DeviceEntityBase> pingStream2 = INetworkUtilities
              .instance
              .getAllPingableDevicesAsync(subnet, firstHostId: 127);
          await for (final DeviceEntityBase entity in pingStream2) {
            sendPort.send(entity);
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

  Future<void> _searchAllByPorts(
    SendToIsolate sendToIsolate,
  ) async {
    if (sendToIsolate.portByVendor == null) {
      return;
    }
    INetworkUtilities.instance = sendToIsolate.networkUtilitiesType;
    await INetworkUtilities.instance
        .configureNetworkTools(sendToIsolate.projectPath);

    final SendPort sendPort = sendToIsolate.sendPort;
    while (true) {
      await searchForAdress((subnet) async {
        for (final MapEntry<VendorsAndServices, List<int>> vendorPorts
            in sendToIsolate.portByVendor!.entries) {
          final VendorsAndServices vendor = vendorPorts.key;
          for (final int port in vendorPorts.value) {
            INetworkUtilities.instance
                .scanDevicesForSinglePort(subnet, port)
                .listen((event) {
              final BackFromIsolate backFromIsolate = BackFromIsolate(
                vendor,
                event,
              );
              sendPort.send(backFromIsolate);
            });
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
