import 'dart:async';
import 'dart:io';

import 'package:cbj_integrations_controller/domain/mqtt_server/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/domain/saved_devices/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_devices_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/ewelink/ewelink_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/google_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/hp/hp_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/hp/hp_printer/hp_printer_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/sonoff_diy/sonoff_diy_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/wiz/wiz_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/xiaomi_io/xiaomi_io_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:network_tools/network_tools.dart';
import 'package:switcher_dart/switcher_dart.dart';

class CompaniesConnectorConjecture {
  factory CompaniesConnectorConjecture() {
    return _instance;
  }

  CompaniesConnectorConjecture._singletonConstructor();

  static final CompaniesConnectorConjecture _instance =
      CompaniesConnectorConjecture._singletonConstructor();

  void updateAllDevicesReposWithDeviceChanges(
    Stream<dynamic> allDevices,
  ) {
    allDevices.listen((entity) {
      if (entity is DeviceEntityAbstract) {
        final String deviceVendor = entity.deviceVendor.getOrCrash();

        final AbstractCompanyConnectorConjecture? companyConnectorConjecture =
            vendorStringToCompanyConnectorConjecture(deviceVendor);

        if (companyConnectorConjecture != null) {
          companyConnectorConjecture.manageHubRequestsForDevice(entity);
        } else {
          logger.w(
            'Cannot send device changes to its repo, company not supported $deviceVendor',
          );
        }
      }
    });
  }

  void addAllDevicesToItsRepos(
    Map<String, DeviceEntityAbstract> allDevices,
  ) {
    for (final MapEntry<String, DeviceEntityAbstract> deviceId
        in allDevices.entries) {
      addDeviceToItsRepo(deviceId);
    }
  }

  void addDeviceToItsRepo(
    MapEntry<String, DeviceEntityAbstract> deviceEntityAbstract,
  ) {
    final MapEntry<String, DeviceEntityAbstract> devicesEntry =
        MapEntry<String, DeviceEntityAbstract>(
      deviceEntityAbstract.key,
      deviceEntityAbstract.value,
    );

    final String deviceVendor =
        deviceEntityAbstract.value.deviceVendor.getOrCrash();

    final AbstractCompanyConnectorConjecture? companyConnectorConjecture =
        vendorStringToCompanyConnectorConjecture(deviceVendor);

    if (companyConnectorConjecture != null) {
      companyConnectorConjecture.setUpDeviceFromDb(devicesEntry.value);
    } else {
      logger.w('Cannot add device entity to its repo, type not supported');
    }
  }

  DeviceEntityAbstract addDiscoveredDeviceToHub(
    DeviceEntityAbstract deviceEntity,
  ) {
    final DeviceEntityAbstract deviceEntityGotSaved =
        ISavedDevicesRepo.instance.addOrUpdateDevice(deviceEntity);

    IMqttServerRepository.instance
        .postSmartDeviceToAppMqtt(entityFromTheHub: deviceEntityGotSaved);

    return deviceEntityGotSaved;
  }

  void setVendorLoginCredentials(LoginEntityAbstract loginEntity) {
    if (loginEntity is GenericLifxLoginDE) {
      LifxConnectorConjecture().accountLogin(loginEntity);
    } else if (loginEntity is GenericEspHomeLoginDE) {
      EspHomeConnectorConjecture().accountLogin(loginEntity);
    } else if (loginEntity is GenericXiaomiMiLoginDE) {
      XiaomiIoConnectorConjecture().accountLogin(loginEntity);
    } else if (loginEntity is GenericEwelinkLoginDE) {
      EwelinkConnectorConjecture().accountLogin(loginEntity);
    } else {
      logger.w('Vendor login type ${loginEntity.runtimeType} is not supported');
    }
  }

  Future<void> searchAllMdnsDevicesAndSetThemUp() async {
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
          logger.w('No internet connection detected, will try again in 2m to'
              ' search mdns in the network');
          await Future.delayed(const Duration(minutes: 2));
        }
        List<ActiveHost> activeHostList = await searchMdnsDevices();
        for (ActiveHost activeHost in activeHostList) {
          setMdnsDeviceByCompany(activeHost);
        }

