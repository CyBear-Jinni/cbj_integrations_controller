import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
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
import 'package:cbj_integrations_controller/infrastructure/devices/xiaomi_io/xiaomi_io_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices_service.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_entity.dart';

class CompaniesConnectorConjecture {
  factory CompaniesConnectorConjecture() {
    return _instance;
  }

  CompaniesConnectorConjecture._singletonConstructor();

  static final CompaniesConnectorConjecture _instance =
      CompaniesConnectorConjecture._singletonConstructor();

  void updateAllDevicesReposWithDeviceChanges(DeviceEntityAbstract entity) {
    final String deviceVendor = entity.cbjDeviceVendor.getOrCrash();

    final AbstractCompanyConnectorConjecture? companyConnectorConjecture =
        vendorStringToCompanyConnectorConjecture(deviceVendor);

    if (companyConnectorConjecture != null) {
      companyConnectorConjecture.manageHubRequestsForDevice(entity);
    } else {
      icLogger.w(
        'Cannot send device changes to its repo, company not supported $deviceVendor',
      );
    }
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
        deviceEntityAbstract.value.cbjDeviceVendor.getOrCrash();

    final AbstractCompanyConnectorConjecture? companyConnectorConjecture =
        vendorStringToCompanyConnectorConjecture(deviceVendor);

    if (companyConnectorConjecture != null) {
      companyConnectorConjecture.setUpDeviceFromDb(devicesEntry.value);
    } else {
      icLogger.w('Cannot add device entity to its repo, type not supported');
    }
  }

  // DeviceEntityAbstract addDiscoveredDeviceToHub(
  //   DeviceEntityAbstract deviceEntity,
  // ) {
  //   final DeviceEntityAbstract deviceEntityGotSaved =
  //       ISavedDevicesRepo.instance.addOrUpdateDevice(deviceEntity);

  //   IMqttServerRepository.instance
  //       .postSmartDeviceToAppMqtt(entityFromTheHub: deviceEntityGotSaved);

