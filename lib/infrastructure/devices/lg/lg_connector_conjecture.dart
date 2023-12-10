import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_webos_tv/lg_webos_tv_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_entity.dart';

class LgConnectorConjecture implements AbstractCompanyConnectorConjecture {
  factory LgConnectorConjecture() {
    return _instance;
  }

  LgConnectorConjecture._singletonContractor();

  static final LgConnectorConjecture _instance =
      LgConnectorConjecture._singletonContractor();

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  static const List<String> mdnsTypes = [
    '_hap._tcp',
    '_display._tcp',
    '_airplay._tcp',
  ];

  /// Add new devices to [companyDevices] if not exist
  Future addNewDeviceByMdnsName(
    GenericGenericUnsupportedDE entity,
  ) async {
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return;
    }

    for (final DeviceEntityAbstract device in companyDevices.values) {
      if (device is LgWebosTvEntity &&
          (mdnsName == device.entityUniqueId.getOrCrash() ||
              entity.deviceLastKnownIp.getOrCrash() ==
                  device.deviceLastKnownIp.getOrCrash())) {
        return [];
      }
      // Same tv can have multiple mDns names so we can't compere it without ip in the object
      // else if (device is GenericSmartTvDE &&
      //     (mDnsName == device.entityUniqueId.getOrCrash() ||
      //         ip == device.lastKnownIp!.getOrCrash())) {
      //   return;
      // }
      else if (mdnsName == device.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'LG device type supported but implementation is missing here',
        );
        return [];
      }
    }

    final List<DeviceEntityAbstract> lgDevice =
        LgHelpers.addDiscoveredDevice(entity);

    if (lgDevice.isEmpty) {
      return [];
    }

    for (final DeviceEntityAbstract entityAsDevice in lgDevice) {
      final DeviceEntityAbstract deviceToAdd = CompaniesConnectorConjecture()
          .addDiscoveredDeviceToHub(entityAsDevice);

      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
          MapEntry(deviceToAdd.entityUniqueId.getOrCrash(), deviceToAdd);

      companyDevices.addEntries([deviceAsEntry]);
      icLogger.i(
        'New LG device got added ${entityAsDevice.cbjEntityName.getOrCrash()}',
      );
    }
    return lgDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(DeviceEntityAbstract lgDE) async {
    final DeviceEntityAbstract? device =
        companyDevices[lgDE.entityUniqueId.getOrCrash()];

    if (device is LgWebosTvEntity) {
      device.executeDeviceAction(newEntity: lgDE);
    } else {
      icLogger.i('Lg device type does not exist');
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {}
}
