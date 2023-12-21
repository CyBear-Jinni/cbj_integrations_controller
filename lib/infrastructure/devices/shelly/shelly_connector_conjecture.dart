import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class ShellyConnectorConjecture extends VendorConnectorConjectureService {
  factory ShellyConnectorConjecture() {
    return _instance;
  }

  ShellyConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.shelly,
          uniqueIdentifierNameInMdns: ['shelly'],
          mdnsTypes: ['_http._tcp'],
        );

  static final ShellyConnectorConjecture _instance =
      ShellyConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      ShellyHelpers.addDiscoveredDevice(entity);
}
