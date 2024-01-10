import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/scene/scene_cbj_failures.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';
import 'package:dartz/dartz.dart';

class StudyAreaAreaAction {
  Future<Either<SceneCbjFailure, Map<String, String>>> studyAreaDeviceAction(
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
      case EntityTypes.dimmableLight:
        // TODO: Handle this case.
        break;
      case EntityTypes.light:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.lightOnPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.printer:
        // TODO: Handle this case.
        break;
      case EntityTypes.rgbwLights:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.rgbLightWhitePreset(
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
        return right(actionsList);
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
      case EntityTypes.ac:
      // TODO: Handle this case.
    }
    return right(actionsList);
  }
}
