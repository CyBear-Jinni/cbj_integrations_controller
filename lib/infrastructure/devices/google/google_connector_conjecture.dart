import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/chrome_cast/chrome_cast_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/google_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_tv_entity/generic_smart_tv_entity.dart';

class GoogleConnectorConjecture implements AbstractVendorConnectorConjecture {
  factory GoogleConnectorConjecture() {
    return _instance;
  }

  GoogleConnectorConjecture._singletonContractor();

  static final GoogleConnectorConjecture _instance =
      GoogleConnectorConjecture._singletonContractor();

  @override
  Map<String, DeviceEntityAbstract> vendorEntities = {};

  static const List<String> mdnsTypes = [
    '_googlecast._tcp',
    '_androidtvremote2._tcp',
    '_rc._tcp',
  ];

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return null;
    }
    for (final DeviceEntityAbstract device in vendorEntities.values) {
      if (device is ChromeCastEntity &&
          (mdnsName == device.entityUniqueId.getOrCrash() ||
              entity.deviceLastKnownIp.getOrCrash() ==
                  device.deviceLastKnownIp.getOrCrash())) {
        return null;
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
        return null;
      }
    }

    final List<DeviceEntityAbstract> googleDevice =
        GoogleHelpers.addDiscoveredDevice(entity);

    if (googleDevice.isEmpty) {
      return null;
    }
    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in googleDevice) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
        entityAsDevice.deviceCbjUniqueId.getOrCrash(),
        entityAsDevice,
      );

      addedDevice.addEntries([deviceAsEntry]);
      vendorEntities.addEntries([deviceAsEntry]);
    }
    icLogger.i('New Chromecast device got added');
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(DeviceEntityAbstract googleDE) async {
    final DeviceEntityAbstract? device =
        vendorEntities[googleDE.entityUniqueId.getOrCrash()];

    if (device is ChromeCastEntity) {
      device.executeDeviceAction(newEntity: googleDE);
    } else {
      icLogger.w(
        'Google device type does not exist ${device?.entityTypes.getOrCrash()}',
      );
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericSmartTvDE) {
      nonGenericDevice = ChromeCastEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('EspHome device could not get loaded from the server');
      return;
    }

    vendorEntities.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }

  @override
  Future setEntityState({
    required String cbjUniqeId,
    required EntityProperties property,
    required EntityActions action,
    required dynamic value,
  }) async {
    icLogger.e('setEntityState need to get writen');
  }
}
