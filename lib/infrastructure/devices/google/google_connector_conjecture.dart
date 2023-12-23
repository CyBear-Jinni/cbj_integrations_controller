import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/devices/google/google_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class GoogleConnectorConjecture extends VendorConnectorConjectureService {
  factory GoogleConnectorConjecture() {
    return _instance;
  }

  GoogleConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.google,
          mdnsVendorUniqueTypes: ['_googlecast._tcp', '_androidtvremote2._tcp'],
          mdnsTypes: ['_rc._tcp'],
          uniqueIdentifierNameInMdns: ['google', 'android', 'chrome'],
        );

  static final GoogleConnectorConjecture _instance =
      GoogleConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      GoogleHelpers.addDiscoveredDevice(entity);
}
