import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';

class BedAreaAreaAction {
  List<RequestActionObject> bedAreaSleepDeviceAction(
    String entityId,
    EntityTypes entityType,
  ) {
    final List<RequestActionObject> actionsList = [];

    switch (entityType) {
      case EntityTypes.blinds:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.blindsDownPreset(entityId),
        );
      case EntityTypes.boiler:
        break;
      case EntityTypes.printer:
        // TODO: Postpone maintenance.
        break;
      case EntityTypes.light:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.lightOffPreset(entityId),
        );
      case EntityTypes.dimmableLight:
      case EntityTypes.rgbwLights:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.lightOffGradualyPreset(entityId),
        );
      case EntityTypes.securityCamera:
        // TODO: Handle this case.
        break;
      case EntityTypes.smartPlug:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.smartPlugOffPreset(entityId),
        );
      case EntityTypes.smartTV:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.smartTvOffPreset(entityId),
        );
      case EntityTypes.switch_:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.switchOffPreset(entityId),
        );
      case EntityTypes.undefined:
        // TODO: Handle this case.
        break;
      case EntityTypes.emptyEntity:
        // TODO: Handle this case.
        break;
      case EntityTypes.pingEntity:
        // TODO: Handle this case.
        break;
      case EntityTypes.smartComputer:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.smartComputerSuspend(entityId),
        );
      case EntityTypes.ac:
      // TODO: Handle this case.
    }
    return actionsList;
  }
}
