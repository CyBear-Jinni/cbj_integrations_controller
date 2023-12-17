import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_devices_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device/cbj_smart_device_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_computer_entity/generic_smart_computer_entity.dart';

class CbjDevicesConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory CbjDevicesConnectorConjecture() {
    return _instance;
  }

  CbjDevicesConnectorConjecture._singletonContractor();

  static final CbjDevicesConnectorConjecture _instance =
      CbjDevicesConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices =>
      VendorsAndServices.cbjDeviceSmartEntity;

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    final String? hostName = entity.deviceHostName.getOrCrash();
    if (hostName == null) {
      return null;
    }
    for (final DeviceEntityAbstract savedDevice in vendorEntities.values) {
      if ((savedDevice is CbjSmartComputerEntity) &&
          hostName == savedDevice.entityUniqueId.getOrCrash()) {
        return null;
      } else if (hostName == savedDevice.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'Cbj device type supported but implementation is missing here',
        );
      }
    }

    final List<CbjSmartDeviceInfo?> componentsInDevice =
        await getAllComponentsOfDevice(entity);
    final String address = entity.deviceLastKnownIp.getOrCrash()!;
    final List<DeviceEntityAbstract> devicesList =
        CbjDevicesHelpers.addDiscoveredDevice(
      componentsInDevice: componentsInDevice,
      deviceAddress: address,
    );
    if (devicesList.isEmpty) {
      return null;
    }

    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in devicesList) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
        entityAsDevice.deviceCbjUniqueId.getOrCrash(),
        entityAsDevice,
      );

      addedDevice.addEntries([deviceAsEntry]);
      vendorEntities.addEntries([deviceAsEntry]);

      icLogger.t(
        'New Cbj Smart Device name:${entityAsDevice.cbjEntityName.getOrCrash()}',
      );
    }
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract cbjDevicesDE,
  ) async {
    final DeviceEntityAbstract? device =
        vendorEntities[cbjDevicesDE.entityUniqueId.getOrCrash()];

    // if (device == null) {
    //   setTheSameDeviceFromAllDevices(cbjDevicesDE);
    //   device =
    //   companyDevices[cbjDevicesDE.entityUniqueId.getOrCrash();
    // }

    if (device != null && (device is CbjSmartComputerEntity)) {
      device.executeDeviceAction(newEntity: cbjDevicesDE);
    } else {
      icLogger.w('CbjDevices device type ${device.runtimeType} does not exist');
    }
  }
  //
  // // Future<void> setTheSameDeviceFromAllDevices(
  // //   DeviceEntityAbstract cbjDevicesDE,
  // // ) async {
  // //   final String deviceEntityUniqueId = cbjDevicesDE.entityUniqueId.getOrCrash();
  // //   for(a)
  // // }

  Future<List<CbjSmartDeviceInfo?>> getAllComponentsOfDevice(
    DeviceEntityAbstract entity,
  ) async {
    final List<CbjSmartDeviceInfo?> devicesInfo =
        await CbjSmartDeviceClient.getCbjSmartDeviceHostDevicesInfo(entity);
    return devicesInfo;
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericSmartComputerDE) {
      nonGenericDevice = CbjSmartComputerEntity.fromGeneric(deviceEntity);
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
  Future<HashMap<String, DeviceEntityAbstract>> convertToVendorDevice(
    DeviceEntityAbstract entity,
  ) async =>
      HashMap();
}
