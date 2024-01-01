import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class EspHomeConnectorConjecture extends VendorConnectorConjectureService {
  factory EspHomeConnectorConjecture() {
    return _instance;
  }

  EspHomeConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.espHome,
          mdnsVendorUniqueTypes: ['_esphomelib._tcp'],
        );

  static final EspHomeConnectorConjecture _instance =
      EspHomeConnectorConjecture._singletonContractor();

  static String? espHomeDevicePass;

  Map<String, DeviceEntityBase> get getAllCompanyDevices => vendorEntities;

  Future<String> accountLogin(
    GenericEspHomeLoginDE genericEspHomeDeviceLoginDE,
  ) async {
    espHomeDevicePass =
        genericEspHomeDeviceLoginDE.espHomeDevicePass.getOrCrash();
    // We can start a search of devices in node red using a request to
    // /esphome/discovery but for now lets just let the devices get found by
    // the global mdns search
    return 'Success';
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async {
    if (espHomeDevicePass == null) {
      icLogger.w('ESPHome device got found but missing a password, please add '
          'password for it in the app');
      return HashMap();
    }

    return EspHomeHelpers.addDiscoveredEntities(
      entity: entity,
      devicePassword: espHomeDevicePass!,
    );
  }
}
