import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_entities/switcher_runner_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_entities/switcher_smart_plug_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_entities/switcher_v2_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_blinds_entity/generic_blinds_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_boiler_entity/generic_boiler_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_plug_entity/generic_smart_plug_entity.dart';
import 'package:switcher_dart/switcher_dart.dart';

class SwitcherConnectorConjecture extends AbstractVendorConnectorConjecture {
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
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    for (final DeviceEntityAbstract savedDevice in vendorEntities.values) {
      if ((savedDevice is SwitcherV2Entity ||
              savedDevice is SwitcherRunnerEntity ||
              savedDevice is SwitcherSmartPlugEntity) &&
          entity.deviceCbjUniqueId.getOrCrash() ==
              savedDevice.deviceCbjUniqueId.getOrCrash()) {
        return HashMap();
      } else if (savedDevice is GenericBoilerDE ||
          savedDevice is GenericBlindsDE &&
              entity.deviceCbjUniqueId.getOrCrash() ==
                  savedDevice.deviceCbjUniqueId.getOrCrash()) {
        /// Device exist as generic and needs to get converted to non generic type for this vendor
        break;
      } else if (entity.deviceCbjUniqueId.getOrCrash() ==
          savedDevice.deviceCbjUniqueId.getOrCrash()) {
        icLogger.w(
          'Switcher device type supported but implementation is missing here',
        );
        break;
      }
    }

    final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
        MapEntry(entity.deviceCbjUniqueId.getOrCrash(), entity);
    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    vendorEntities.addEntries([deviceAsEntry]);
    addedDevice.addEntries([deviceAsEntry]);

    icLogger.t(
      'New switcher devices name: ${entity.entityOriginalName.getOrCrash()}',
    );
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract switcherDE,
  ) async {
    final DeviceEntityAbstract? device =
        vendorEntities[switcherDE.entityUniqueId.getOrCrash()];

    // if (device == null) {
    //   setTheSameDeviceFromAllDevices(switcherDE);
    //   device =
    //   companyDevices[switcherDE.entityUniqueId.getOrCrash();
    // }

    if (device != null &&
        (device is SwitcherV2Entity ||
            device is SwitcherRunnerEntity ||
            device is SwitcherSmartPlugEntity)) {
      // device.executeDeviceAction(newEntity: switcherDE);
    } else {
      icLogger.w('Switcher device type ${device.runtimeType} does not exist');
    }
  }

  // Future<void> setTheSameDeviceFromAllDevices(
  //   DeviceEntityAbstract switcherDE,
  // ) async {
  //   final String deviceEntityUniqueId = switcherDE.entityUniqueId.getOrCrash();
  //   for(a)
  // }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

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

  List<Stream<DeviceEntityAbstract?>> bindSocketSearchStream() {
    final List<Stream<DeviceEntityAbstract?>> bindingStream = [];
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
}
