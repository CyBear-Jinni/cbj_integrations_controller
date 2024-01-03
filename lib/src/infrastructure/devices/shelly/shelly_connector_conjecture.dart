import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/shelly/shelly_helpers.dart';

class ShellyConnectorConjecture extends VendorConnectorConjectureService {
  factory ShellyConnectorConjecture() {
    return _instance;
  }

  ShellyConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.shelly,
          mdnsTypes: ['_http._tcp'],
          uniqueIdentifierNameInMdns: ['shelly'],
        );

  static final ShellyConnectorConjecture _instance =
      ShellyConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      ShellyHelpers.addDiscoveredDevice(entity);
}