        await Future.delayed(const Duration(minutes: 2));
      }
    } catch (e) {
      logger.e('Mdns search error\n$e');
    }
  }

  Future<List<ActiveHost>> searchMdnsDevices() async {
    List<ActiveHost> activeHostList = [];

    for (ActiveHost activeHost in await MdnsScanner.searchMdnsDevices(
      forceUseOfSavedSrvRecordList: true,
    )) {
      // In some cases for some reason we get empty result when trying to
      // resolve mdns name to ip, the only way we found to fix that is to
      // use resolve it using avahi-resolve-host-name
      // TODO: Check if this part can be deleted after pr https://github.com/osociety/network_tools/pull/165#issuecomment-1826405925

      if (activeHost.address == '0.0.0.0') {
        MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;

        final String? mdnsSrvTarget = mdnsInfo?.mdnsSrvTarget;
        if (mdnsSrvTarget == null) {
          continue;
        }

        final String? deviceIp = await SystemCommandsManager()
            .getIpFromMdnsName(mdnsSrvTarget, mdnsInfo!.mdnsServiceType);
        if (deviceIp == null) {
          continue;
        }
        activeHost = activeHost..internetAddress = InternetAddress(deviceIp);
      }

      final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;

      if (mdnsInfo != null) {
        activeHostList.add(activeHost);
      }
    }
    return activeHostList;
  }

  /// Getting ActiveHost that contain MdnsInfo property and activate it inside
  /// The correct company.
  Future<void> setMdnsDeviceByCompany(ActiveHost activeHost) async {
    final MdnsInfo? hostMdnsInfo = await activeHost.mdnsInfo;

    if (hostMdnsInfo == null) {
      return;
    }

    final String mdnsDeviceIp = activeHost.address;

    if (activeHost.internetAddress.type != InternetAddressType.IPv4) {
      return;
    }

    final String startOfMdnsName = hostMdnsInfo.getOnlyTheStartOfMdnsName();
    final String startOfMdnsNameLower = startOfMdnsName.toLowerCase();

    final String mdnsPort = hostMdnsInfo.mdnsPort.toString();

    if (EspHomeConnectorConjecture.mdnsTypes
        .contains(hostMdnsInfo.mdnsServiceType)) {
      EspHomeConnectorConjecture().addNewDeviceByMdnsName(
        mDnsName: startOfMdnsName,
        ip: mdnsDeviceIp,
        port: mdnsPort,
        address: mdnsDeviceIp,
      );
    } else if (ShellyConnectorConjecture.mdnsTypes
            .contains(hostMdnsInfo.mdnsServiceType) &&
        hostMdnsInfo
            .getOnlyTheStartOfMdnsName()
            .toLowerCase()
            .contains('shelly')) {
      ShellyConnectorConjecture().addNewDeviceByMdnsName(
        mDnsName: startOfMdnsName,
        ip: mdnsDeviceIp,
        port: mdnsPort,
      );
    } else if (EwelinkConnectorConjecture.mdnsTypes
        .contains(hostMdnsInfo.mdnsServiceType)) {
      EwelinkConnectorConjecture().discoverNewDevices(activeHost: activeHost);
    } else if (GoogleConnectorConjecture.mdnsTypes
            .contains(hostMdnsInfo.mdnsServiceType) &&
        (startOfMdnsNameLower.contains('google') ||
            startOfMdnsNameLower.contains('android') ||
            startOfMdnsNameLower.contains('chrome'))) {
      GoogleConnectorConjecture().addNewDeviceByMdnsName(
        mDnsName: startOfMdnsName,
        ip: mdnsDeviceIp,
        port: mdnsPort,
      );
    } else if (LgConnectorConjecture.mdnsTypes
            .contains(hostMdnsInfo.mdnsServiceType) &&
        (startOfMdnsNameLower.contains('lg') ||
            startOfMdnsNameLower.contains('webos'))) {
      LgConnectorConjecture().addNewDeviceByMdnsName(
        mDnsName: startOfMdnsName,
        ip: mdnsDeviceIp,
        port: mdnsPort,
      );
    } else if (HpPrinterEntity.mdnsTypes
            .contains(hostMdnsInfo.mdnsServiceType) &&
        (startOfMdnsNameLower.contains('hp'))) {
      HpConnectorConjecture().addNewDeviceByMdnsName(
        mDnsName: startOfMdnsName,
        ip: mdnsDeviceIp,
        port: mdnsPort,
      );
    } else if (YeelightConnectorConjecture.mdnsTypes
            .contains(hostMdnsInfo.mdnsServiceType) &&
        (startOfMdnsName.startsWith('YL'))) {
      YeelightConnectorConjecture().addNewDeviceByMdnsName(
        mDnsName: startOfMdnsName,
        ip: mdnsDeviceIp,
        port: mdnsPort,
      );
    } else if (PhilipsHueConnectorConjecture.mdnsTypes
        .contains(hostMdnsInfo.mdnsServiceType)) {
      PhilipsHueConnectorConjecture().addNewDeviceByMdnsName(
        mDnsName: startOfMdnsName,
        ip: mdnsDeviceIp,
        port: mdnsPort,
      );
    } else {
      logger.t(
        'mDNS service type ${hostMdnsInfo.mdnsServiceType} is not supported\n IP: ${activeHost.address}, Port: ${hostMdnsInfo.mdnsPort}, ServiceType: ${hostMdnsInfo.mdnsServiceType}, MdnsName: ${hostMdnsInfo.getOnlyTheStartOfMdnsName()}',
      );
    }
  }

  /// Get all the host names in the connected networks and try to add the device
  Future<void> searchPingableDevicesAndSetThemUpByHostName() async {
    while (true) {
      List<ActiveHost> pingableDevices = await searchPingableDevices();

      for (ActiveHost activeHost in pingableDevices) {
        try {
          setHostNameDeviceByCompany(
            activeHost: activeHost,
          );
        } catch (e) {
          continue;
        }
      }

      await Future.delayed(const Duration(minutes: 5));
    }
  }

  Future<List<ActiveHost>> searchPingableDevices() async {
    List<ActiveHost> activeList = [];

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
          activeList.add(activeHost);
        }

        // Spits to 2 requests to fix error in snap https://github.com/CyBear-Jinni-user/CBJ_Hub_Snap/issues/2
        await for (final ActiveHost activeHost
            in HostScanner.getAllPingableDevices(
          subnet,
          firstHostId: 127,
        )) {
          activeList.add(activeHost);
        }
      }
    }

    return activeList;
  }

  Future<void> setHostNameDeviceByCompany({
    required ActiveHost activeHost,
  }) async {
    final String? deviceHostNameLowerCase =
        (await activeHost.hostName)?.toLowerCase();
    if (deviceHostNameLowerCase == null) {
      return;
    }
    if (deviceHostNameLowerCase.contains('tasmota')) {
      TasmotaIpConnectorConjecture().addNewDeviceByHostInfo(
        activeHost: activeHost,
      );
    } else if (deviceHostNameLowerCase.contains('xiaomi') ||
        deviceHostNameLowerCase.contains('yeelink') ||
        deviceHostNameLowerCase.contains('xiao')) {
      XiaomiIoConnectorConjecture().discoverNewDevices(activeHost: activeHost);
    } else if (deviceHostNameLowerCase.startsWith('wiz')) {
      WizConnectorConjecture().addNewDeviceByHostInfo(activeHost: activeHost);
    } else {
      final ActiveHost? cbjSmartDeviceHost =
          await CbjSmartDeviceClient.checkIfDeviceIsCbjSmartDevice(
        activeHost.address,
      );
      if (cbjSmartDeviceHost != null) {
        CbjDevicesConnectorConjecture()
            .addNewDeviceByHostInfo(activeHost: cbjSmartDeviceHost);
        return;
      }
      // logger.i('Found pingable device $deviceHostNameLowerCase');
    }
  }

  /// Searching devices by binding to sockets, used for devices with
  /// udp ports which can't be discovered by regular open (tcp) port scan
  Future<void> searchDevicesByBindingIntoSockets() async {
    List<Stream<dynamic>> switcherBindingsList =
        findSwitcherDevicesByBindingIntoSockets();
    for (Stream<dynamic> socketBinding in switcherBindingsList) {
      socketBinding.listen((switcherApiObject) {
        SwitcherConnectorConjecture()
            .addOnlyNewSwitcherDevice(switcherApiObject);
      });
    }

    List<Stream<ActiveHost>> devicesWithPort =
        await findCbjDevicesByBindingIntoSockets();
    try {
      for (Stream<ActiveHost> socketBinding in devicesWithPort) {
        socketBinding.listen((activeHost) {
          logger.i('Found CBJ Smart security camera: ${activeHost.address}');

          CbjDevicesConnectorConjecture()
              .addNewDeviceByHostInfo(activeHost: activeHost);
        });
      }
    } catch (e) {
      logger.w('Exception searchForHub\n$e');
    }
  }

  Future<List<Stream<ActiveHost>>> findCbjDevicesByBindingIntoSockets() async {
    List<Stream<ActiveHost>> bindingStream = [];

    final List<NetworkInterface> networkInterfaceList =
        await NetworkInterface.list();

    for (final NetworkInterface networkInterface in networkInterfaceList) {
      for (final InternetAddress address in networkInterface.addresses) {
        final String ip = address.address;
        if (!ip.contains('.')) {
          continue;
        }

        final String subnet = ip.substring(0, ip.lastIndexOf('.'));

        bindingStream.add(HostScanner.scanDevicesForSinglePort(
          subnet,
          50054,
        ));
      }
    }
    return bindingStream;
  }

  List<Stream<dynamic>> findSwitcherDevicesByBindingIntoSockets() {
    List<Stream<dynamic>> bindingStream = [];
    bindingStream.add(SwitcherDiscover.discover20002Devices());
    bindingStream.add(SwitcherDiscover.discover20003Devices());

    return bindingStream;
  }

  /// Searching for mqtt devices
  Future<void> searchDevicesByMqttPath() async {
    // getIt<TasmotaMqttConnectorConjecture>().discoverNewDevices();
  }

  /// Devices that we need to insert in to the other search options but didn't
  /// got to it yet.
  /// We do implement here the start of the search for convince organization
  /// and since putting it in the constructor of singleton will be called
  /// before all of our program.
  Future<void> notImplementedDevicesSearch() async {
    // YeelightConnectorConjecture().discoverNewDevices();
  }

  AbstractCompanyConnectorConjecture? vendorStringToCompanyConnectorConjecture(
    String vendorName,
  ) {
    //TODO: convert vendorName to type and then use switch case

    if (vendorName == VendorsAndServices.espHome.toString()) {
      return EspHomeConnectorConjecture();
    } else if (vendorName == VendorsAndServices.switcherSmartHome.toString()) {
      return SwitcherConnectorConjecture();
    } else if (vendorName == VendorsAndServices.lifx.toString()) {
      return LifxConnectorConjecture();
    } else if (vendorName == VendorsAndServices.yeelight.toString()) {
      return YeelightConnectorConjecture();
    } else if (vendorName == VendorsAndServices.philipsHue.toString()) {
      return PhilipsHueConnectorConjecture();
    } else if (vendorName == VendorsAndServices.sonoffDiy.toString()) {
      return SonoffDiyConnectorConjecture();
    } else if (vendorName == VendorsAndServices.google.toString()) {
      return GoogleConnectorConjecture();
    } else if (vendorName ==
        VendorsAndServices.cbjDeviceSmartEntity.toString()) {
      return CbjDevicesConnectorConjecture();
    } else if (vendorName == VendorsAndServices.shelly.toString()) {
      return ShellyConnectorConjecture();
    } else if (vendorName == VendorsAndServices.hp.toString()) {
      return HpConnectorConjecture();
    } else if (vendorName == VendorsAndServices.miHome.toString()) {
      return XiaomiIoConnectorConjecture();
    } else if (vendorName == VendorsAndServices.tasmota.toString()) {
      return TasmotaIpConnectorConjecture();
    } else if (vendorName == VendorsAndServices.sonoffEweLink.toString()) {
      return EwelinkConnectorConjecture();
    }

    logger.w(
      'Please add vendor to support string $vendorName to connector conjecture',
    );

    return null;
  }
}
