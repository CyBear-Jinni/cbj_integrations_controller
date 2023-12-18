import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_led/tasmota_ip_led_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_switch/tasmota_ip_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_entity.dart';

class TasmotaIpConnectorConjecture extends VendorConnectorConjectureService {
  factory TasmotaIpConnectorConjecture() {
    return _instance;
  }

  TasmotaIpConnectorConjecture._singletonContractor();

  static final TasmotaIpConnectorConjecture _instance =
      TasmotaIpConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.tasmota;

  // This is how you can interact tasmota using network calls.
  // http://ip/cm?cmnd=SetOption19%200
  // http://ip/cm?cmnd=MqttHost%200

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityBase tasmotaIpDE,
  ) async {
    final DeviceEntityBase? device =
        vendorEntities[tasmotaIpDE.entityUniqueId.getOrCrash()];

    if (device is TasmotaIpSwitchEntity) {
      device.executeDeviceAction(newEntity: tasmotaIpDE);
    } else {
      icLogger.w('TasmotaIp device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {
    DeviceEntityBase? nonGenericDevice;

    if (deviceEntity is GenericLightDE) {
      nonGenericDevice = TasmotaIpLedEntity.fromGeneric(deviceEntity);
    } else if (deviceEntity is GenericSwitchDE) {
      nonGenericDevice = TasmotaIpSwitchEntity.fromGeneric(deviceEntity);
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
      TasmotaIpHelpers.addDiscoveredDevice(entity);
}
