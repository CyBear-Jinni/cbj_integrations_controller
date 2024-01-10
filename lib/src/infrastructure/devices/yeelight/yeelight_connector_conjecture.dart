import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/yeelight/yeelight_helpers.dart';
import 'package:yeedart/yeedart.dart';

class YeelightConnectorConjecture extends VendorConnectorConjectureService {
  factory YeelightConnectorConjecture() {
    return _instance;
  }

  YeelightConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.yeelight,
          displayName: 'Yeelight',
          imageUrl:
              'https://play-lh.googleusercontent.com/bteU9OSFF9z596eUOkGgM3XpWF2-b1VsKvmwWFitaI4qMwVPmx3lS09fHFDx8-CX3Q=s180',
          uniqueIdentifierNameInMdns: ['YL'],
          mdnsList: ['_hap._tcp'],
          deviceHostNameLowerCaseList: ['yeelink'],
        );

  static final YeelightConnectorConjecture _instance =
      YeelightConnectorConjecture._singletonContractor();

  /// Make sure that it will activate discoverNewDevices only once
  bool searchStarted = false;

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
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
