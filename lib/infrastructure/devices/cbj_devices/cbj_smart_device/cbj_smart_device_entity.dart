import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_computer_entity/generic_smart_computer_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_computer_entity/generic_smart_computer_value_objects.dart';
import 'package:dartz/dartz.dart';

class CbjSmartComputerEntity extends GenericSmartComputerDE {
  CbjSmartComputerEntity({
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
    required super.smartComputerShutDownState,
    required super.smartComputerSuspendState,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(
            VendorsAndServices.cyBearJinniAppSmartEntity.toString(),
          ),
        );

  factory CbjSmartComputerEntity.fromGeneric(
    GenericSmartComputerDE genericDevice,
  ) {
    return CbjSmartComputerEntity(
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
      deviceCbjUniqueId: genericDevice.deviceCbjUniqueId,
      smartComputerShutDownState: genericDevice.smartComputerShutDownState,
      smartComputerSuspendState: genericDevice.smartComputerSuspendState,
    );
  }

  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  }) async {
    if (newEntity is! GenericSmartComputerDE) {
      return left(
        const CoreFailure.actionExcecuter(
          failedValue: 'Not the correct type',
        ),
      );
    }

    try {
      if (newEntity.smartComputerSuspendState!.getOrCrash() !=
          smartComputerSuspendState!.getOrCrash()) {
        final EntityActions? actionToPreform = EntityUtils.stringToDeviceAction(
          newEntity.smartComputerSuspendState!.getOrCrash(),
        );

        if (actionToPreform == EntityActions.suspend) {
          (await suspendSmartComputer()).fold((l) {
            icLogger.e('Error suspending Cbj Computer');
            throw l;
          }, (r) {
            icLogger.i('Cbj Computer suspended success');
          });
        } else {
          icLogger.e('actionToPreform is not set correctly Cbj Computer');
        }
      }

      if (newEntity.smartComputerShutDownState!.getOrCrash() !=
          smartComputerShutDownState!.getOrCrash()) {
        final EntityActions? actionToPreform = EntityUtils.stringToDeviceAction(
          newEntity.smartComputerShutDownState!.getOrCrash(),
        );
        if (actionToPreform == EntityActions.shutdown) {
          (await shutDownSmartComputer()).fold((l) {
            icLogger.e('Error shutdown Cbj Computer');
            throw l;
          }, (r) {
            icLogger.i('Cbj Computer shutdown success');
          });
        } else {
          icLogger.e('actionToPreform is not set correctly Cbj Computer');
        }
      }

      smartComputerSuspendState =
          GenericSmartComputerSuspendState(EntityActions.itIsFalse.toString());
      smartComputerShutDownState =
          GenericSmartComputerShutdownState(EntityActions.itIsFalse.toString());

      // entityStateGRPC = EntityState.state(EntityStateGRPC.ack);
      //
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

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> suspendSmartComputer() async {
    smartComputerSuspendState =
        GenericSmartComputerSuspendState(EntityActions.itIsFalse.toString());

    await CbjSmartDeviceClient.suspendCbjSmartDeviceHostDevice(
      deviceLastKnownIp.getOrCrash()!,
      entityUniqueId.getOrCrash(),
    );

    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> shutDownSmartComputer() async {
    smartComputerShutDownState =
        GenericSmartComputerShutdownState(EntityActions.itIsFalse.toString());

    await CbjSmartDeviceClient.shutDownCbjSmartDeviceHostDevice(
      deviceLastKnownIp.getOrCrash()!,
      entityUniqueId.getOrCrash(),
    );

    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }
}
