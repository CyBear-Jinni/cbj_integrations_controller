import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_webos_tv/lg_webos_tv_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';

class LgConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory LgConnectorConjecture() {
    return _instance;
  }

  LgConnectorConjecture._singletonContractor();

  static final LgConnectorConjecture _instance =
      LgConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.lg;

  @override
  final List<String> mdnsTypes = [
    '_hap._tcp',
    '_display._tcp',
    '_airplay._tcp',
  ];

  @override
  final List<String> uniqueIdentifierNameInMdns = ['lg', 'webos'];

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return null;
    }

    for (final DeviceEntityAbstract device in vendorEntities.values) {
      if (device is LgWebosTvEntity &&
          (mdnsName == device.entityUniqueId.getOrCrash() ||
              entity.deviceLastKnownIp.getOrCrash() ==
                  device.deviceLastKnownIp.getOrCrash())) {
        return null;
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
        return null;
      }
    }

    final List<DeviceEntityAbstract> lgDevice =
        LgHelpers.addDiscoveredDevice(entity);

    if (lgDevice.isEmpty) {
      return null;
    }

    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in lgDevice) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
        entityAsDevice.deviceCbjUniqueId.getOrCrash(),
        entityAsDevice,
      );

      addedDevice.addEntries([deviceAsEntry]);
      vendorEntities.addEntries([deviceAsEntry]);
      icLogger.i(
        'New LG device got added ${entityAsDevice.cbjEntityName.getOrCrash()}',
      );
    }
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(DeviceEntityAbstract lgDE) async {
    final DeviceEntityAbstract? device =
        vendorEntities[lgDE.entityUniqueId.getOrCrash()];

    if (device is LgWebosTvEntity) {
      device.executeDeviceAction(newEntity: lgDE);
    } else {
      icLogger.i('Lg device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {}
}
