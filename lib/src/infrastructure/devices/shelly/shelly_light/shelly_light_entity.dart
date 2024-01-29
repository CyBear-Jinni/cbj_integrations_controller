import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
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
    required super.srvTarget,
    required super.ptrResourceRecord,
    required super.mdnsServiceType,
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
    required super.colorMode,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.shelly),
        ) {
    api = ShellyApiColorBulb(
      lastKnownIp: srvTarget.getOrCrash() ?? deviceLastKnownIp.getOrCrash()!,
      mDnsName: deviceMdns.getOrCrash()!,
      hostName: deviceHostName.getOrCrash() ?? '',
    );
  }

  factory ShellyColorLightEntity.fromGeneric(GenericRgbwLightDE entity) {
    return ShellyColorLightEntity(
      uniqueId: entity.uniqueId,
      entityUniqueId: entity.entityUniqueId,
      cbjEntityName: entity.cbjEntityName,
      entityOriginalName: entity.entityOriginalName,
      deviceOriginalName: entity.deviceOriginalName,
      deviceVendor: entity.deviceVendor,
      deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
      stateMassage: entity.stateMassage,
      senderDeviceOs: entity.senderDeviceOs,
      senderDeviceModel: entity.senderDeviceModel,
      senderId: entity.senderId,
      compUuid: entity.compUuid,
      entityStateGRPC: entity.entityStateGRPC,
      powerConsumption: entity.powerConsumption,
      deviceUniqueId: entity.deviceUniqueId,
      devicePort: entity.devicePort,
      deviceLastKnownIp: entity.deviceLastKnownIp,
      deviceHostName: entity.deviceHostName,
      deviceMdns: entity.deviceMdns,
      srvResourceRecord: entity.srvResourceRecord,
      srvTarget: entity.srvTarget,
      ptrResourceRecord: entity.ptrResourceRecord,
      mdnsServiceType: entity.mdnsServiceType,
      devicesMacAddress: entity.devicesMacAddress,
      entityKey: entity.entityKey,
      requestTimeStamp: entity.requestTimeStamp,
      lastResponseFromDeviceTimeStamp: entity.lastResponseFromDeviceTimeStamp,
      lightSwitchState: entity.lightSwitchState,
      deviceCbjUniqueId: entity.deviceCbjUniqueId,
      lightBrightness: entity.lightBrightness,
      lightColorTemperature: entity.lightColorTemperature,
      lightColorAlpha: entity.lightColorAlpha,
      lightColorHue: entity.lightColorHue,
      lightColorSaturation: entity.lightColorSaturation,
      lightColorValue: entity.lightColorValue,
      colorMode: entity.colorMode,
    );
  }
  late ShellyApiColorBulb api;

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericRgbwLightSwitchState(EntityActions.on.toString());

    try {
      icLogger.t('Turn on Shelly device');
      api.turnOn();
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
      await api.turnOff();
      return right(unit);
    } catch (exception) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> changeColorTemperature(
    int lightColorTemperatureNewValue,
  ) async {
    try {
      int temperatureInt = lightColorTemperatureNewValue;
      if (temperatureInt < 3000) {
        temperatureInt = 3000;
      } else if (temperatureInt > 6465) {
        temperatureInt = 6465;
      }

      await api.changTemperature(temperature: temperatureInt.toString());

      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async {
    try {
      await api.changBrightness(brightness: value.toString());

      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> changeColorHsv({
    required double value,
    required double hue,
    required double saturation,
    required double alpha,
  }) async {
    try {
      final HsvColor hsvColor = HsvColor(
        hue,
        convertDecimalPresentagetToIntegerPercentage(saturation),
        convertDecimalPresentagetToIntegerPercentage(value),
      );

      final RgbColor rgbColor = hsvColor.toRgbColor();

      await api.changeColor(
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
