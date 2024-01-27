import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';

class CommonDevicesScenesPresetsForDevices {
  /// TODO: add TypeNotSupported preset

  /// Light preset

  static List<RequestActionObject> lightOnPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightSwitchState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> lightOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightSwitchState,
          actionType: EntityActions.off,
        ),
      ];

  static List<RequestActionObject> lightOffGradualyPreset(String entityId) {
    int brightness = 40;
    const int brightnessReduction = 2;
    const int totalActionDuration = 600000; // 10 minutes
    final int delayDuration =
        totalActionDuration ~/ (brightness ~/ brightnessReduction);

    final List<RequestActionObject> requestList = [];

    while (brightness > 0) {
      requestList.add(
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightBrightness,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.brightness: brightness}),
        ),
      );
      requestList.add(
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.delay,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.duration: delayDuration}),
        ),
      );
      brightness -= brightnessReduction;
    }
    requestList.add(
      RequestActionObject(
        entityIds: HashSet.from([entityId]),
        property: EntityProperties.lightSwitchState,
        actionType: EntityActions.off,
      ),
    );

    return requestList;
  }

  /// Blinds preset

  static List<RequestActionObject> blindsDownPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.blindsSwitchState,
          actionType: EntityActions.moveDown,
        ),
      ];

  static List<RequestActionObject> blindsUpPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.blindsSwitchState,
          actionType: EntityActions.moveUp,
        ),
      ];

  static List<RequestActionObject> blindsStopPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.blindsSwitchState,
          actionType: EntityActions.stop,
        ),
      ];

  /// Boiler preset

  static List<RequestActionObject> boilerOnPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.boilerSwitchState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> boilerOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.boilerSwitchState,
          actionType: EntityActions.off,
        ),
      ];

  /// TODO: Add Button preset
  /// TODO: Add ButtonWithLight preset
  /// TODO: Add Hub preset
  /// TODO: Add PhoneApp preset
  /// TODO: Add ComputerApp preset
  /// TODO: Add BrowserApp preset

  /// Switch_ preset

  static List<RequestActionObject> switchOnPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.switchState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> switchOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.switchState,
          actionType: EntityActions.off,
        ),
      ];

  /// TODO: Add DimmableLight preset
  /// TODO: Add CctLight preset
  /// TODO: Add RgbLights preset

  /// RgbwLights preset

  static List<RequestActionObject> rgbLightOrangePreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorTemperature,
          actionType: EntityActions.changeTemperature,
          value: HashMap.from({ActionValues.colorTemperature: 2500}),
        ),
      ];

  static List<RequestActionObject> rgbLightWhitePreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorTemperature,
          actionType: EntityActions.changeTemperature,
          value: HashMap.from({ActionValues.colorTemperature: 5400}),
        ),
      ];

  static List<RequestActionObject> rgbLightBluePreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorTemperature,
          actionType: EntityActions.changeTemperature,
          value: HashMap.from({ActionValues.colorTemperature: 8800}),
        ),
      ];

  static List<RequestActionObject> rgbLightMaxBrightnessPreset(
    String entityId,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightBrightness,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.brightness: 100}),
        ),
      ];

  /// TODO: Add RgbcctLights preset

  /// TODO: Add SmartTV preset

  static List<RequestActionObject> smartTvOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartTvSwitchState,
          actionType: EntityActions.off,
        ),
      ];

  static List<RequestActionObject> smartTvOnPreset(
    String entityId,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartTvSwitchState,
          actionType: EntityActions.on,
        ),
      ];

  /// TODO: Add SmartSpeakers preset
  /// TODO: Add CoffeeMachine preset
  /// TODO: Add Kettle preset
  /// TODO: Add Teapot preset
  /// TODO: Add WashingMachine preset
  /// TODO: Add Dishwasher preset
  /// TODO: Add Toaster preset
  /// TODO: Add VacuumCleaner preset
  /// TODO: Add Refrigerator preset
  /// TODO: Add Bed preset
  /// TODO: Add Oven preset
  /// TODO: Add AirConditioner preset
  /// TODO: Add SmartWatch preset
  /// TODO: Add SmartWaterBottle preset
  /// TODO: Add Microphone preset
  /// TODO: Add SecurityCamera preset
  /// TODO: Add BabyMonitor preset
  /// TODO: Add MotionSensor preset
  /// TODO: Add TemperatureSensor preset
  /// TODO: Add HumiditySensor preset
  /// TODO: Add LightSensor preset
  /// TODO: Add SoundSensor preset
  /// TODO: Add SmokeSensor preset
  /// TODO: Add SmokeDetector preset
  /// TODO: Add OxygenSensor preset

  /// SmartPlug preset

  static List<RequestActionObject> smartPlugOnPreset(
    String entityId,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartPlugState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> smartPlugOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartPlugState,
          actionType: EntityActions.off,
        ),
      ];

  static List<RequestActionObject> smartComputerSuspend(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartComputerSuspendState,
          actionType: EntityActions.suspend,
        ),
      ];

  /// TODO: Add Printer preset
  /// TODO: Add Scanner preset
  /// TODO: Add Printer with scanner preset
}
