import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_devices_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device/cbj_smart_device_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_computer_entity/generic_smart_computer_entity.dart';

class CbjDevicesConnectorConjecture extends VendorConnectorConjectureService {
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
  Future<HashMap<String, DeviceEntityBase>?> foundEntity(
    DeviceEntityBase entity,
  ) async {
    final String? hostName = entity.deviceHostName.getOrCrash();
    if (hostName == null) {
      return null;
    }
    for (final DeviceEntityBase savedDevice in vendorEntities.values) {
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
    final List<DeviceEntityBase> devicesList =
        CbjDevicesHelpers.addDiscoveredDevice(
      componentsInDevice: componentsInDevice,
      deviceAddress: address,
    );
    if (devicesList.isEmpty) {
      return null;
    }

    final HashMap<String, DeviceEntityBase> addedDevice = HashMap();

    for (final DeviceEntityBase entityAsDevice in devicesList) {
      final MapEntry<String, DeviceEntityBase> deviceAsEntry = MapEntry(
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

  Future<List<CbjSmartDeviceInfo?>> getAllComponentsOfDevice(
    DeviceEntityBase entity,
  ) async {
    final List<CbjSmartDeviceInfo?> devicesInfo =
        await CbjSmartDeviceClient.getCbjSmartDeviceHostDevicesInfo(entity);
    return devicesInfo;
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {
    DeviceEntityBase? nonGenericDevice;

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
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async =>
      HashMap();
}
