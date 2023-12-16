import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:color/color.dart';
import 'package:dartz/dartz.dart';
import 'package:shelly/shelly.dart';

class ShellyColorLightEntity extends GenericRgbwLightDE {
  ShellyColorLightEntity({
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
    ShellyApiColorBulb? bulbMode,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.shelly),
        ) {
    shellyColorBulb = bulbMode ??
        ShellyApiColorBulb(
          lastKnownIp: deviceLastKnownIp.getOrCrash()!,
          mDnsName: deviceMdns.getOrCrash(),
          hostName: deviceHostName.getOrCrash() ?? '',
        );
  }

  factory ShellyColorLightEntity.fromGeneric(GenericRgbwLightDE genericDevice) {
    return ShellyColorLightEntity(
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
  late ShellyApiColorBulb shellyColorBulb;

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

    try {
      // if (entityStateGRPC.getOrCrash() == EntityStateGRPC.ack.toString()) {
      //   return right(unit);
      // }

      if (newEntity.lightSwitchState.getOrCrash() !=
          lightSwitchState.getOrCrash()) {
        final EntityActions? actionToPreform = EntityUtils.stringToDeviceAction(
          newEntity.lightSwitchState.getOrCrash(),
        );

        if (actionToPreform == EntityActions.on) {
          (await turnOnLight()).fold((l) {
            icLogger.e('Error turning Shelly light on');
            throw l;
          }, (r) {
            icLogger.i('Shelly light turn on success');
          });
        } else if (actionToPreform == EntityActions.off) {
          (await turnOffLight()).fold((l) {
            icLogger.e('Error turning Shelly light off');
            throw l;
          }, (r) {
            icLogger.i('Shelly light turn off success');
          });
        } else {
          icLogger.e('actionToPreform is not set correctly Shelly light');
        }
      }

      if (newEntity.lightColorTemperature.getOrCrash() !=
          lightColorTemperature.getOrCrash()) {
        (await changeColorTemperature(
          lightColorTemperatureNewValue:
              newEntity.lightColorTemperature.getOrCrash(),
        ))
            .fold(
          (l) {
            icLogger.e('Error changing Shelly temperature\n$l');
            throw l;
          },
          (r) {
            icLogger.i('Shelly changed temperature successfully');
          },
        );
      }

      if (newEntity.lightColorAlpha.getOrCrash() !=
              lightColorAlpha.getOrCrash() ||
          newEntity.lightColorHue.getOrCrash() != lightColorHue.getOrCrash() ||
          newEntity.lightColorSaturation.getOrCrash() !=
              lightColorSaturation.getOrCrash() ||
          newEntity.lightColorValue.getOrCrash() !=
              lightColorValue.getOrCrash()) {
        (await changeColorHsv(
          lightColorAlphaNewValue: newEntity.lightColorAlpha.getOrCrash(),
          lightColorHueNewValue: newEntity.lightColorHue.getOrCrash(),
          lightColorSaturationNewValue:
              newEntity.lightColorSaturation.getOrCrash(),
          lightColorValueNewValue: newEntity.lightColorValue.getOrCrash(),
        ))
            .fold(
          (l) {
            icLogger.e('Error changing Shelly light color\n$l');
            throw l;
          },
          (r) {
            icLogger.i('Shelly changed color successfully');
          },
        );
      }

      if (newEntity.lightBrightness.getOrCrash() !=
          lightBrightness.getOrCrash()) {
        (await setBrightness(newEntity.lightBrightness.getOrCrash())).fold(
          (l) {
            icLogger.e('Error changing Shelly brightness\n$l');
            throw l;
          },
          (r) {
            icLogger.i('Shelly changed brightness successfully');
          },
        );
      }
      entityStateGRPC = EntityState.state(EntityStateGRPC.ack);
      // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
      //   entityFromTheHub: this,
      // );
      return right(unit);
    } catch (e) {
      entityStateGRPC = EntityState.state(EntityStateGRPC.newStateFailed);
      // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
      //   entityFromTheHub: this,
      // );
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericRgbwLightSwitchState(EntityActions.on.toString());

    try {
      icLogger.t('Turn on Shelly device');
      shellyColorBulb.turnOn();
      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState =
        GenericRgbwLightSwitchState(EntityActions.off.toString());

    try {
      icLogger.t('Turn off Shelly device');
      await shellyColorBulb.turnOff();
      return right(unit);
    } catch (exception) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> changeColorTemperature({
    required String lightColorTemperatureNewValue,
  }) async {
    try {
      int temperatureInt = int.parse(lightColorTemperatureNewValue);
      if (temperatureInt < 3000) {
        temperatureInt = 3000;
      } else if (temperatureInt > 6465) {
        temperatureInt = 6465;
      }

      if (lightColorTemperature.getOrCrash() == temperatureInt.toString()) {
        return right(unit);
      }

      lightColorTemperature =
          GenericRgbwLightColorTemperature(temperatureInt.toString());

      await shellyColorBulb.changTemperature(
        temperature: lightColorTemperature.getOrCrash(),
      );

      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(String brightness) async {
    lightBrightness = GenericRgbwLightBrightness(brightness);

    try {
      await shellyColorBulb.changBrightness(
        brightness: brightness,
      );

      return right(unit);
    } catch (e) {
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
      final HsvColor hsvColor = HsvColor(
        double.parse(lightColorHue.getOrCrash()),
        convertDecimalPresentagetToIntegerPercentage(
          double.parse(lightColorSaturation.getOrCrash()),
        ),
        convertDecimalPresentagetToIntegerPercentage(
          double.parse(lightColorValue.getOrCrash()),
        ),
      );

      final RgbColor rgbColor = hsvColor.toRgbColor();

      await shellyColorBulb.changeColor(
        red: rgbColor.r.toString(),
        green: rgbColor.g.toString(),
        blue: rgbColor.b.toString(),
      );

      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  // Convert percentage 0-1 numbers to 0-100 with the same percentage
  int convertDecimalPresentagetToIntegerPercentage(double number) {
    if (number == 1.0) {
      return 100;
    } else if (number == 0.0) {
      return 0;
    }

    if (number.toString().length <= 8) {
      throw 'Error converting to integer percentage';
    }
    // 0.3455545372845
    final String inString = number.toStringAsFixed(6); //  0.34555
    final int numberTemp = int.parse(inString.substring(2)); //   34555

    final int percentage = (100 * numberTemp) ~/ 1000000;

    return percentage;
  }
}
