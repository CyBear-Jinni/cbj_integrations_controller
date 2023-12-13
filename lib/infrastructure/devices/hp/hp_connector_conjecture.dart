import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/hp/hp_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/hp/hp_printer/hp_printer_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_printer_device/generic_printer_entity.dart';

class HpConnectorConjecture implements AbstractCompanyConnectorConjecture {
  factory HpConnectorConjecture() {
    return _instance;
  }

  HpConnectorConjecture._singletonContractor();

  static final HpConnectorConjecture _instance =
      HpConnectorConjecture._singletonContractor();

  static const List<String> mdnsTypes = ['_hplib._tcp'];

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundDevice(
    DeviceEntityAbstract entity,
  ) async {
    final String? ip = entity.deviceLastKnownIp.getOrCrash();

    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return null;
    }

    for (final DeviceEntityAbstract device in companyDevices.values) {
      if (device is HpPrinterEntity &&
          (mdnsName == device.entityUniqueId.getOrCrash() ||
              (ip != null && ip == device.deviceLastKnownIp.getOrCrash()))) {
        return null;
      } else if (mdnsName == device.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'HP device type supported but implementation is missing here',
        );
        return null;
      }
    }

    final List<DeviceEntityAbstract> hpDevice = HpHelpers.addDiscoveredDevice(
      entity,
    );

    if (hpDevice.isEmpty) {
      return null;
    }
    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in hpDevice) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
        entityAsDevice.deviceCbjUniqueId.getOrCrash(),
        entityAsDevice,
      );

      addedDevice.addEntries([deviceAsEntry]);
      companyDevices.addEntries([deviceAsEntry]);
    }
    icLogger.i('New HP device got added');
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract hpDE,
  ) async {
    final DeviceEntityAbstract? device =
        companyDevices[hpDE.entityUniqueId.getOrCrash()];

    if (device is HpPrinterEntity) {
      device.executeDeviceAction(newEntity: hpDE);
    } else {
      icLogger.w('HP device type does not exist');
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericPrinterDE) {
      nonGenericDevice = HpPrinterEntity.fromGeneric(deviceEntity);
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
