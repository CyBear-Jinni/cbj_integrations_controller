import 'dart:async';
import 'dart:io';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/device_type_enums.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_value_objects.dart';
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
          cbjDeviceVendor:
              CbjDeviceVendor(VendorsAndServices.yeelight.toString()),
        );

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
  Device? yeelightPackageObject;

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

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  }) async {
    if (newEntity is! GenericRgbwLightDE) {
      return left(
        const CoreFailure.actionExcecuter(
          failedValue: 'Not the correct type',
        ),
      );
    }
    if (executeStateTimer != null) {
      executeStateTimer!.cancel();
      executeStateTimer = null;
    }

    executeStateTimer ??=
        Timer(Duration(milliseconds: sendNewRequestToDeviceEachMilliseconds),
            () async {
      try {
        try {
          if (newEntity.lightSwitchState!.getOrCrash() !=
                  lightSwitchState!.getOrCrash() ||
              entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
            final EntityActions? actionToPreform =
                EnumHelperCbj.stringToDeviceAction(
              newEntity.lightSwitchState!.getOrCrash(),
            );

            if (actionToPreform == EntityActions.on) {
              (await turnOnLight()).fold(
                (l) {
                  icLogger.e('Error turning Yeelight light on\n$l');
                  throw l;
                },
                (r) {
                  icLogger.i('Yeelight light turn on success');
                },
              );
            } else if (actionToPreform == EntityActions.off) {
              (await turnOffLight()).fold(
                (l) {
                  icLogger.e('Error turning Yeelight light off\n$l');
                  throw l;
                },
                (r) {
                  icLogger.i('Yeelight light turn off success');
                },
              );
            } else {
              icLogger
                  .i('actionToPreform is not set correctly on Yeelight 1SE');
            }
          }

          if (newEntity.lightColorTemperature.getOrCrash() !=
                  lightColorTemperature.getOrCrash() ||
              entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
            (await changeColorTemperature(
              lightColorTemperatureNewValue:
                  newEntity.lightColorTemperature.getOrCrash(),
            ))
                .fold(
              (l) {
                icLogger.e('Error changing Yeelight ColorTemper\n$l');
                throw l;
              },
              (r) {
                icLogger.i('Yeelight changed ColorTemper successfully');
              },
            );
          }
          if (newEntity.lightColorAlpha.getOrCrash() !=
                  lightColorAlpha.getOrCrash() ||
              newEntity.lightColorHue.getOrCrash() !=
                  lightColorHue.getOrCrash() ||
              newEntity.lightColorSaturation.getOrCrash() !=
                  lightColorSaturation.getOrCrash() ||
              newEntity.lightColorValue.getOrCrash() !=
                  lightColorValue.getOrCrash() ||
              entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
            (await changeColorHsv(
              lightColorAlphaNewValue: newEntity.lightColorAlpha.getOrCrash(),
              lightColorHueNewValue: newEntity.lightColorHue.getOrCrash(),
              lightColorSaturationNewValue:
                  newEntity.lightColorSaturation.getOrCrash(),
              lightColorValueNewValue: newEntity.lightColorValue.getOrCrash(),
            ))
                .fold(
              (l) {
                icLogger.e('Error changing Yeelight light color\n$l');
                throw l;
              },
              (r) {
                icLogger.i('Yeelight changed color successfully');
              },
            );
          }

          if (newEntity.lightBrightness.getOrCrash() !=
                  lightBrightness.getOrCrash() ||
              entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
            (await setBrightness(newEntity.lightBrightness.getOrCrash())).fold(
              (l) {
                icLogger.e('Error changing Yeelight brightness\n$l');
                throw l;
              },
              (r) {
                icLogger.i('Yeelight changed brightness successfully');
              },
            );
          }
          entityStateGRPC = EntityState(EntityStateGRPC.ack.toString());
        } catch (e) {
          icLogger.e('Error executing Yeelight current state\n$e');
        } finally {
          yeelightPackageObject?.disconnect();
        }
      } catch (e) {
        icLogger.e('Yeelight throws exception on disconnect\n$e');
        entityStateGRPC =
            EntityState(EntityStateGRPC.newStateFailed.toString());
      }
      executeStateTimer = null;
    });

    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericRgbwLightSwitchState(EntityActions.on.toString());
    try {
      await _sendTurnOnDevice();

      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting turn on\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState =
        GenericRgbwLightSwitchState(EntityActions.off.toString());

    try {
      await _sendTurnOffDevice();

      return right(unit);
    } catch (e) {
      return left(CoreFailure.actionExcecuter(failedValue: e));
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(String brightness) async {
    lightBrightness = GenericRgbwLightBrightness(brightness);

    try {
      await _sendSetBrightness();

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
    lightColorAlpha = GenericRgbwLightColorAlpha(lightColorAlphaNewValue);
    lightColorHue = GenericRgbwLightColorHue(lightColorHueNewValue);
    lightColorSaturation =
        GenericRgbwLightColorSaturation(lightColorSaturationNewValue);
    lightColorValue = GenericRgbwLightColorValue(lightColorValueNewValue);

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

  /// Will turn off the device, will not close the connection
  Future<Either<CoreFailure, Unit>> _sendTurnOffDevice() async {
    try {
      yeelightPackageObject = Device(
        address: InternetAddress(deviceLastKnownIp.getOrCrash()!),
        port: int.parse(devicePort.getOrCrash()),
      );

      await yeelightPackageObject!.turnOff();
      return right(unit);
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 150));
      final List<DiscoveryResponse> responses = await Yeelight.discover();

      final response = responses.firstWhere(
        (element) => element.id.toString() == entityUniqueId.getOrCrash(),
      );

      yeelightPackageObject =
          Device(address: response.address, port: response.port!);

      deviceLastKnownIp = DeviceLastKnownIp(response.address.address);
      devicePort = DevicePort(response.port!.toString());

      await yeelightPackageObject!.turnOff();
    }
    return right(unit);
  }

  /// Will turn on the device, will not close the connection
  Future<Either<CoreFailure, Unit>> _sendTurnOnDevice() async {
    try {
      yeelightPackageObject = Device(
        address: InternetAddress(deviceLastKnownIp.getOrCrash()!),
        port: int.parse(devicePort.getOrCrash()),
      );

      await yeelightPackageObject!.turnOn();
      return right(unit);
    } catch (e) {
      // TODO: Maybe can be removed, need testing
      await Future.delayed(const Duration(milliseconds: 150));
      final responses = await Yeelight.discover();

      final response = responses.firstWhere(
        (element) => element.id.toString() == entityUniqueId.getOrCrash(),
      );

      yeelightPackageObject =
          Device(address: response.address, port: response.port!);

      deviceLastKnownIp = DeviceLastKnownIp(response.address.address);
      devicePort = DevicePort(response.port!.toString());

      await yeelightPackageObject!.turnOn();
    }
    return right(unit);
  }

  Future<Either<CoreFailure, Unit>> _sendSetBrightness() async {
    try {
      try {
        yeelightPackageObject = Device(
          address: InternetAddress(deviceLastKnownIp.getOrCrash()!),
          port: int.parse(devicePort.getOrCrash()),
        );

        await yeelightPackageObject?.turnOn();

        await yeelightPackageObject?.setBrightness(
          brightness: int.parse(
            lightBrightness.getOrCrash(),
          ),
          duration: const Duration(milliseconds: 200),
        );

        yeelightPackageObject?.disconnect();

        return right(unit);
      } catch (e) {
        await Future.delayed(const Duration(milliseconds: 150));

        final responses = await Yeelight.discover();

        final response = responses.firstWhere(
          (element) => element.id.toString() == entityUniqueId.getOrCrash(),
        );

        yeelightPackageObject =
            Device(address: response.address, port: response.port!);
        deviceLastKnownIp = DeviceLastKnownIp(response.address.address);
        devicePort = DevicePort(response.port!.toString());

        await yeelightPackageObject!.turnOn();

        await yeelightPackageObject!.setBrightness(
          brightness: int.parse(
            lightBrightness.getOrCrash(),
          ),
          duration: const Duration(milliseconds: 200),
        );

        return right(unit);
      }
    } catch (error) {
      icLogger.e('Error in Yeelight Device setting brightness\n$error');
      return left(const CoreFailure.unexpected());
    }
  }

  Future<Either<CoreFailure, Unit>> _sendChangeColorTemperature() async {
    try {
      try {
        yeelightPackageObject = Device(
          address: InternetAddress(deviceLastKnownIp.getOrCrash()!),
          port: int.parse(devicePort.getOrCrash()),
        );

        await yeelightPackageObject!.setColorTemperature(
          colorTemperature: int.parse(lightColorTemperature.getOrCrash()),
          duration: const Duration(
            milliseconds: 100,
          ),
        );

        return right(unit);
      } catch (e) {
        await Future.delayed(const Duration(milliseconds: 150));

        final responses = await Yeelight.discover();

        final response = responses.firstWhere(
          (element) => element.id.toString() == entityUniqueId.getOrCrash(),
        );

        yeelightPackageObject =
            Device(address: response.address, port: response.port!);
        deviceLastKnownIp = DeviceLastKnownIp(response.address.address);
        devicePort = DevicePort(response.port!.toString());

        await yeelightPackageObject!.setColorTemperature(
          colorTemperature: int.parse(lightColorTemperature.getOrCrash()),
          duration: const Duration(
            milliseconds: 100,
          ),
        );
        return right(unit);
      }
    } catch (e) {
      return left(CoreFailure.actionExcecuter(failedValue: e));
    }
  }

  Future<Either<CoreFailure, Unit>> _sendChangeColorHsv() async {
    try {
      try {
        yeelightPackageObject = Device(
          address: InternetAddress(deviceLastKnownIp.getOrCrash()!),
          port: int.parse(devicePort.getOrCrash()),
        );
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

        await yeelightPackageObject!.setHSV(
          hue: double.parse(lightColorHue.getOrCrash()).toInt(),
          saturation: saturationValue,
          duration: const Duration(
            milliseconds: 100,
          ),
        );

        return right(unit);
      } catch (e) {
        await Future.delayed(const Duration(milliseconds: 150));

        final responses = await Yeelight.discover();

        final response = responses.firstWhere(
          (element) => element.id.toString() == entityUniqueId.getOrCrash(),
        );

        yeelightPackageObject =
            Device(address: response.address, port: response.port!);
        deviceLastKnownIp = DeviceLastKnownIp(response.address.address);
        devicePort = DevicePort(response.port!.toString());

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

        await yeelightPackageObject!.setHSV(
          hue: double.parse(lightColorHue.getOrCrash()).toInt(),
          saturation: saturationValue,
          duration: const Duration(
            milliseconds: 100,
          ),
        );

        return right(unit);
      }
    } catch (e) {
      return left(CoreFailure.actionExcecuter(failedValue: e));
    }
  }
}
