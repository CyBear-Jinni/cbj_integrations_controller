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
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/sonoff_diy/sonoff_diy_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/wiz/wiz_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/xiaomi_io/xiaomi_io_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices_service.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_empty_entity/generic_empty_entity.dart';

class VendorsConnectorConjecture {
  factory VendorsConnectorConjecture() {
    return _instance;
  }

  VendorsConnectorConjecture._singletonConstructor() {
    YeelightConnectorConjecture();
    XiaomiIoConnectorConjecture();
    WizConnectorConjecture();
    TasmotaMqttConnectorConjecture();
    TasmotaIpConnectorConjecture();
    SwitcherConnectorConjecture();
    SonoffDiyConnectorConjecture();
    ShellyConnectorConjecture();
    PhilipsHueConnectorConjecture();
    LifxConnectorConjecture();
    LgConnectorConjecture();
    HpConnectorConjecture();
    GoogleConnectorConjecture();
    EwelinkConnectorConjecture();
    EspHomeConnectorConjecture();
    CbjDevicesConnectorConjecture();
  }

  static final VendorsConnectorConjecture _instance =
      VendorsConnectorConjecture._singletonConstructor();

  void addAllDevicesToItsRepos(
    Map<String, DeviceEntityBase> allDevices,
  ) {
    for (final MapEntry<String, DeviceEntityBase> deviceId
        in allDevices.entries) {
      addDeviceToItsRepo(deviceId);
    }
  }

  void addDeviceToItsRepo(
    MapEntry<String, DeviceEntityBase> deviceEntityBase,
  ) {
    final MapEntry<String, DeviceEntityBase> devicesEntry =
        MapEntry<String, DeviceEntityBase>(
      deviceEntityBase.key,
      deviceEntityBase.value,
    );

    final String deviceVendor =
        deviceEntityBase.value.cbjDeviceVendor.getOrCrash();

    final VendorConnectorConjectureService? companyConnectorConjecture =
        vendorStringToCompanyConnectorConjecture(deviceVendor);

    if (companyConnectorConjecture != null) {
      companyConnectorConjecture.setUpEntityFromDb(devicesEntry.value);
    } else {
      icLogger.w('Cannot add device entity to its repo, type not supported');
    }
  }

  // DeviceEntityBase addDiscoveredDeviceToHub(
  //   DeviceEntityBase deviceEntity,
  // ) {
  //   final DeviceEntityBase deviceEntityGotSaved =
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

    final String? port = entity.devicePort.getOrCrash();
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

    VendorConnectorConjectureService? companyConnectorConjecture;

    for (final VendorConnectorConjectureService connectorConjecture
        in VendorConnectorConjectureService.vendorConnectorConjectureClass) {
      final bool containUniqueType =
          connectorConjecture.mdnsVendorUniqueTypes.contains(serviceType);

      if (containUniqueType) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }

      final bool containServiceType =
          connectorConjecture.mdnsTypes.contains(serviceType);
      if (!containServiceType) {
        continue;
      }

      bool containStartOfMdns =
          connectorConjecture.uniqueIdentifierNameInMdns.isEmpty;

      if (containStartOfMdns) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }

      for (final String uniqueNameInMdns
          in connectorConjecture.uniqueIdentifierNameInMdns) {
        if (startOfMdnsNameLower.contains(uniqueNameInMdns)) {
          containStartOfMdns = true;
          break;
        }
      }

      if (containStartOfMdns) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }
    }

    HashMap<String, DeviceEntityBase>? handeldEntities;

    if (companyConnectorConjecture != null) {
      handeldEntities = await companyConnectorConjecture.foundEntity(entity);
    }

    if (handeldEntities == null) {
      icLogger.e(
        'Entity failed to load mdns device ${entity.deviceMdns.getOrCrash()}',
      );
      final String address = entity.deviceLastKnownIp.getOrCrash()!;
      icLogger.t(
        'Entity service type $serviceType is not supported\n IP: $address, Port: $port,\n'
        'ServiceType: $serviceType, mDNS device ${entity.deviceMdns.getOrCrash()}',
      );
      handeldEntities = HashMap();
      handeldEntities.addEntries(
        [MapEntry(entity.deviceCbjUniqueId.getOrCrash(), entity)],
      );
      return;
    } else if (handeldEntities.isEmpty) {
      /// Device exists
      return;
    }
    DevicesService().discovedEntity(handeldEntities);
  }

  Future<void> setHostNameDeviceByCompany(GenericUnsupportedDE entity) async {
    final String? deviceHostNameLowerCase =
        entity.deviceHostName.getOrCrash()?.toLowerCase();
    if (deviceHostNameLowerCase == null || deviceHostNameLowerCase.isEmpty) {
      return;
    }

    HashMap<String, DeviceEntityBase>? handeldEntities;
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
      final VendorConnectorConjectureService? companyConnectorConjecture =
          vendorStringToCompanyConnectorConjecture(vendor.name);
      handeldEntities = await companyConnectorConjecture?.foundEntity(entity);
    } else {
      final GenericUnsupportedDE? entityTemp =
          await CbjSmartDeviceClient.checkIfDeviceIsCbjSmartDevice();
      if (entityTemp != null) {
        handeldEntities =
            await CbjDevicesConnectorConjecture().foundEntity(entityTemp);
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

  List<Stream<DeviceEntityBase?>> searchOfBindingIntoSocketsList() =>
      SwitcherConnectorConjecture().bindSocketSearchStream();

  Future<void> foundBindingDevice(DeviceEntityBase entity) async {
    HashMap<String, DeviceEntityBase>? handeldEntities;

    final String deviceVendor = entity.cbjDeviceVendor.getOrCrash();
    final VendorConnectorConjectureService? companyConnectorConjecture =
        vendorStringToCompanyConnectorConjecture(deviceVendor);

    if (companyConnectorConjecture != null) {
      handeldEntities = await companyConnectorConjecture.foundEntity(entity);
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

  VendorConnectorConjectureService? vendorStringToCompanyConnectorConjecture(
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

  VendorConnectorConjectureService? getVendorConnectorConjecture(
    VendorsAndServices vendor,
  ) {
    for (final VendorConnectorConjectureService vendorConnectorConjecture
        in VendorConnectorConjectureService.vendorConnectorConjectureClass) {
      if (vendorConnectorConjecture.vendorsAndServices == vendor) {
        return vendorConnectorConjecture;
      }
    }

    icLogger.w(
      'Please add vendor to support string ${vendor.name} to connector conjecture',
    );
    return null;
  }

  void setEntityState({
    required HashMap<VendorsAndServices, HashSet<String>> uniqueIdByVendor,
    required EntityProperties property,
    required EntityActions action,
    required dynamic value,
  }) {
    for (final MapEntry<VendorsAndServices, HashSet<String>> entry
        in uniqueIdByVendor.entries.toList()) {
      final VendorsAndServices vendor = entry.key;
      getVendorConnectorConjecture(vendor)?.setEntityState(
        ids: entry.value,
        action: action,
        property: property,
        value: value,
      );
    }
  }
}
