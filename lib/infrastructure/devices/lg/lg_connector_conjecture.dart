import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_webos_tv/lg_webos_tv_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class LgConnectorConjecture extends VendorConnectorConjectureService {
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
  Future<void> manageHubRequestsForDevice(DeviceEntityBase lgDE) async {
    final DeviceEntityBase? device =
        vendorEntities[lgDE.entityUniqueId.getOrCrash()];

    if (device is LgWebosTvEntity) {
      device.executeDeviceAction(newEntity: lgDE);
    } else {
      icLogger.i('Lg device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {}

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      LgHelpers.addDiscoveredDevice(entity);
}
