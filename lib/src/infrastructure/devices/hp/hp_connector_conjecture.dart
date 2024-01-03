import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/hp/hp_helpers.dart';

class HpConnectorConjecture extends VendorConnectorConjectureService {
  factory HpConnectorConjecture() {
    return _instance;
  }

  HpConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.hp,
          mdnsVendorUniqueTypes: ['_hplib._tcp'],
          mdnsTypes: ['_ipp._tcp'],
          uniqueIdentifierNameInMdns: ['HP'],
        );

  static final HpConnectorConjecture _instance =
      HpConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      HpHelpers.addDiscoveredDevice(entity);
}