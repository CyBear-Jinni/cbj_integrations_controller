import 'dart:collection';

import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class UnseportedVendorOrDeviceConnectorConjecture
    extends VendorConnectorConjectureService {
  factory UnseportedVendorOrDeviceConnectorConjecture() {
    return _instance;
  }

  UnseportedVendorOrDeviceConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.vendorsAndServicesNotSupported,
        );

  static final UnseportedVendorOrDeviceConnectorConjecture _instance =
      UnseportedVendorOrDeviceConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async =>
      HashMap()
        ..addEntries([
          MapEntry(entity.deviceCbjUniqueId.getOrCrash(), entity),
        ]);
}
