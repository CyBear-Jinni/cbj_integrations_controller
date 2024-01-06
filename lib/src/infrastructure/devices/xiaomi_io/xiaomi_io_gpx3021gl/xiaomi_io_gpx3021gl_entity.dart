import 'dart:async';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:yeedart/yeedart.dart';

class XiaomiIoGpx4021GlEntity extends GenericRgbwLightDE {
  XiaomiIoGpx4021GlEntity({
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
          cbjDeviceVendor: CbjDeviceVendor(
            VendorsAndServices.xiaomi.toString(),
          ),
        );

  factory XiaomiIoGpx4021GlEntity.fromGeneric(
    GenericRgbwLightDE genericDevice,
  ) {
    return XiaomiIoGpx4021GlEntity(
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

  /// XiaomiIo package object require to close previews request before new one
  Device? xiaomiIoPackageObject;

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    try {
      return left(const CoreFailure.unexpected());
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    try {
      return left(const CoreFailure.unexpected());
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async =>
      pleaseOverrideMessage();

  @override
  Future<Either<CoreFailure, Unit>> changeColorTemperature(
    int lightColorTemperatureNewValue,
  ) async =>
      pleaseOverrideMessage();

  @override
  Future<Either<CoreFailure, Unit>> changeColorHsv({
    required double value,
    required double hue,
    required double saturation,
    required double alpha,
  }) async =>
      pleaseOverrideMessage();
}
