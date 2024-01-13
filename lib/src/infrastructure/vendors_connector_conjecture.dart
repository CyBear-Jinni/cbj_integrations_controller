import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/vendor_entity_information.dart';
import 'package:cbj_integrations_controller/src/domain/vendor_login_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/cbj_devices/cbj_devices_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/google/google_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/hp/hp_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/sensibo/sensibo_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/shelly/shelly_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/switcher/switcher_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/unseported_vendor_or_device/unseported_vendor_or_device_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/yeelight/yeelight_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/entities_service.dart';

class VendorsConnectorConjecture {
  factory VendorsConnectorConjecture() {
    return _instance;
  }

  VendorsConnectorConjecture._singletonConstructor() {
    UnseportedVendorOrDeviceConnectorConjecture();
    YeelightConnectorConjecture();
    TasmotaIpConnectorConjecture();
    SwitcherConnectorConjecture();
    ShellyConnectorConjecture();
    PhilipsHueConnectorConjecture();
    LifxConnectorConjecture();
    HpConnectorConjecture();
    GoogleConnectorConjecture();
    CbjDevicesConnectorConjecture();
    SensiboConnectorConjecture();
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

  List<VendorEntityInformation> getVendors() =>
      VendorConnectorConjectureService.instanceMapByType.values
          .map((e) => e.vendorEntityInformation)
          .toList();
  void loginVendor(VendorLoginEntity vendorLoginService) =>
      VendorConnectorConjectureService
          .instanceMapByType[vendorLoginService.vendor]
          ?.login(vendorLoginService);

  /// Getting ActiveHost that contain MdnsInfo property and activate it inside
  /// The correct company.
  Future setMdnsDevice(GenericUnsupportedDE entity) async {
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
        in VendorConnectorConjectureService.instanceMapByType.values) {
      final bool containUniqueType =
          connectorConjecture.uniqeMdnsList.contains(serviceType);

      if (containUniqueType) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }

      final bool containServiceType =
          connectorConjecture.mdnsList.contains(serviceType);
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

    VendorConnectorConjectureService? companyConnectorConjecture;

    for (final MapEntry<VendorsAndServices,
            VendorConnectorConjectureService> vendorAndInstance
        in VendorConnectorConjectureService.instanceMapByType.entries) {
      for (final String adeviceHostNameLowerCase
          in vendorAndInstance.value.deviceHostNameLowerCaseList) {
        if (deviceHostNameLowerCase.contains(adeviceHostNameLowerCase)) {
          companyConnectorConjecture = vendorAndInstance.value;
          break;
        }
      }
      if (companyConnectorConjecture != null) {
        break;
      }
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

  Future foundEntityOfVendor(
    VendorConnectorConjectureService vendorConnectorConjectureService,
    DeviceEntityBase entity,
    String deviceCbjUniqueId,
  ) async {
    HashMap<String, DeviceEntityBase>? handeldEntities =
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
    EntitiesService().addDiscovedEntity(handeldEntities);
  }

  HashMap<VendorsAndServices, List<int>>? portsToScen() {
    return VendorConnectorConjectureService.portsUsedByVendor;
  }

  VendorConnectorConjectureService? getVendorConnectorConjecture(
    VendorsAndServices vendor,
  ) {
    final VendorConnectorConjectureService? vendorInstance =
        VendorConnectorConjectureService.instanceMapByType[vendor];
    if (vendorInstance != null) {
      return vendorInstance;
    }

    icLogger.w(
      'Please add vendor to support string ${vendor.name} to connector conjecture',
    );
    return null;
  }

  void setEntitiesState(ActionObject action) {
    for (final MapEntry<VendorsAndServices, HashSet<String>> entry
        in action.uniqueIdByVendor.entries.toList()) {
      final VendorsAndServices vendor = entry.key;
      getVendorConnectorConjecture(vendor)?.setEntityState(
        ids: entry.value,
        action: action.actionType,
        property: action.property,
        value: action.value,
      );
    }
  }
}
