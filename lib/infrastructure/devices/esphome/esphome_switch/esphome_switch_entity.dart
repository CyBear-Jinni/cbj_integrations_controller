import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:nodered/nodered.dart';

class EspHomeSwitchEntity extends GenericSwitchDE {
  EspHomeSwitchEntity({
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
    required super.switchState,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.espHome),
        );

  factory EspHomeSwitchEntity.fromGeneric(GenericSwitchDE genericDevice) {
    return EspHomeSwitchEntity(
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
      switchState: genericDevice.switchState,
    );
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnSwitch() async {
    switchState = GenericSwitchSwitchState(EntityActions.on.toString());
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
  Future<Either<CoreFailure, Unit>> turnOffSwitch() async {
    switchState = GenericSwitchSwitchState(EntityActions.off.toString());

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
