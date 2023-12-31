import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_device_dtos.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericLight that exist inside a computer, the
/// implementations will be actual GenericLight like blinds lights and more
class GenericRgbwLightDE extends DeviceEntityBase {
  /// All public field of GenericLight entity
  GenericRgbwLightDE({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjDeviceVendor,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.stateMassage,
    required super.senderDeviceOs,
    required super.senderDeviceModel,
    required super.senderId,
    required super.compUuid,
    required super.entityStateGRPC,
    required super.powerConsumption,
    required super.deviceUniqueId,
    required super.devicePort,
    required super.deviceLastKnownIp,
    required super.deviceHostName,
    required super.deviceMdns,
    required super.srvResourceRecord,
    required super.ptrResourceRecord,
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.deviceCbjUniqueId,
    required this.lightSwitchState,
    required this.lightColorTemperature,
    required this.lightColorAlpha,
    required this.lightColorHue,
    required this.lightColorSaturation,
    required this.lightColorValue,
    required this.lightBrightness,
  }) : super(
          entityTypes: EntityType.type(EntityTypes.rgbwLights),
        );

  /// Empty instance of GenericLightEntity
  factory GenericRgbwLightDE.empty() => GenericRgbwLightDE(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(''),
        cbjEntityName: CbjEntityName(''),
        entityOriginalName: EntityOriginalName(''),
        deviceOriginalName: DeviceOriginalName(''),
        entityStateGRPC: EntityState.state(EntityStateGRPC.stateNotSupported),
        senderDeviceOs: DeviceSenderDeviceOs(''),
        senderDeviceModel: DeviceSenderDeviceModel(''),
        stateMassage: DeviceStateMassage(''),
        senderId: DeviceSenderId(),
        cbjDeviceVendor: CbjDeviceVendor(''),
        deviceVendor: DeviceVendor(null),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
        deviceUniqueId: DeviceUniqueId(''),
        devicePort: DevicePort(''),
        deviceLastKnownIp: DeviceLastKnownIp(''),
        deviceHostName: DeviceHostName(''),
        deviceMdns: DeviceMdns(''),
        srvResourceRecord: DeviceSrvResourceRecord(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        compUuid: DeviceCompUuid(''),
        powerConsumption: DevicePowerConsumption(''),
        devicesMacAddress: DevicesMacAddress(''),
        entityKey: EntityKey(''),
        requestTimeStamp: RequestTimeStamp(''),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
        deviceCbjUniqueId: CoreUniqueId(),
        lightSwitchState:
            GenericRgbwLightSwitchState(EntityActions.off.toString()),
        lightColorTemperature: GenericRgbwLightColorTemperature(''),
        lightBrightness: GenericRgbwLightBrightness(''),
        lightColorAlpha: GenericRgbwLightColorAlpha(''),
        lightColorHue: GenericRgbwLightColorHue(''),
        lightColorSaturation: GenericRgbwLightColorSaturation(''),
        lightColorValue: GenericRgbwLightColorValue(''),
      );

  /// State of the light on/off
  GenericRgbwLightSwitchState lightSwitchState;

  /// Color temperature in int
  GenericRgbwLightColorTemperature lightColorTemperature;

  /// Color alpha in double
  GenericRgbwLightColorAlpha lightColorAlpha;

  /// Color hue in double
  GenericRgbwLightColorHue lightColorHue;

  /// Color saturation in double
  GenericRgbwLightColorSaturation lightColorSaturation;

  /// Color value in double
  GenericRgbwLightColorValue lightColorValue;

  /// Brightness 0-100%
  GenericRgbwLightBrightness lightBrightness;

  int sendNewTemperatureColorEachMilliseconds = 200;
  bool doesWaitingToSendTemperatureColorRequest = false;

  int sendNewHsvColorEachMilliseconds = 200;
  bool doesWaitingToSendHsvColorRequest = false;

  int sendNewBrightnessEachMilliseconds = 200;
  bool doesWaitingToSendBrightnessRequest = false;

  // /// Will return failure if any of the fields failed or return unit if fields
  // /// have legit values
  Option<CoreFailure<dynamic>> get failureOption =>
      cbjEntityName.value.fold((f) => some(f), (_) => none());

  // return body.failureOrUnit
  //     .andThen(todos.failureOrUnit)
  //     .andThen(
  //       todos
  //           .getOrCrash()
  //           // Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
  //           .map((todoItem) => todoItem.failureOption)
  //           .filter((o) => o.isSome())
  //           // If we can't get the 0th element, the list is empty. In such a case, it's valid.
  //           .getOrElse(0, (_) => none())
  //           .fold(() => right(unit), (f) => left(f)),
  //     )
  //     .fold((f) => some(f), (_) => none());
  // }

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() {
    return GenericRgbwLightSwitchState.rgbwLightValidActions();
  }

  @override
  DeviceEntityDtoBase toInfrastructure() {
    return GenericRgbwLightDeviceDtos(
      deviceDtoClass: (GenericRgbwLightDeviceDtos).toString(),
      id: uniqueId.getOrCrash(),
      entityUniqueId: entityUniqueId.getOrCrash(),
      cbjEntityName: cbjEntityName.getOrCrash(),
      entityOriginalName: entityOriginalName.getOrCrash(),
      deviceOriginalName: deviceOriginalName.getOrCrash(),
      entityStateGRPC: entityStateGRPC.getOrCrash(),
      stateMassage: stateMassage.getOrCrash(),
      senderDeviceOs: senderDeviceOs.getOrCrash(),
      senderDeviceModel: senderDeviceModel.getOrCrash(),
      senderId: senderId.getOrCrash(),
      entityTypes: entityTypes.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      cbjDeviceVendor: cbjDeviceVendor.getOrCrash(),
      deviceVendor: deviceVendor.getOrCrash(),
      deviceNetworkLastUpdate: deviceNetworkLastUpdate.getOrCrash(),
      powerConsumption: powerConsumption.getOrCrash(),
      deviceUniqueId: deviceUniqueId.getOrCrash(),
      devicePort: devicePort.getOrCrash(),
      deviceLastKnownIp: deviceLastKnownIp.getOrCrash(),
      deviceHostName: deviceHostName.getOrCrash(),
      deviceMdns: deviceMdns.getOrCrash(),
      devicesMacAddress: devicesMacAddress.getOrCrash(),
      srvResourceRecord: srvResourceRecord.getOrCrash(),
      ptrResourceRecord: ptrResourceRecord.getOrCrash(),
      entityKey: entityKey.getOrCrash(),
      requestTimeStamp: requestTimeStamp.getOrCrash(),
      lastResponseFromDeviceTimeStamp:
          lastResponseFromDeviceTimeStamp.getOrCrash(),
      deviceCbjUniqueId: deviceCbjUniqueId.getOrCrash(),
      lightSwitchState: lightSwitchState.getOrCrash(),
      lightColorTemperature: lightColorTemperature.getOrCrash(),
      lightBrightness: lightBrightness.getOrCrash(),
      lightColorAlpha: lightColorAlpha.getOrCrash(),
      lightColorHue: lightColorHue.getOrCrash(),
      lightColorSaturation: lightColorSaturation.getOrCrash(),
      lightColorValue: lightColorValue.getOrCrash(),
    );
  }

  @override
  Future<Either<CoreFailure<dynamic>, Unit>> executeAction({
    required EntityProperties property,
    required EntityActions action,
    HashMap<ActionValues, dynamic>? values,
  }) async {
    if (property == EntityProperties.lightBrightness &&
        values != null &&
        values[ActionValues.brightness] != null) {
      final dynamic brightness = values[ActionValues.brightness];
      if (brightness is! int) {
        return const Left(CoreFailure.unexpected());
      }
      return setBrightness(brightness);
    }

    switch (action) {
      case EntityActions.on:
        return turnOnLight();
      case EntityActions.off:
        return turnOffLight();
      case EntityActions.changeTemperature:
        final dynamic value = values?[ActionValues.temperature];
        if (value is! int) {
          return const Left(CoreFailure.unexpected());
        }
        return changeColorTemperature(value);
      case EntityActions.hsvColor:
        final dynamic alpha = values?[ActionValues.alpha];
        final dynamic hue = values?[ActionValues.hue];
        final dynamic saturation = values?[ActionValues.saturation];
        final dynamic value = values?[ActionValues.value];

        if (alpha is! double ||
            hue is! double ||
            saturation is! double ||
            value is! double) {
          return const Left(CoreFailure.unexpected());
        }
        return changeColorHsv(
          alpha: alpha,
          hue: hue,
          saturation: saturation,
          value: value,
        );
      // TODO: add support for json values
      // return await changeColorHsv(
      //       lightColorAlphaNewValue: newEntity.lightColorAlpha.getOrCrash(),
      //       lightColorHueNewValue: newEntity.lightColorHue.getOrCrash(),
      //       lightColorSaturationNewValue:
      //           newEntity.lightColorSaturation.getOrCrash(),
      //       lightColorValueNewValue: newEntity.lightColorValue.getOrCrash(),
      //     );
      default:
        break;
    }

    return super
        .executeAction(property: property, action: action, values: values);
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOnLight() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOffLight() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> changeColorTemperature(
    int temperature,
  ) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> changeColorHsv({
    required double value,
    required double hue,
    required double saturation,
    required double alpha,
  }) async =>
      pleaseOverrideMessage();

  @override
  bool replaceActionIfExist(String action) {
    if (GenericRgbwLightSwitchState.rgbwLightValidActions().contains(action)) {
      lightSwitchState = GenericRgbwLightSwitchState(action);
      return true;
    }
    return false;
  }

  @override
  List<EntityProperties> getListOfPropertiesToChange() {
    return [
      EntityProperties.lightSwitchState,
      EntityProperties.lightColorTemperature,
      EntityProperties.lightColorAlpha,
      EntityProperties.lightColorHue,
      EntityProperties.lightColorSaturation,
      EntityProperties.lightColorValue,
      EntityProperties.lightBrightness,
    ];
  }
}
