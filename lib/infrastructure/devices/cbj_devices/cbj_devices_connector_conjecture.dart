import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_devices_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device/cbj_smart_device_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_computer_device/generic_smart_computer_entity.dart';

class CbjDevicesConnectorConjecture
    implements AbstractCompanyConnectorConjecture {
  factory CbjDevicesConnectorConjecture() {
    return _instance;
  }

  CbjDevicesConnectorConjecture._singletonContractor();

  static final CbjDevicesConnectorConjecture _instance =
      CbjDevicesConnectorConjecture._singletonContractor();

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  Future<List<DeviceEntityAbstract>> addNewDeviceByHostInfo({
    required GenericGenericUnsupportedDE entity,
  }) async {
    final String hostName = entity.deviceHostName.getOrCrash();

    for (final DeviceEntityAbstract savedDevice in companyDevices.values) {
      if ((savedDevice is CbjSmartComputerEntity) &&
          hostName == savedDevice.entityUniqueId.getOrCrash()) {
        return [];
      } else if (hostName == savedDevice.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'Cbj device type supported but implementation is missing here',
        );
      }
    }

    final List<CbjSmartDeviceInfo?> componentsInDevice =
        await getAllComponentsOfDevice(entity);
    final String address = entity.deviceLastKnownIp.getOrCrash();
    final List<DeviceEntityAbstract> devicesList =
        CbjDevicesHelpers.addDiscoveredDevice(
      componentsInDevice: componentsInDevice,
      deviceAddress: address,
    );
    if (devicesList.isEmpty) {
      return [];
    }

    for (final DeviceEntityAbstract entityAsDevice in devicesList) {
      final DeviceEntityAbstract deviceToAdd = CompaniesConnectorConjecture()
          .addDiscoveredDeviceToHub(entityAsDevice);

      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
          MapEntry(deviceToAdd.uniqueId.getOrCrash(), deviceToAdd);

      companyDevices.addEntries([deviceAsEntry]);

      icLogger.t(
        'New Cbj Smart Device name:${entityAsDevice.cbjEntityName.getOrCrash()}',
      );
    }
    return devicesList;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract cbjDevicesDE,
  ) async {
    final DeviceEntityAbstract? device =
        companyDevices[cbjDevicesDE.entityUniqueId.getOrCrash()];

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
    GenericGenericUnsupportedDE entity,
  ) async {
    final List<CbjSmartDeviceInfo?> devicesInfo =
        await CbjSmartDeviceClient.getCbjSmartDeviceHostDevicesInfo(entity);
    return devicesInfo;
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericSmartComputerDE) {
      nonGenericDevice = CbjSmartComputerEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Switcher device could not get loaded from the server');
      return;
    }

    companyDevices.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }
}
