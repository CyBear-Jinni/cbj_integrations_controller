import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/device_type_enums.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv/generic_smart_tv_entity.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:dartz/dartz.dart';

class LgWebosTvEntity extends GenericSmartTvDE {
  LgWebosTvEntity({
    required super.uniqueId,
    required super.entityUniqueId,
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
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.deviceCbjUniqueId,
    required super.smartTvSwitchState,
    super.openUrl,
    super.pausePlayState,
    super.skip,
    super.volume,
  }) : super(
          deviceVendor: DeviceVendor(VendorsAndServices.lg.toString()),
        );

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

    try {
      if (newEntity.lightSwitchState!.getOrCrash() !=
              smartTvSwitchState!.getOrCrash() ||
          entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
        final EntityActions? actionToPreform =
            EnumHelperCbj.stringToDeviceAction(
          newEntity.lightSwitchState!.getOrCrash(),
        );

        if (actionToPreform == EntityActions.on) {
          (await turnOnSmartTv()).fold((l) {
            logger.e('Error turning WebOs on');
            throw l;
          }, (r) {
            logger.i('WebOs turn on success');
          });
        } else if (actionToPreform == EntityActions.off) {
          (await turnOffSmartTv()).fold((l) {
            logger.e('Error turning WebOs off');
            throw l;
          }, (r) {
            logger.i('WebOs turn off success');
          });
        } else {
          logger.e('actionToPreform is not set correctly on WebOs');
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
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async {
    try {} catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async {
    try {} catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }
}
