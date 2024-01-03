import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/lifx_login/generic_lifx_login_entity.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/cbj_devices/cbj_devices_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/esphome/esphome_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/ewelink/ewelink_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/google/google_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/hp/hp_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/shelly/shelly_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/sonoff_diy/sonoff_diy_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/switcher/switcher_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/unseported_vendor_or_device/unseported_vendor_or_device.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/wiz/wiz_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/xiaomi_io/xiaomi_io_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/yeelight/yeelight_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/entities_service.dart';

class VendorsConnectorConjecture {
  factory VendorsConnectorConjecture() {
    return _instance;
  }

  VendorsConnectorConjecture._singletonConstructor() {
    UnseportedVendorOrDeviceConnectorConjecture();
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
    HpConnectorConjecture();
    GoogleConnectorConjecture();
    EwelinkConnectorConjecture();
    EspHomeConnectorConjecture();
    CbjDevicesConnectorConjecture();
  }

  static final VendorsConnectorConjecture _instance =
      VendorsConnectorConjecture._singletonConstructor();

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
    final String? mdnsName = entity.deviceMdns.getOrCrash();

    if (mdnsDeviceIp == null || mdnsName == null) {
      return;
    }
    final String startOfMdnsName = mdnsName.substring(0, mdnsName.indexOf('.'));
    // final String startOfMdnsNameLower = startOfMdnsName.toLowerCase();

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
        if (startOfMdnsName.startsWith(uniqueNameInMdns)) {
          containStartOfMdns = true;
          break;
        }
      }

      if (containStartOfMdns) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }
    }

    if (companyConnectorConjecture == null) {
      return;
    }

    foundEntityOfVendor(companyConnectorConjecture, entity, mdnsName);
  }

  Future<void> setHostNameDeviceByCompany(GenericUnsupportedDE entity) async {
    final String? deviceHostNameLowerCase =
        entity.deviceHostName.getOrCrash()?.toLowerCase();
    if (deviceHostNameLowerCase == null || deviceHostNameLowerCase.isEmpty) {
      return;
    }

    VendorsAndServices? vendor;

    if (deviceHostNameLowerCase.contains('tasmota')) {
      vendor = VendorsAndServices.tasmota;
    } else if (deviceHostNameLowerCase.contains('xiaomi') ||
        deviceHostNameLowerCase.contains('xiao')) {
      vendor = VendorsAndServices.xiaomi;
    } else if (deviceHostNameLowerCase.contains('yeelink')) {
      // TODO: Check if yeelink -> yeelight is ok
      vendor = VendorsAndServices.yeelight;
    } else if (deviceHostNameLowerCase.startsWith('wiz')) {
      vendor = VendorsAndServices.wiz;
    }

    VendorConnectorConjectureService? companyConnectorConjecture;

    if (vendor != null) {
      companyConnectorConjecture = getVendorConnectorConjecture(vendor);
    }
    if (companyConnectorConjecture == null) {
      return;
    }

    foundEntityOfVendor(
      companyConnectorConjecture,
      entity,
      deviceHostNameLowerCase,
    );
  }

  Future<void> setHostNameDeviceByPort(
    VendorsAndServices vendor,
    DeviceEntityBase entity,
  ) async {
    final VendorConnectorConjectureService? vendorConnectorConjectureService =
        getVendorConnectorConjecture(vendor);
    final String? port = entity.devicePort.getOrCrash();
    if (vendorConnectorConjectureService == null || port == null) {
      return;
    }

    foundEntityOfVendor(vendorConnectorConjectureService, entity, port);
  }

  // Bad practice
  void customeSearch(HashMap<String, DeviceEntityBase> value) {
    if (value.isEmpty) {
      return;
    }
    EntitiesService().discovedEntity(value);
  }

  Future<void> foundEntityOfVendor(
    VendorConnectorConjectureService vendorConnectorConjectureService,
    DeviceEntityBase entity,
    String deviceCbjUniqueId,
  ) async {
    HashMap<String, DeviceEntityBase>? handeldEntities;

    handeldEntities =
        await vendorConnectorConjectureService.foundEntity(entity);

    if (handeldEntities == null) {
      icLogger.i('Found unseported device $deviceCbjUniqueId');
      handeldEntities = handeldEntities =
          await UnseportedVendorOrDeviceConnectorConjecture().foundEntity(
        entity
          ..deviceCbjUniqueId =
              CoreUniqueId.fromUniqueString(deviceCbjUniqueId),
      );
    }
    if (handeldEntities == null || handeldEntities.isEmpty) {
      return;
    }
    EntitiesService().discovedEntity(handeldEntities);
  }

  HashMap<VendorsAndServices, List<int>>? portsToScen() {
    return VendorConnectorConjectureService.portsUsedByVendor;
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
    HashMap<ActionValues, dynamic>? value,
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
