import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lifx/lifx_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lifx/lifx_white/lifx_white_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LifxConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory LifxConnectorConjecture() {
    return _instance;
  }

  LifxConnectorConjecture._singletonContractor();

  static final LifxConnectorConjecture _instance =
      LifxConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.lifx;

  // TODO: Convert search from cloud into connector conjector
  Future<String> accountLogin(GenericLifxLoginDE genericLifxLoginDE) async {
    lifxClient = LIFXClient(genericLifxLoginDE.lifxApiKey.getOrCrash());
    _discoverNewDevices();
    return 'Success';
  }

  LIFXClient? lifxClient;

  Future<void> _discoverNewDevices() async {
    while (true) {
      try {
        final Iterable<LIFXBulb> lights =
            await lifxClient!.listLights(const Selector());

        for (final LIFXBulb lifxDevice in lights) {
          CoreUniqueId? tempCoreUniqueId;
          bool deviceExist = false;
          for (final DeviceEntityAbstract savedDevice
              in vendorEntities.values) {
            if (savedDevice is LifxWhiteEntity &&
                lifxDevice.id == savedDevice.entityUniqueId.getOrCrash()) {
              deviceExist = true;
              break;
            } else if (savedDevice is GenericLightDE &&
                lifxDevice.id == savedDevice.entityUniqueId.getOrCrash()) {
              tempCoreUniqueId = savedDevice.uniqueId;
              break;
            } else if (lifxDevice.id ==
                savedDevice.entityUniqueId.getOrCrash()) {
              icLogger.w(
                'Lifx device type supported but implementation is missing here',
              );
              break;
            }
          }
          if (!deviceExist) {
            final DeviceEntityAbstract? addDevice =
                LifxHelpers.addDiscoveredDevice(
              lifxDevice: lifxDevice,
              uniqueDeviceId: tempCoreUniqueId,
            );

            if (addDevice == null) {
              continue;
            }

            final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
                MapEntry(addDevice.entityUniqueId.getOrCrash(), addDevice);

            vendorEntities.addEntries([deviceAsEntry]);

            icLogger.i('New Lifx device got added');
          }
        }
        await Future.delayed(const Duration(minutes: 3));
      } catch (e) {
        icLogger.e('Error discover in Lifx\n$e');
        await Future.delayed(const Duration(minutes: 1));
      }
    }
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract lifxDE,
  ) async {
    final DeviceEntityAbstract? device =
        vendorEntities[lifxDE.entityUniqueId.getOrCrash()];

    if (device is LifxWhiteEntity) {
      device.executeDeviceAction(newEntity: lifxDE);
    } else {
      icLogger.w('Lifx device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericDimmableLightDE) {
      nonGenericDevice = LifxWhiteEntity.fromGeneric(deviceEntity);
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
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    return null;
  }
}
