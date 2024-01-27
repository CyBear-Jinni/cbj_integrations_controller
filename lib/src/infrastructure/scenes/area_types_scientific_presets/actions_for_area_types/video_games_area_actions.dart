import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';

class VideoGamesAreaAction {
  List<RequestActionObject> videoGamesRgbModDeviceAction(
    String entityId,
    EntityTypes entityType,
  ) {
    final List<RequestActionObject> actionsList = [];

    switch (entityType) {
      case EntityTypes.blinds:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.blindsUpPreset(entityId),
        );
      case EntityTypes.boiler:
        break;
      case EntityTypes.dimmableLight:
        // TODO: Handle this case.
        break;
      case EntityTypes.light:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.lightOnPreset(entityId),
        );
      case EntityTypes.printer:
        // TODO: Handle this case.
        break;
      case EntityTypes.rgbwLights:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.rgbLightOrangePreset(entityId),
        );
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.rgbLightMaxBrightnessPreset(
            entityId,
          ),
        );
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.lightOnPreset(entityId),
        );
      case EntityTypes.securityCamera:
        // TODO: Handle this case.
        break;
      case EntityTypes.smartPlug:
        break;
      case EntityTypes.smartTV:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.smartTvOffPreset(entityId),
        );
      case EntityTypes.switch_:
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.switchOnPreset(entityId),
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
        // TODO: Handle this case.
        break;
      case EntityTypes.ac:
      // TODO: Handle this case.
    }
    return actionsList;
  }
}
