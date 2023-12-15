import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_device_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:dartz/dartz.dart';

class TasmotaMqttLedEntity extends GenericLightDE {
  TasmotaMqttLedEntity({
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
    required this.tasmotaMqttDeviceTopicName,
  }) : super(
          cbjDeviceVendor:
              CbjDeviceVendor(VendorsAndServices.tasmota.toString()),
        );

  TasmotaMqttDeviceTopicName tasmotaMqttDeviceTopicName;

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
      if (newEntity.lightSwitchState.getOrCrash() !=
              lightSwitchState.getOrCrash() ||
          entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
        final EntityActions? actionToPreform = EntityUtils.stringToDeviceAction(
          newEntity.lightSwitchState.getOrCrash(),
        );

        if (actionToPreform == EntityActions.on) {
          (await turnOnLight()).fold(
            (l) {
              icLogger.e('Error turning TasmotaMqtt light on');
              throw l;
            },
            (r) {
              icLogger.i('TasmotaMqtt light turn on success');
            },
          );
        } else if (actionToPreform == EntityActions.off) {
          (await turnOffLight()).fold(
            (l) {
              icLogger.e('Error turning TasmotaMqtt light off');
              throw l;
            },
            (r) {
              icLogger.i('TasmotaMqtt light turn off success');
            },
          );
        } else {
          icLogger.e('actionToPreform is not set correctly on TasmotaMqtt Led');
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
      IMqttServerRepository.instance.publishMessage(
        'cmnd/${tasmotaMqttDeviceTopicName.getOrCrash()}/Power',
        'ON',
      );
      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.off.toString());

    try {
      IMqttServerRepository.instance.publishMessage(
        'cmnd/${tasmotaMqttDeviceTopicName.getOrCrash()}/Power',
        'OFF',
      );
      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }
}
