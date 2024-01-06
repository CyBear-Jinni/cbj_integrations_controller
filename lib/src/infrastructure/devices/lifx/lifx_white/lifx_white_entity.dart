import 'dart:async';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:dartz/dartz.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LifxWhiteEntity extends GenericDimmableLightDE {
  LifxWhiteEntity({
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
    required super.lightBrightness,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.lifx),
        );

  factory LifxWhiteEntity.fromGeneric(GenericDimmableLightDE genericDevice) {
    return LifxWhiteEntity(
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
    );
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    try {
      final setStateBodyResponse =
          await LifxConnectorConjecture().lifxClient?.setState(
                Selector.id(entityUniqueId.getOrCrash()),
                power: 'on',
                fast: true,
              );
      if (setStateBodyResponse == null) {
        throw 'setStateBodyResponse is null';
      }

      return right(unit);
    } catch (e) {
      // As we are using the fast = true the response is always
      // LifxHttpException Error
      return right(unit);
      // return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    try {
      final setStateBodyResponse =
          await LifxConnectorConjecture().lifxClient?.setState(
                Selector.id(entityUniqueId.getOrCrash()),
                power: 'off',
                fast: true,
              );
      if (setStateBodyResponse == null) {
        throw 'setStateBodyResponse is null';
      }
      return right(unit);
    } catch (e) {
      // As we are using the fast = true the response is always
      // LifxHttpException Error
      return right(unit);
      // return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async {
    try {
      final setStateBodyResponse =
          await LifxConnectorConjecture().lifxClient?.setState(
                Selector.id(entityUniqueId.getOrCrash()),
                fast: true,
                brightness: backToDecimalPointBrightness(value),
              );
      if (setStateBodyResponse == null) {
        throw 'setStateBodyResponse is null';
      }
      return right(unit);
    } catch (e) {
      // As we are using the fast = true the response is always
      // LifxHttpException Error
      return right(unit);
      // return left(const CoreFailure.unexpected());
    }
  }
}
