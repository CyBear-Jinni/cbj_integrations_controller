import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_light/shelly_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_relay_switch/shelly_relay_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_entity.dart';

class ShellyConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory ShellyConnectorConjecture() {
    return _instance;
  }

  ShellyConnectorConjecture._singletonContractor();

  static final ShellyConnectorConjecture _instance =
      ShellyConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.shelly;

  static const List<String> mdnsTypes = ['_http._tcp'];

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return null;
    }

    for (final DeviceEntityAbstract device in vendorEntities.values) {
      if ((device is ShellyColorLightEntity ||
              device is ShellyRelaySwitchEntity) &&
          mdnsName == device.entityUniqueId.getOrCrash()) {
        return null;
      } else if ((device is GenericRgbwLightDE || device is GenericSwitchDE) &&
          mdnsName == device.entityUniqueId.getOrCrash()) {
        break;
      } else if (mdnsName == device.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'Shelly device type supported but implementation is missing here',
        );
        return null;
      }
    }

    final List<DeviceEntityAbstract>? shellyDevice =
        await ShellyHelpers.addDiscoveredDevice(entity);

    if (shellyDevice == null || shellyDevice.isEmpty) {
      return null;
    }

    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in shellyDevice) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
        entityAsDevice.deviceCbjUniqueId.getOrCrash(),
        entityAsDevice,
      );

      addedDevice.addEntries([deviceAsEntry]);
      vendorEntities.addEntries([deviceAsEntry]);
    }
    icLogger.t('New shelly devices name:$mdnsName');
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract shellyDE,
  ) async {
    final DeviceEntityAbstract? device =
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
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

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
}
