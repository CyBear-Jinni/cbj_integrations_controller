import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/chrome_cast/chrome_cast_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/google_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_tv_entity/generic_smart_tv_entity.dart';

class GoogleConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory GoogleConnectorConjecture() {
    return _instance;
  }

  GoogleConnectorConjecture._singletonContractor();

  static final GoogleConnectorConjecture _instance =
      GoogleConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.google;

  @override
  final List<String> mdnsVendorUniqueTypes = [
    '_googlecast._tcp',
    '_androidtvremote2._tcp',
  ];

  @override
  final List<String> mdnsTypes = [
    '_rc._tcp',
  ];

  @override
  final List<String> uniqueIdentifierNameInMdns = [
    'google',
    'android',
    'chrome',
  ];

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return null;
    }

    final DeviceEntityAbstract googleDevice =
        GoogleHelpers.addDiscoveredDevice(entity);

    for (final DeviceEntityAbstract device in vendorEntities.values) {
      if (googleDevice.deviceCbjUniqueId.getOrCrash() ==
          device.deviceLastKnownIp.getOrCrash()) {
        return HashMap();
      }
    }

    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
      googleDevice.deviceCbjUniqueId.getOrCrash(),
      googleDevice,
    );

    addedDevice.addEntries([deviceAsEntry]);
    vendorEntities.addEntries([deviceAsEntry]);
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

    // vendorEntities.addEntries([
    //   MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    // ]);
  }
}
