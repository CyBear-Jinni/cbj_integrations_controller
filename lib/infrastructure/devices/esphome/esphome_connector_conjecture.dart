import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_light/esphome_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_switch/esphome_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_entity.dart';

class EspHomeConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory EspHomeConnectorConjecture() {
    return _instance;
  }

  EspHomeConnectorConjecture._singletonContractor();

  static final EspHomeConnectorConjecture _instance =
      EspHomeConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.espHome;

  @override
  final List<String> mdnsTypes = ['_esphomelib._tcp'];

  static String? espHomeDevicePass;

  Map<String, DeviceEntityAbstract> get getAllCompanyDevices => vendorEntities;

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
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    if (espHomeDevicePass == null) {
      icLogger.w('ESPHome device got found but missing a password, please add '
          'password for it in the app');
      return null;
    }

    final List<DeviceEntityAbstract> espDevice =
        await EspHomeHelpers.addDiscoveredEntities(
      entity: entity,
      devicePassword: espHomeDevicePass!,
    );

    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in espDevice) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
          MapEntry(entityAsDevice.entityUniqueId.getOrCrash(), entityAsDevice);
      addedDevice.addEntries([deviceAsEntry]);
      vendorEntities.addEntries([deviceAsEntry]);

      icLogger.i(
        'New ESPHome devices name:${entityAsDevice.cbjEntityName.getOrCrash()}',
      );
    }
    // Save state locally so that nodeRED flows will not get created again
    // after restart
    ISavedDevicesRepo.instance.saveAndActivateSmartDevicesToDb();
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract espHomeDE,
  ) async {
    final DeviceEntityAbstract? device =
        vendorEntities[espHomeDE.entityUniqueId.getOrCrash()];

    if (device != null) {
      device.executeDeviceAction(newEntity: espHomeDE);
    } else {
      icLogger.w('ESPHome device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericLightDE) {
      nonGenericDevice = EspHomeLightEntity.fromGeneric(deviceEntity);
    } else if (deviceEntity is GenericSwitchDE) {
      nonGenericDevice = EspHomeSwitchEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('EspHome device could not get loaded from the server');
      return;
    }

    vendorEntities.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }
}
