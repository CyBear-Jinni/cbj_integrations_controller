import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/devices/hp/hp_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class HpConnectorConjecture extends VendorConnectorConjectureService {
  factory HpConnectorConjecture() {
    return _instance;
  }

  HpConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.hp,
          mdnsVendorUniqueTypes: ['_hplib._tcp'],
          mdnsTypes: ['_ipp._tcp'],
          uniqueIdentifierNameInMdns: ['hp'],
        );

  static final HpConnectorConjecture _instance =
      HpConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      HpHelpers.addDiscoveredDevice(entity);
}