  //   return deviceEntityGotSaved;
  // }

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
      icLogger
          .w('Vendor login type ${loginEntity.runtimeType} is not supported');
    }
  }

  /// Getting ActiveHost that contain MdnsInfo property and activate it inside
  /// The correct company.
  Future setMdnsDeviceByCompany(GenericUnsupportedDE entity) async {
    final String? mdnsDeviceIp = entity.deviceLastKnownIp.getOrCrash();
    if (mdnsDeviceIp == null) {
      return;
    }
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    final String? startOfMdnsName =
        mdnsName?.substring(0, mdnsName.indexOf('.'));
    final String startOfMdnsNameLower = startOfMdnsName!.toLowerCase();

    final String port = entity.devicePort.getOrCrash();
    String? serviceType;

    final List<String>? ptrNameSplit =
        entity.ptrResourceRecord.getOrCrash()?.split('.');
    String tempString = '';
    if (ptrNameSplit != null) {
      if (ptrNameSplit.isNotEmpty) {
        tempString = ptrNameSplit[0];
      }
      if (ptrNameSplit.length >= 2) {
        tempString = '$tempString.${ptrNameSplit[1]}';
      }
      if (tempString.isNotEmpty) {
        serviceType = tempString;
      }
    }

    if (serviceType == null || serviceType.isEmpty) {
      return;
    }

    HashMap<String, DeviceEntityAbstract>? handeldEntities;
    VendorsAndServices? vendor;

    if (EspHomeConnectorConjecture.mdnsTypes.contains(serviceType)) {
      vendor = VendorsAndServices.espHome;
    } else if (ShellyConnectorConjecture.mdnsTypes.contains(serviceType) &&
        startOfMdnsName.toLowerCase().contains('shelly')) {
      vendor = VendorsAndServices.shelly;
    } else if (EwelinkConnectorConjecture.mdnsTypes.contains(serviceType)) {
      vendor = VendorsAndServices.sonoffEweLink;
    } else if (GoogleConnectorConjecture.mdnsTypes.contains(serviceType) &&
        (startOfMdnsNameLower.contains('google') ||
            startOfMdnsNameLower.contains('android') ||
            startOfMdnsNameLower.contains('chrome'))) {
      vendor = VendorsAndServices.google;
    } else if (LgConnectorConjecture.mdnsTypes.contains(serviceType) &&
        (startOfMdnsNameLower.contains('lg') ||
            startOfMdnsNameLower.contains('webos'))) {
      vendor = VendorsAndServices.lg;
    } else if (HpPrinterEntity.mdnsTypes.contains(serviceType) &&
        (startOfMdnsNameLower.contains('hp'))) {
      vendor = VendorsAndServices.hp;
    } else if (YeelightConnectorConjecture.mdnsTypes.contains(serviceType) &&
        (startOfMdnsName.startsWith('YL'))) {
      vendor = VendorsAndServices.yeelight;
    } else if (PhilipsHueConnectorConjecture.mdnsTypes.contains(serviceType)) {
      vendor = VendorsAndServices.philipsHue;
    }

    if (vendor != null) {
      final AbstractCompanyConnectorConjecture? companyConnectorConjecture =
          vendorStringToCompanyConnectorConjecture(vendor.name);
      handeldEntities = await companyConnectorConjecture?.foundDevice(entity);
    } else {
      final String address = entity.deviceLastKnownIp.getOrCrash()!;
      icLogger.t(
        'mDNS service type $serviceType is not supported\n IP: $address, Port: $port, ServiceType: $serviceType, MdnsName: $startOfMdnsName',
      );
      handeldEntities = HashMap();
      handeldEntities.addEntries(
        [MapEntry(entity.deviceCbjUniqueId.getOrCrash(), entity)],
      );
    }
    if (handeldEntities == null) {
      icLogger.e(
        'Entity failed to load mdns device ${entity.deviceMdns.getOrCrash()}',
      );
      return;
    }
    if (handeldEntities.isEmpty) {
      /// Device exists
      return;
    }
    DevicesService().discovedEntity(handeldEntities);
  }

  Future<void> setHostNameDeviceByCompany(GenericUnsupportedDE entity) async {
    final String deviceHostNameLowerCase =
        entity.deviceHostName.getOrCrash().toLowerCase();
    if (deviceHostNameLowerCase.isEmpty) {
      return;
    }

    HashMap<String, DeviceEntityAbstract>? handeldEntities;
    VendorsAndServices? vendor;

    if (deviceHostNameLowerCase.contains('tasmota')) {
      vendor = VendorsAndServices.tasmota;
    } else if (deviceHostNameLowerCase.contains('xiaomi') ||
        deviceHostNameLowerCase.contains('yeelink') ||
        deviceHostNameLowerCase.contains('xiao')) {
      vendor = VendorsAndServices.xiaomi;
    } else if (deviceHostNameLowerCase.startsWith('wiz')) {
      vendor = VendorsAndServices.wiz;
    }

    if (vendor != null) {
      final AbstractCompanyConnectorConjecture? companyConnectorConjecture =
          vendorStringToCompanyConnectorConjecture(vendor.name);
      handeldEntities = await companyConnectorConjecture?.foundDevice(entity);
    } else {
      final GenericUnsupportedDE? entityTemp =
          await CbjSmartDeviceClient.checkIfDeviceIsCbjSmartDevice(
        entity.devicesMacAddress.getOrCrash(),
      );
      if (entityTemp != null) {
        handeldEntities =
            await CbjDevicesConnectorConjecture().foundDevice(entityTemp);
      } else {
        icLogger.i('Found unseported pingable device $deviceHostNameLowerCase');
        handeldEntities = HashMap();
        handeldEntities.addEntries(
          [MapEntry(entity.deviceCbjUniqueId.getOrCrash(), entity)],
        );
      }
    }
    if (handeldEntities == null) {
      icLogger.e(
        'Entity failed to load company name device $deviceHostNameLowerCase',
      );
      return;
    } else if (handeldEntities.isEmpty) {
      return;
    }
    DevicesService().discovedEntity(handeldEntities);
  }

  List<Stream<DeviceEntityAbstract?>> searchOfBindingIntoSocketsList() =>
      SwitcherConnectorConjecture().bindSocketSearchStream();

  Future<void> foundBindingDevice(DeviceEntityAbstract entity) async {
    HashMap<String, DeviceEntityAbstract>? handeldEntities;

    final String deviceVendor = entity.cbjDeviceVendor.getOrCrash();
    final AbstractCompanyConnectorConjecture? companyConnectorConjecture =
        vendorStringToCompanyConnectorConjecture(deviceVendor);

    if (companyConnectorConjecture != null) {
      handeldEntities = await companyConnectorConjecture.foundDevice(entity);
    } else {
      icLogger.w(
        'Cannot send device changes to its repo, company not supported $deviceVendor',
      );
    }

    if (handeldEntities == null) {
      icLogger.i('Found unseported socket device $entity');
      return;
    } else if (handeldEntities.isEmpty) {
      return;
    }
    DevicesService().discovedEntity(handeldEntities);
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

    icLogger.w(
      'Please add vendor to support string $vendorName to connector conjecture',
    );

    return null;
  }
}
