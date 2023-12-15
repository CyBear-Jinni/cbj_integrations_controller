import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_e26/philips_hue_e26_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_entity.dart';

class PhilipsHueConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory PhilipsHueConnectorConjecture() {
    return _instance;
  }

  PhilipsHueConnectorConjecture._singletonContractor();

  static final PhilipsHueConnectorConjecture _instance =
      PhilipsHueConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.philipsHue;

  static const List<String> mdnsTypes = [
    '_hue._tcp',
  ];

  static bool gotHueHubIp = false;

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    final String ip = entity.deviceLastKnownIp.getOrCrash()!;

    final String? mdnsName = entity.deviceMdns.getOrCrash();
    if (mdnsName == null) {
      return null;
    }

    for (final DeviceEntityAbstract device in vendorEntities.values) {
      if (device is PhilipsHueE26Entity &&
          (mdnsName == device.entityUniqueId.getOrCrash() ||
              ip == device.deviceLastKnownIp.getOrCrash())) {
        return null;
      } else if (mdnsName == device.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'HP device type supported but implementation is missing here',
        );
        return null;
      }
    }
    gotHueHubIp = true;

    final List<DeviceEntityAbstract> phillipsDevice =
        await PhilipsHueHelpers.addDiscoveredDevice(entity);

    if (phillipsDevice.isEmpty) {
      return null;
    }

    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in phillipsDevice) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
          MapEntry(entityAsDevice.entityUniqueId.getOrCrash(), entityAsDevice);

      addedDevice.addEntries([deviceAsEntry]);
      vendorEntities.addEntries([deviceAsEntry]);
    }
    icLogger.i('New Philips Hue device got added');
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract philipsHueDE,
  ) async {
    final DeviceEntityAbstract? device =
        vendorEntities[philipsHueDE.entityUniqueId.getOrCrash()];

    if (device is PhilipsHueE26Entity) {
      device.executeDeviceAction(newEntity: philipsHueDE);
    } else {
      icLogger.w('PhilipsHue device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericDimmableLightDE) {
      nonGenericDevice = PhilipsHueE26Entity.fromGeneric(deviceEntity);
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
