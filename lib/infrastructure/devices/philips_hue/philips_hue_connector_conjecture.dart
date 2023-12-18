import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_e26/philips_hue_e26_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_entity.dart';

class PhilipsHueConnectorConjecture extends VendorConnectorConjectureService {
  factory PhilipsHueConnectorConjecture() {
    return _instance;
  }

  PhilipsHueConnectorConjecture._singletonContractor();

  static final PhilipsHueConnectorConjecture _instance =
      PhilipsHueConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.philipsHue;

  @override
  final List<String> mdnsVendorUniqueTypes = ['_hue._tcp'];

  static bool gotHueHubIp = false;

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityBase philipsHueDE,
  ) async {
    final DeviceEntityBase? device =
        vendorEntities[philipsHueDE.entityUniqueId.getOrCrash()];

    if (device is PhilipsHueE26Entity) {
      device.executeDeviceAction(newEntity: philipsHueDE);
    } else {
      icLogger.w('PhilipsHue device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {
    DeviceEntityBase? nonGenericDevice;

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

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      PhilipsHueHelpers.addDiscoveredDevice(entity);
}
