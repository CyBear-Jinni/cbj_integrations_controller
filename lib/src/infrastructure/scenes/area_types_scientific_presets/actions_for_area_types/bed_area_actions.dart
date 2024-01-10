import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/scene/scene_cbj_failures.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';
import 'package:dartz/dartz.dart';

class BedAreaAreaAction {
  Future<Either<SceneCbjFailure, Map<String, String>>> bedAreaSleepDeviceAction(
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
          CommonDevicesScenesPresetsForDevices.blindsDownPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.boiler:
        break;
      case EntityTypes.dimmableLight:
        // TODO: Turn off dim light in case it turned on in the night.
        break;
      case EntityTypes.light:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.lightOffPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.printer:
        // TODO: Postpone maintenance.
        break;
      case EntityTypes.rgbwLights:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.rgbwLightOffPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.securityCamera:
        // TODO: Handle this case.
        break;
      case EntityTypes.smartPlug:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.smartPlugOffPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.smartTV:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.smartTvOffPreset(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.switch_:
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.switchOffPreset(
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
        actionsList.addEntries([
          CommonDevicesScenesPresetsForDevices.smartComputerSuspend(
            deviceEntity,
            brokerNodeId,
          ),
        ]);
      case EntityTypes.ac:
      // TODO: Handle this case.
    }
    return right(actionsList);
  }
}
