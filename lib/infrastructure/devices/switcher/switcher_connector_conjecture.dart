import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_entities/switcher_runner_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_entities/switcher_smart_plug_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_entities/switcher_v2_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_blinds_entity/generic_blinds_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_boiler_entity/generic_boiler_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_plug_entity/generic_smart_plug_entity.dart';
import 'package:switcher_dart/switcher_dart.dart';

class SwitcherConnectorConjecture extends VendorConnectorConjectureService {
  factory SwitcherConnectorConjecture() {
    return _instance;
  }

  SwitcherConnectorConjecture._singletonContractor();

  static final SwitcherConnectorConjecture _instance =
      SwitcherConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices =>
      VendorsAndServices.switcherSmartHome;

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {
    DeviceEntityBase? nonGenericDevice;

    if (deviceEntity is GenericBoilerDE) {
      nonGenericDevice = SwitcherV2Entity.fromGeneric(deviceEntity);
    } else if (deviceEntity is GenericSmartPlugDE) {
      nonGenericDevice = SwitcherSmartPlugEntity.fromGeneric(deviceEntity);
    } else if (deviceEntity is GenericBlindsDE) {
      nonGenericDevice = SwitcherRunnerEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Switcher device could not get loaded from the server');
      return;
    }

    vendorEntities.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }

  List<Stream<DeviceEntityBase?>> bindSocketSearchStream() {
    final List<Stream<DeviceEntityBase?>> bindingStream = [];
    bindingStream.add(
      SwitcherDiscover.discover20002Devices().map(
        (event) => SwitcherHelpers.addDiscoveredDevice(event),
      ),
    );
    bindingStream.add(
      SwitcherDiscover.discover20003Devices().map(
        (event) => SwitcherHelpers.addDiscoveredDevice(event),
      ),
    );
    return bindingStream;
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async =>
      // It is getting converted in bindSocketSearchStream
      HashMap()
        ..addEntries([MapEntry(entity.deviceCbjUniqueId.getOrCrash(), entity)]);
}
