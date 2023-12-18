import 'dart:io';

import 'package:cbj_integrations_controller/domain/i_network_utilities.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_devices_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors_connector_conjecture.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:network_tools/network_tools.dart';

class SearchDevices {
  factory SearchDevices() {
    return _instance;
  }

  SearchDevices._singletonConstructor();

  static final SearchDevices _instance = SearchDevices._singletonConstructor();

  void startSearch() {
    _searchAllMdnsDevicesAndSetThemUp();

    _searchPingableDevicesAndSetThemUpByHostName();

    _searchDevicesByBindingIntoSockets();

    _searchDevicesByMqttPath();

    _notImplementedDevicesSearch();
  }

  Future<void> _searchAllMdnsDevicesAndSetThemUp() async {
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
          icLogger.i(
            'Device Name ${await activeHost.hostName}, ${await activeHost.deviceName}',
          );

          final GenericUnsupportedDE entity =
              await INetworkUtilities.instance.activeHostToEntity(activeHost);
          VendorsConnectorConjecture().setMdnsDeviceByCompany(entity);
        }

        await Future.delayed(const Duration(minutes: 2));
      }
    } catch (e) {
      icLogger.e('Mdns search error\n$e');
    }
  }

  /// Get all the host names in the connected networks and try to add the device
  Future<void> _searchPingableDevicesAndSetThemUpByHostName() async {
    while (true) {
      final List<GenericUnsupportedDE> pingableDevices =
          await _searchPingableDevices();

      for (final GenericUnsupportedDE entity in pingableDevices) {
        try {
          VendorsConnectorConjecture().setHostNameDeviceByCompany(entity);
        } catch (e) {
          continue;
        }
      }

      await Future.delayed(const Duration(minutes: 5));
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

  Future<List<GenericUnsupportedDE>> _searchPingableDevices() async {
    final List<Future<GenericUnsupportedDE>> entityList = [];

    final List<NetworkInterface> networkInterfaceList =
        await NetworkInterface.list();

    for (final NetworkInterface networkInterface in networkInterfaceList) {
      for (final InternetAddress address in networkInterface.addresses) {
        final String ip = address.address;
        if (!ip.contains('.')) {
          continue;
        }
        final String subnet = ip.substring(0, ip.lastIndexOf('.'));

        await for (final ActiveHost activeHost
            in HostScanner.getAllPingableDevices(
          subnet,
          lastHostId: 126,
        )) {
          entityList
              .add(INetworkUtilities.instance.activeHostToEntity(activeHost));
        }

        // Spits to 2 requests to fix error in snap https://github.com/CyBear-Jinni-user/CBJ_Hub_Snap/issues/2
        await for (final ActiveHost activeHost
            in HostScanner.getAllPingableDevices(
          subnet,
          firstHostId: 127,
        )) {
          entityList
              .add(INetworkUtilities.instance.activeHostToEntity(activeHost));
        }
      }
    }

    return Future.wait(entityList);
  }

  /// Searching devices by binding to sockets, used for devices with
  /// udp ports which can't be discovered by regular open (tcp) port scan
  Future<void> _searchDevicesByBindingIntoSockets() async {
    final List<Stream<DeviceEntityBase?>> switcherBindingsList =
        VendorsConnectorConjecture().searchOfBindingIntoSocketsList();
    for (final Stream<DeviceEntityBase?> socketBinding
        in switcherBindingsList) {
      socketBinding.listen((bindingDevice) async {
        if (bindingDevice == null) {
          return;
        }
        VendorsConnectorConjecture().foundBindingDevice(bindingDevice);
      });
    }

    final List<Stream<ActiveHost>> devicesWithPort =
        await _findCbjDevicesByBindingIntoSockets();
    try {
      for (final Stream<ActiveHost> socketBinding in devicesWithPort) {
        socketBinding.listen((activeHost) async {
          icLogger.i('Found CBJ Smart security camera: ${activeHost.address}');

          final GenericUnsupportedDE entity =
              await INetworkUtilities.instance.activeHostToEntity(activeHost);
          CbjDevicesConnectorConjecture().foundEntity(entity);
        });
      }
    } catch (e) {
      icLogger.w('Exception searchForHub\n$e');
    }
  }

  Future<List<Stream<ActiveHost>>> _findCbjDevicesByBindingIntoSockets() async {
    final List<Stream<ActiveHost>> bindingStream = [];

    final List<NetworkInterface> networkInterfaceList =
        await NetworkInterface.list();

    for (final NetworkInterface networkInterface in networkInterfaceList) {
      for (final InternetAddress address in networkInterface.addresses) {
        final String ip = address.address;
        if (!ip.contains('.')) {
          continue;
        }

        final String subnet = ip.substring(0, ip.lastIndexOf('.'));

        bindingStream.add(
          HostScanner.scanDevicesForSinglePort(
            subnet,
            50054,
          ),
        );
      }
    }
    return bindingStream;
  }

  /// Searching for mqtt devices
  Future<void> _searchDevicesByMqttPath() async {
    // getIt<TasmotaMqttConnectorConjecture>().discoverNewDevices();
  }

  /// Devices that we need to insert in to the other search options but didn't
  /// got to it yet.
  /// We do implement here the start of the search for convince organization
  /// and since putting it in the constructor of singleton will be called
  /// before all of our program.
  Future<void> _notImplementedDevicesSearch() async {
    // YeelightConnectorConjecture().discoverNewDevices();
  }
}
