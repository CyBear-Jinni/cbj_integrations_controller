import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_1se/yeelight_1se_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_entity.dart';
import 'package:yeedart/yeedart.dart';

class YeelightConnectorConjecture
    implements AbstractCompanyConnectorConjecture {
  factory YeelightConnectorConjecture() {
    return _instance;
  }

  YeelightConnectorConjecture._singletonContractor();

  static final YeelightConnectorConjecture _instance =
      YeelightConnectorConjecture._singletonContractor();

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  static const List<String> mdnsTypes = [
    '_hap._tcp',
  ];

  /// Make sure that it will activate discoverNewDevices only once
  bool searchStarted = false;

  Future<HashMap<String, DeviceEntityAbstract>?> addNewDeviceByMdnsName(
    DeviceEntityAbstract entity,
  ) async {
    return addNewDevice(entity);
  }

  Future<HashMap<String, DeviceEntityAbstract>?> addNewDevice(
    DeviceEntityAbstract entity,
  ) async {
    try {
      final responses = await Yeelight.discover();
      if (responses.isEmpty) {
        return null;
      }

      final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

      for (final DiscoveryResponse yeelightDevice in responses) {
        if (companyDevices.containsKey(yeelightDevice.id.toString())) {
          return null;
        }

        DeviceEntityAbstract? addDevice;
        if (yeelightDevice.address.address ==
            entity.deviceLastKnownIp.getOrCrash()) {
          addDevice = YeelightHelpers.addDiscoveredDevice(
            yeelightDevice: yeelightDevice,
            entity: entity,
          );
        } else {
          addDevice = YeelightHelpers.addDiscoveredDevice(
            yeelightDevice: yeelightDevice,
            entity: entity,
          );
        }

        if (addDevice == null) {
          continue;
        }

        final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
            MapEntry(addDevice.deviceCbjUniqueId.getOrCrash(), addDevice);

        addedDevice.addEntries([deviceAsEntry]);
        companyDevices.addEntries([deviceAsEntry]);

        icLogger.i('New Yeelight device got added');
      }
      return addedDevice;
    } catch (e) {
      icLogger.e('Error discover in Yeelight\n$e');
    }
    return null;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract entity,
  ) async {
    final DeviceEntityAbstract? device =
        companyDevices[entity.entityUniqueId.getOrCrash()];

    if (device is Yeelight1SeEntity) {
      device.executeDeviceAction(newEntity: entity);
    } else {
      icLogger.w('Yeelight device type does not exist');
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericRgbwLightDE) {
      nonGenericDevice = Yeelight1SeEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Switcher device could not get loaded from the server');
      return;
    }

    companyDevices.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundDevice(
      DeviceEntityAbstract entity) {
    return addNewDevice(entity);
  }
}
