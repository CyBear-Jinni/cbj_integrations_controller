import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_1se/yeelight_1se_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:yeedart/yeedart.dart';

class YeelightConnectorConjecture extends VendorConnectorConjectureService {
  factory YeelightConnectorConjecture() {
    return _instance;
  }

  YeelightConnectorConjecture._singletonContractor();

  static final YeelightConnectorConjecture _instance =
      YeelightConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.yeelight;

  @override
  final List<String> mdnsTypes = ['_hap._tcp'];

  @override
  final List<String> uniqueIdentifierNameInMdns = ['YL'];

  /// Make sure that it will activate discoverNewDevices only once
  bool searchStarted = false;

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityBase entity,
  ) async {
    final DeviceEntityBase? device =
        vendorEntities[entity.entityUniqueId.getOrCrash()];

    if (device is Yeelight1SeEntity) {
      device.executeDeviceAction(newEntity: entity);
    } else {
      icLogger.w('Yeelight device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {
    DeviceEntityBase? nonGenericDevice;

    if (deviceEntity is GenericRgbwLightDE) {
      nonGenericDevice = Yeelight1SeEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Switcher device could not get loaded from the server');
      return;
    }

    vendorEntities.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }

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
