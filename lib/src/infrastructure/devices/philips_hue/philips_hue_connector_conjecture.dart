import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_helpers.dart';

class PhilipsHueConnectorConjecture extends VendorConnectorConjectureService {
  factory PhilipsHueConnectorConjecture() {
    return _instance;
  }

  PhilipsHueConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.philipsHue,
          mdnsVendorUniqueTypes: ['_hue._tcp'],
        );

  static final PhilipsHueConnectorConjecture _instance =
      PhilipsHueConnectorConjecture._singletonContractor();

  static bool gotHueHubIp = false;

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) =>
      PhilipsHueHelpers.addDiscoveredDevice(entity);
}
