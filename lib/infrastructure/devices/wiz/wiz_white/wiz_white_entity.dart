import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/wiz/wiz_device_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:dartz/dartz.dart';

class WizWhiteEntity extends GenericLightDE {
  WizWhiteEntity({
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
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.wiz.toString()),
        );

  WizPort? wizPort;

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  }) async {
    if (newEntity is! GenericLightDE) {
      return left(
        const CoreFailure.actionExcecuter(
          failedValue: 'Not the correct type',
        ),
      );
    }

    try {
      if (newEntity.lightSwitchState!.getOrCrash() !=
              lightSwitchState!.getOrCrash() ||
          entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
        final EntityActions? actionToPreform = EntityUtils.stringToDeviceAction(
          newEntity.lightSwitchState!.getOrCrash(),
        );

        if (actionToPreform == EntityActions.on) {
          (await turnOnLight()).fold((l) {
            icLogger.e('Error turning Wiz light on');
            throw l;
          }, (r) {
            icLogger.i('Wiz light turn on success');
          });
        } else if (actionToPreform == EntityActions.off) {
          (await turnOffLight()).fold((l) {
            icLogger.e('Error turning Wiz light off');
            throw l;
          }, (r) {
            icLogger.i('Wiz light turn off success');
          });
        } else {
          icLogger.w('actionToPreform is not set correctly on Wiz White');
        }
      }
      entityStateGRPC = EntityState(EntityStateGRPC.ack.toString());
      // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
      //   entityFromTheHub: this,
      // );
      return right(unit);
    } catch (e) {
      entityStateGRPC = EntityState(EntityStateGRPC.newStateFailed.toString());
      // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
      //   entityFromTheHub: this,
      // );
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.on.toString());
    try {
      // final setStateBodyResponse =
      //     await WizConnectorConjecture.wizClient?.setState(
      //   // Selector.id(entityUniqueId.getOrCrash()),
      //   power: 'on',
      //   fast: true,
      // );
      // if (setStateBodyResponse == null) {
      //   throw 'setStateBodyResponse is null';
      // }
      //
      // return right(unit);
    } catch (e) {
      // As we are using the fast = true the response is always
      // WizHttpException Error
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.off.toString());

    try {
      // final setStateBodyResponse =
      //     await WizConnectorConjecture.wizClient?.setState(
      // Selector.id(entityUniqueId.getOrCrash()),
      //   power: 'off',
      //   fast: true,
      // );
      // if (setStateBodyResponse == null) {
      //   throw 'setStateBodyResponse is null';
      // }
      // return right(unit);
    } catch (e) {
      // As we are using the fast = true the response is always
      // WizHttpException Error
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }
}
