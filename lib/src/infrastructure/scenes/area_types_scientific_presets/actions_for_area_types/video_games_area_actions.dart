import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/scene/scene_cbj_failures.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';
import 'package:dartz/dartz.dart';

class VideoGamesAreaAction {
  Future<Either<SceneCbjFailure, Map<String, String>>>
      videoGamesRgbModDeviceAction(
    DeviceEntityBase deviceEntity,
    String brokerNodeId,
  ) async {
    final EntityTypes deviceType = EntityTypes.values.firstWhere(
      (element) => element.name == deviceEntity.entityTypes.getOrCrash(),
    );

    final Map<String, String> actionsList = <String, String>{};

    switch (deviceType) {
      case EntityTypes.blinds:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.blindsUpPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.boiler:
        break;
      case EntityTypes.browserApp:
        // TODO: Handle this case.
        break;
      case EntityTypes.button:
        // TODO: Handle this case.
        break;
      case EntityTypes.cctLight:
        // TODO: Handle this case.
        break;
      case EntityTypes.computerApp:
        // TODO: Handle this case.
        break;
      case EntityTypes.dimmableLight:
        // TODO: Handle this case.
        break;
      case EntityTypes.hub:
        // TODO: Handle this case.
        break;
      case EntityTypes.light:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.lightOnPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.phoneApp:
        // TODO: Handle this case.
        break;
      case EntityTypes.printer:
        // TODO: Handle this case.
        break;
      case EntityTypes.printerWithScanner:
        // TODO: Handle this case.
        break;
      case EntityTypes.rgbLights:
        // TODO: Handle this case.
        break;
      case EntityTypes.rgbcctLights:
        // TODO: Handle this case.
        break;
      case EntityTypes.rgbwLights:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.rgbLightOrangePreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.rgbLightMaxBrightnessPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.rgbwLightOnPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      // TODO: add light color changing in cycles
      case EntityTypes.scanner:
        // TODO: Handle this case.
        break;
      case EntityTypes.securityCamera:
        // TODO: Handle this case.
        break;
      case EntityTypes.smartPlug:
        break;
      case EntityTypes.smartTV:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.smartTvOffPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.switch_:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.switchOnPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.smartTypeNotSupported:
        // TODO: Handle this case.
        break;
      case EntityTypes.emptyEntity:
        // TODO: Handle this case.
        break;
      case EntityTypes.pingEntity:
        // TODO: Handle this case.
        break;
      case EntityTypes.smartComputer:
        // TODO: Handle this case.
        break;
      case EntityTypes.playerEntity:
        // TODO: Handle this case.
        break;
      case EntityTypes.routerEntity:
        // TODO: Handle this case.
        break;
      case EntityTypes.voiceAssistant:
        // TODO: Handle this case.
        break;
    }
    return right(actionsList);
  }
}
