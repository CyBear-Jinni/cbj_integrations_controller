import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_light/shelly_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_relay_switch/shelly_relay_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';

class ShellyConnectorConjecture extends VendorConnectorConjectureService {
  factory ShellyConnectorConjecture() {
    return _instance;
  }

  ShellyConnectorConjecture._singletonContractor();

  static final ShellyConnectorConjecture _instance =
      ShellyConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.shelly;

  @override
  final List<String> mdnsTypes = ['_http._tcp'];

  @override
  final List<String> uniqueIdentifierNameInMdns = ['shelly'];

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityBase shellyDE,
  ) async {
    final DeviceEntityBase? device =
        vendorEntities[shellyDE.entityUniqueId.getOrCrash()];

    if (device is ShellyColorLightEntity) {
      device.executeDeviceAction(newEntity: shellyDE);
    } else if (device is ShellyRelaySwitchEntity) {
      device.executeDeviceAction(newEntity: shellyDE);
    } else {
      icLogger.w('Shelly device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {
    DeviceEntityBase? nonGenericDevice;

    if (deviceEntity is GenericRgbwLightDE) {
      nonGenericDevice = ShellyColorLightEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Switcher device could not get loaded from the server');
      return;
    }

    vendorEntities.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      ShellyHelpers.addDiscoveredDevice(entity);
}
