import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_light/shelly_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_relay_switch/shelly_relay_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_entity.dart';

class ShellyConnectorConjecture implements AbstractCompanyConnectorConjecture {
  factory ShellyConnectorConjecture() {
    return _instance;
  }

  ShellyConnectorConjecture._singletonContractor();

  static final ShellyConnectorConjecture _instance =
      ShellyConnectorConjecture._singletonContractor();

  static const List<String> mdnsTypes = ['_http._tcp'];

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  /// Add new devices to [companyDevices] if not exist
  Future addNewDeviceByMdnsName(GenericGenericUnsupportedDE entity) async {
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return;
    }

    for (final DeviceEntityAbstract device in companyDevices.values) {
      if ((device is ShellyColorLightEntity ||
              device is ShellyRelaySwitchEntity) &&
          mdnsName == device.entityUniqueId.getOrCrash()) {
        return List<DeviceEntityAbstract>.empty();
      } else if ((device is GenericRgbwLightDE || device is GenericSwitchDE) &&
          mdnsName == device.entityUniqueId.getOrCrash()) {
        break;
      } else if (mdnsName == device.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'Shelly device type supported but implementation is missing here',
        );
        return [];
      }
    }

    final List<DeviceEntityAbstract> shellyDevice =
        await ShellyHelpers.addDiscoveredDevice(entity);

    if (shellyDevice.isEmpty) {
      return List<DeviceEntityAbstract>.empty();
    }

    for (final DeviceEntityAbstract entityAsDevice in shellyDevice) {
      final DeviceEntityAbstract deviceToAdd = CompaniesConnectorConjecture()
          .addDiscoveredDeviceToHub(entityAsDevice);

      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
          MapEntry(deviceToAdd.entityUniqueId.getOrCrash(), deviceToAdd);

      companyDevices.addEntries([deviceAsEntry]);
    }
    icLogger.t('New shelly devices name:$mdnsName');
    return shellyDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract shellyDE,
  ) async {
    final DeviceEntityAbstract? device =
        companyDevices[shellyDE.entityUniqueId.getOrCrash()];

    if (device is ShellyColorLightEntity) {
      device.executeDeviceAction(newEntity: shellyDE);
    } else if (device is ShellyRelaySwitchEntity) {
      device.executeDeviceAction(newEntity: shellyDE);
    } else {
      icLogger.w('Shelly device type does not exist');
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericRgbwLightDE) {
      nonGenericDevice = ShellyColorLightEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Switcher device could not get loaded from the server');
      return;
    }

    companyDevices.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }
}
