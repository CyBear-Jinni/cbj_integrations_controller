import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors_connector_conjecture.dart';
import 'package:yeedart/yeedart.dart';

class YeelightConnectorConjecture extends VendorConnectorConjectureService {
  factory YeelightConnectorConjecture() {
    return _instance;
  }

  YeelightConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.yeelight,
          mdnsVendorUniqueTypes: ['YL'],
          mdnsTypes: ['_hap._tcp'],
        ) {
    customeSearch();
  }

  static final YeelightConnectorConjecture _instance =
      YeelightConnectorConjecture._singletonContractor();

  // TODO: Ping search is broken on Android https://github.com/osociety/network_tools_flutter/issues/31
  // Delete this method after it get fixed
  Future customeSearch() async {
    if (!Platform.isAndroid) {
      return;
    }

    final DeviceEntityBase entity = GenericUnsupportedDE.empty();

    while (true) {
      final responses = await Yeelight.discover();
      if (responses.isEmpty) {
        return HashMap();
      }

      final HashMap<String, DeviceEntityBase> enitityList = HashMap();
      for (final DiscoveryResponse yeelightDevice in responses) {
        final HashMap<String, DeviceEntityBase> addDevice =
            YeelightHelpers.addDiscoveredDevice(
          yeelightDevice: yeelightDevice,
          entity: entity,
        );
        enitityList.addAll(addDevice);
      }

      if (enitityList.isEmpty) {
        return null;
      }
      enitityList.removeWhere((key, value) => vendorEntities.containsKey(key));

      if (enitityList.isEmpty) {
        return HashMap();
      }

      icLogger.i('New $vendorsAndServices entities got added');

      vendorEntities.addAll(enitityList);
      VendorsConnectorConjecture().customeSearch(enitityList);
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  /// Make sure that it will activate discoverNewDevices only once
  bool searchStarted = false;

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async {
    final responses = await Yeelight.discover();
    if (responses.isEmpty) {
      return HashMap();
    }

    final HashMap<String, DeviceEntityBase> enitityList = HashMap();
    for (final DiscoveryResponse yeelightDevice in responses) {
      final HashMap<String, DeviceEntityBase> addDevice =
          YeelightHelpers.addDiscoveredDevice(
        yeelightDevice: yeelightDevice,
        entity: entity,
      );
      enitityList.addAll(addDevice);
    }
    return enitityList;
  }
}
