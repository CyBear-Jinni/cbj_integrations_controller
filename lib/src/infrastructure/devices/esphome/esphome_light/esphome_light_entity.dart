import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:cbj_integrations_controller/src/domain/i_mqtt_server_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:nodered/nodered.dart';

class EspHomeLightEntity extends GenericLightDE {
  EspHomeLightEntity({
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
          cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.espHome),
        );

  factory EspHomeLightEntity.fromGeneric(GenericLightDE genericDevice) {
    return EspHomeLightEntity(
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
    );
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.on.toString());
    try {
      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();
      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${entityKey.getOrCrash()}/${EspHomeNodeRedApi.deviceStateProperty}/${EspHomeNodeRedApi.inputDeviceProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, """{"state":true}""");
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.off.toString());
    try {
      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();
      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${entityKey.getOrCrash()}/${EspHomeNodeRedApi.deviceStateProperty}/${EspHomeNodeRedApi.inputDeviceProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, """{"state":false}""");
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }
}
