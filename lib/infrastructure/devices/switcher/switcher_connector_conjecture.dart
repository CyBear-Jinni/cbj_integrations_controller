import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors_connector_conjecture.dart';
import 'package:switcher_dart/switcher_dart.dart';

class SwitcherConnectorConjecture extends VendorConnectorConjectureService {
  factory SwitcherConnectorConjecture() {
    return _instance;
  }

  SwitcherConnectorConjecture._singletonContractor()
      : super(vendorsAndServices: VendorsAndServices.switcherSmartHome) {
    bindSocketSearchStream();
  }

  static final SwitcherConnectorConjecture _instance =
      SwitcherConnectorConjecture._singletonContractor();

  void bindSocketSearchStream() {
    SwitcherDiscover.discover20002Devices()
        .listen(sendNewDeviceToVendorConnectorConjecture);

    SwitcherDiscover.discover20003Devices()
        .listen(sendNewDeviceToVendorConnectorConjecture);
  }

  void sendNewDeviceToVendorConnectorConjecture(
    SwitcherApiObject switcherApiObject,
  ) {
    final DeviceEntityBase? entity =
        SwitcherHelpers.addDiscoveredDevice(switcherApiObject);
    if (entity == null) {
      return;
    }
    VendorsConnectorConjecture().foundEntityOfVendor(
      this,
      entity,
      entity.deviceCbjUniqueId.getOrCrash(),
    );
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async =>
      // It is getting converted in bindSocketSearchStream
      HashMap()
        ..addEntries([MapEntry(entity.deviceCbjUniqueId.getOrCrash(), entity)]);
}
