import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_value_objects.dart';
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

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityBase newEntity,
  }) async {
    if (newEntity is! GenericDimmableLightDE) {
      return left(
        const CoreFailure.actionExcecuter(
          failedValue: 'Not the correct type',
        ),
      );
    }

    try {
      if (newEntity.lightSwitchState.getOrCrash() !=
              lightSwitchState.getOrCrash() ||
          entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
        final EntityActions? actionToPreform = EntityUtils.stringToDeviceAction(
          newEntity.lightSwitchState.getOrCrash(),
        );

        if (actionToPreform == EntityActions.on) {
          (await turnOnLight()).fold((l) {
            icLogger.e('Error turning Lifx light on');
            throw l;
          }, (r) {
            icLogger.i('Lifx light turn on success');
          });
        } else if (actionToPreform == EntityActions.off) {
          (await turnOffLight()).fold((l) {
            icLogger.e('Error turning Lifx light off');
            throw l;
          }, (r) {
            icLogger.i('Lifx light turn off success');
          });
        } else {
          icLogger.w('actionToPreform is not set correctly on Lifx White');
        }
      }

      if (newEntity.lightBrightness.getOrCrash() !=
          lightBrightness.getOrCrash()) {
        (await setBrightness(newEntity.lightBrightness.getOrCrash())).fold(
          (l) {
            icLogger.e('Error changing Lifx brightness\n$l');
            throw l;
          },
          (r) {
            icLogger.i('Lifx changed brightness successfully');
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
    lightSwitchState =
        GenericDimmableLightSwitchState(EntityActions.on.toString());
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
    lightSwitchState =
        GenericDimmableLightSwitchState(EntityActions.off.toString());

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
  Future<Either<CoreFailure, Unit>> setBrightness(String brightness) async {
    lightBrightness = GenericDimmableLightBrightness(brightness);

    try {
      final setStateBodyResponse =
          await LifxConnectorConjecture().lifxClient?.setState(
                Selector.id(entityUniqueId.getOrCrash()),
                fast: true,
                brightness: lightBrightness.backToDecimalPointBrightness(),
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
