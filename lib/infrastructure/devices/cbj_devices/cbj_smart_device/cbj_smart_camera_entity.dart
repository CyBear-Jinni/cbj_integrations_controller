import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/device_type_enums.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_security_camera_device/generic_security_camera_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_security_camera_device/generic_security_camera_value_objects.dart';
import 'package:dartz/dartz.dart';

class CbjSecurityCameraEntity extends GenericSecurityCameraDE {
  CbjSecurityCameraEntity({
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
    required super.srvResourceRecord,
    required super.ptrResourceRecord,
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.deviceCbjUniqueId,
    required super.securityCameraSuspendState,
  }) : super(
          deviceVendor: DeviceVendor(
            VendorsAndServices.cyBearJinniAppSmartEntity.toString(),
          ),
        );

  factory CbjSecurityCameraEntity.fromGeneric(
    GenericSecurityCameraDE genericDevice,
  ) {
    return CbjSecurityCameraEntity(
      uniqueId: genericDevice.uniqueId,
      entityUniqueId: genericDevice.entityUniqueId,
      cbjEntityName: genericDevice.cbjEntityName,
      entityOriginalName: genericDevice.entityOriginalName,
      deviceOriginalName: genericDevice.deviceOriginalName,
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
      securityCameraSuspendState: genericDevice.securityCameraSuspendState,
    );
  }

  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  }) async {
    if (newEntity is! GenericSecurityCameraDE) {
      return left(
        const CoreFailure.actionExcecuter(
          failedValue: 'Not the correct type',
        ),
      );
    }

    try {
      if (newEntity.securityCameraSuspendState!.getOrCrash() !=
          securityCameraSuspendState!.getOrCrash()) {
        final EntityActions? actionToPreform =
            EnumHelperCbj.stringToDeviceAction(
          newEntity.securityCameraSuspendState!.getOrCrash(),
        );

        if (actionToPreform == EntityActions.suspend) {
          (await suspendSecurityCamera()).fold((l) {
            icLogger.e('Error suspending Cbj Computer');
            throw l;
          }, (r) {
            icLogger.i('Cbj Computer suspended success');
          });
        } else {
          icLogger.e('actionToPreform is not set correctly Cbj Computer');
        }
      }

      securityCameraSuspendState =
          GenericSecurityCameraSuspendState(EntityActions.itIsFalse.toString());

      // entityStateGRPC = EntityState(EntityStateGRPC.ack.toString());
      //
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

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> suspendSecurityCamera() async {
    securityCameraSuspendState =
        GenericSecurityCameraSuspendState(EntityActions.itIsFalse.toString());

    await CbjSmartDeviceClient.suspendCbjSmartDeviceHostDevice(
      deviceLastKnownIp.getOrCrash(),
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
  Future<Either<CoreFailure, Unit>> shutDownSecurityCamera() async {
    await CbjSmartDeviceClient.shutDownCbjSmartDeviceHostDevice(
      deviceLastKnownIp.getOrCrash(),
      entityUniqueId.getOrCrash(),
    );

    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }
}
