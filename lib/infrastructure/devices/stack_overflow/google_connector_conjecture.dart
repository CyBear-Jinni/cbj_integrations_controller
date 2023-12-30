import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/devices/google/google_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class StackOverflowConjecture extends VendorConnectorConjectureService {
  factory StackOverflowConjecture() {
    return _instance;
  }

  StackOverflowConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.stackoverflow,
        );

  static final StackOverflowConjecture _instance =
      StackOverflowConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      GoogleHelpers.addDiscoveredDevice(entity);
}
