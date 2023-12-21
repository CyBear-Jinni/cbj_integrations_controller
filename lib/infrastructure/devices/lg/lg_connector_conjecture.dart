import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class LgConnectorConjecture extends VendorConnectorConjectureService {
  factory LgConnectorConjecture() {
    return _instance;
  }

  LgConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.lg,
          uniqueIdentifierNameInMdns: ['lg', 'webos'],
          mdnsTypes: ['_hap._tcp', '_display._tcp', '_airplay._tcp'],
        );

  static final LgConnectorConjecture _instance =
      LgConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      LgHelpers.addDiscoveredDevice(entity);
}
