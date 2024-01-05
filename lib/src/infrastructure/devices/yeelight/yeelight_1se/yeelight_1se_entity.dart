import 'dart:async';
import 'dart:io';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:yeedart/yeedart.dart';

class Yeelight1SeEntity extends GenericRgbwLightDE {
  Yeelight1SeEntity({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
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
    required super.lightSwitchState,
    required super.lightColorTemperature,
    required super.lightColorAlpha,
    required super.lightColorHue,
    required super.lightColorSaturation,
    required super.lightColorValue,
    required super.lightBrightness,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.yeelight),
        ) {
    final String? port = devicePort.getOrCrash();
    if (port == null) {
      return;
    }
    api = Device(
      address: InternetAddress(deviceLastKnownIp.getOrCrash()!),
      port: int.parse(port),
    );
  }

  factory Yeelight1SeEntity.fromGeneric(GenericRgbwLightDE genericDevice) {
    return Yeelight1SeEntity(
      uniqueId: genericDevice.uniqueId,
      entityUniqueId: genericDevice.entityUniqueId,
      cbjEntityName: genericDevice.cbjEntityName,
      entityOriginalName: genericDevice.entityOriginalName,
      deviceOriginalName: genericDevice.deviceOriginalName,
      deviceVendor: genericDevice.deviceVendor,
      deviceNetworkLastUpdate: genericDevice.deviceNetworkLastUpdate,
      stateMassage: genericDevice.stateMassage,
      senderDeviceOs: genericDevice.senderDeviceOs,
      senderDeviceModel: genericDevice.senderDeviceModel,
      senderId: genericDevice.senderId,
      compUuid: genericDevice.compUuid,
      entityStateGRPC: genericDevice.entityStateGRPC,
      powerConsumption: genericDevice.powerConsumption,
      deviceUniqueId: genericDevice.deviceUniqueId,
      devicePort: genericDevice.devicePort,
      deviceLastKnownIp: genericDevice.deviceLastKnownIp,
      deviceHostName: genericDevice.deviceHostName,
      deviceMdns: genericDevice.deviceMdns,
      srvResourceRecord: genericDevice.srvResourceRecord,
      ptrResourceRecord: genericDevice.ptrResourceRecord,
      devicesMacAddress: genericDevice.devicesMacAddress,
      entityKey: genericDevice.entityKey,
      requestTimeStamp: genericDevice.requestTimeStamp,
      lastResponseFromDeviceTimeStamp:
          genericDevice.lastResponseFromDeviceTimeStamp,
      lightSwitchState: genericDevice.lightSwitchState,
      deviceCbjUniqueId: genericDevice.deviceCbjUniqueId,
      lightBrightness: genericDevice.lightBrightness,
      lightColorTemperature: genericDevice.lightColorTemperature,
      lightColorAlpha: genericDevice.lightColorAlpha,
      lightColorHue: genericDevice.lightColorHue,
      lightColorSaturation: genericDevice.lightColorSaturation,
      lightColorValue: genericDevice.lightColorValue,
    );
  }

  /// Yeelight package object require to close previews request before new one
  late Device api;

  /// Timer to execute methods with min of 1 seconds between each other
  Timer? executeStateTimer;

  /// How much time to wait between execute of methods
  // TODO: Test if we can lower this number to 1000 and requests do not
  // get denied
  final int sendNewRequestToDeviceEachMilliseconds = 1100;

  /// Fix to differentiate what value to change
  String? lightColorTemperatureLastValue;

  /// Fix to differentiate what value to change
  String? lightColorHueLastValue;

  /// Fix to differentiate what value to change
  String? lightColorSaturationLastValue;

  String? lightBrightnessLastValue;

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericRgbwLightSwitchState(EntityActions.on.toString());
    try {
      await api.turnOn();

      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting turn on\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    try {
      await api.turnOff();

      return right(unit);
    } catch (e) {
      return left(CoreFailure.actionExcecuter(failedValue: e));
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async {
    try {
      await api.setBrightness(
        brightness: int.parse(
          lightBrightness.getOrCrash(),
        ),
        duration: const Duration(milliseconds: 100),
      );

      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting brightness\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> changeColorTemperature({
    required String lightColorTemperatureNewValue,
  }) async {
    try {
      int temperatureInt = int.parse(lightColorTemperatureNewValue);
      if (temperatureInt < 1700) {
        temperatureInt = 1700;
      } else if (temperatureInt > 6500) {
        temperatureInt = 6500;
      }

      lightColorTemperature =
          GenericRgbwLightColorTemperature(temperatureInt.toString());

      _sendChangeColorTemperature();

      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting color temprature\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> changeColorHsv({
    required String lightColorAlphaNewValue,
    required String lightColorHueNewValue,
    required String lightColorSaturationNewValue,
    required String lightColorValueNewValue,
  }) async {
    try {
      await _sendChangeColorHsv();
      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting color hue\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  /// Yeelight connections are rate-limited to 60 per minute.
  /// This method will take care that commends will be sent in 1 second
  /// between each one
  Future<void> executeCurrentStatusWithConstDelay() async {}

  Future<Either<CoreFailure, Unit>> _sendChangeColorTemperature() async {
    try {
      await api.setColorTemperature(
        colorTemperature: int.parse(lightColorTemperature.getOrCrash()),
        duration: const Duration(
          milliseconds: 100,
        ),
      );
      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting turn on\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  Future<Either<CoreFailure, Unit>> _sendChangeColorHsv() async {
    try {
      int saturationValue;
      if (lightColorSaturation.getOrCrash().length <= 3 &&
          lightColorSaturation.getOrCrash() == '0.0') {
        saturationValue = 0;
      } else if (lightColorSaturation.getOrCrash().length <= 3) {
        saturationValue = 100;
      } else {
        saturationValue =
            int.parse(lightColorSaturation.getOrCrash().substring(2, 4));
      }

      await api.setHSV(
        hue: double.parse(lightColorHue.getOrCrash()).toInt(),
        saturation: saturationValue,
        duration: const Duration(
          milliseconds: 100,
        ),
      );
      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting turn on\n$e');

      return left(const CoreFailure.unexpected());
    }
  }
}
