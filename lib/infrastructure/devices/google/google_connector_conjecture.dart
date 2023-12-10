import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/chrome_cast/chrome_cast_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/google_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv/generic_smart_tv_entity.dart';

class GoogleConnectorConjecture implements AbstractCompanyConnectorConjecture {
  factory GoogleConnectorConjecture() {
    return _instance;
  }

  GoogleConnectorConjecture._singletonContractor();

  static final GoogleConnectorConjecture _instance =
      GoogleConnectorConjecture._singletonContractor();

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  static const List<String> mdnsTypes = [
    '_googlecast._tcp',
    '_androidtvremote2._tcp',
    '_rc._tcp',
  ];

  /// Add new devices to [companyDevices] if not exist
  Future addNewDeviceByMdnsName(GenericGenericUnsupportedDE entity) async {
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return;
    }
    for (final DeviceEntityAbstract device in companyDevices.values) {
      if (device is ChromeCastEntity &&
          (mdnsName == device.entityUniqueId.getOrCrash() ||
              entity.deviceLastKnownIp.getOrCrash() ==
                  device.deviceLastKnownIp.getOrCrash())) {
        return [];
      } // Same tv can have multiple mDns names so we can't compere it without ip in the object
      // else if (device is GenericSmartTvDE &&
      //     (mDnsName == device.entityUniqueId.getOrCrash() ||
      //         ip == device.lastKnownIp!.getOrCrash())) {
      //   return;
      // }
      else if (mdnsName == device.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'Google device type supported but implementation is missing here',
        );
        return [];
      }
    }

    final List<DeviceEntityAbstract> googleDevice =
        GoogleHelpers.addDiscoveredDevice(entity);

    if (googleDevice.isEmpty) {
      return [];
    }

    for (final DeviceEntityAbstract entityAsDevice in googleDevice) {
      final DeviceEntityAbstract deviceToAdd = CompaniesConnectorConjecture()
          .addDiscoveredDeviceToHub(entityAsDevice);

      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
          MapEntry(deviceToAdd.entityUniqueId.getOrCrash(), deviceToAdd);

      companyDevices.addEntries([deviceAsEntry]);
    }
    icLogger.i('New Chromecast device got added');
    return googleDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(DeviceEntityAbstract googleDE) async {
    final DeviceEntityAbstract? device =
        companyDevices[googleDE.entityUniqueId.getOrCrash()];

    if (device is ChromeCastEntity) {
      device.executeDeviceAction(newEntity: googleDE);
    } else {
      icLogger.w(
        'Google device type does not exist ${device?.entityTypes.getOrCrash()}',
      );
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericSmartTvDE) {
      nonGenericDevice = ChromeCastEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('EspHome device could not get loaded from the server');
      return;
    }

    companyDevices.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }
}
