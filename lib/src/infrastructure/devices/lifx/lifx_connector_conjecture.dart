import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_helpers.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_white/lifx_white_entity.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LifxConnectorConjecture extends VendorConnectorConjectureService {
  factory LifxConnectorConjecture() {
    return _instance;
  }

  LifxConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.lifx,
          displayName: 'Lifx',
          imageUrl:
              'https://play-lh.googleusercontent.com/k61DT9oYt_BPdzjAFokLY5e-He-YSl7-eZHeieaVO45XDAwQ6ebegsS_ZsQytca2zWM=s180',
          urlToLoginCredantials: 'https://cloud.lifx.com/',
          loginType: VendorLoginTypes.apiKey,
        );

  static final LifxConnectorConjecture _instance =
      LifxConnectorConjecture._singletonContractor();

  // TODO: Convert search from cloud into connector conjector

  @override
  Future loginApiKey(String value) async {
    lifxClient = LIFXClient(value);
    _discoverNewDevices();
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
          for (final DeviceEntityBase savedDevice in vendorEntities.values) {
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
            final DeviceEntityBase? addDevice = LifxHelpers.addDiscoveredDevice(
              lifxDevice: lifxDevice,
              uniqueDeviceId: tempCoreUniqueId,
            );

            if (addDevice == null) {
              continue;
            }

            final MapEntry<String, DeviceEntityBase> deviceAsEntry =
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
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity,
  ) async =>
      HashMap();
}
