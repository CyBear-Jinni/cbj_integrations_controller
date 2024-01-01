import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class LgConnectorConjecture extends VendorConnectorConjectureService {
  factory LgConnectorConjecture() {
    return _instance;
  }

  LgConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.lg,
          mdnsTypes: ['_hap._tcp', '_display._tcp', '_airplay._tcp'],
          uniqueIdentifierNameInMdns: ['LG', 'webos'],
        );

  static final LgConnectorConjecture _instance =
      LgConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      LgHelpers.addDiscoveredDevice(entity);
}
