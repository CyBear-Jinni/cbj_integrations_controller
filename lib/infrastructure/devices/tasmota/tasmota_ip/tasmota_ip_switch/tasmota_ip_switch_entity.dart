import 'dart:convert';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

// TODO: Make the commends work, currently this object does not work
// Toggle device on/off, the o is the number of output to toggle o=2 is the second
//    http://ip/?m=1&o=1
// Change brightness
//    http://ip/?m=1&d0=30
// Change color
//    http://ip/?m=1&h0=232
// Change tint (I think)
//    http://ip/?m=1&t0=500
// Change color strength
//    http://ip/?m=1&n0=87

class TasmotaIpSwitchEntity extends GenericSwitchDE {
  TasmotaIpSwitchEntity({
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
          cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.tasmota),
        );

  factory TasmotaIpSwitchEntity.fromGeneric(GenericSwitchDE genericDevice) {
    return TasmotaIpSwitchEntity(
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

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityBase newEntity,
  }) async {
    if (newEntity is! GenericSwitchDE) {
      return left(
        const CoreFailure.actionExcecuter(
          failedValue: 'Not the correct type',
        ),
      );
    }

    try {
      if (newEntity.switchState.getOrCrash() != switchState.getOrCrash() ||
          entityStateGRPC.getOrCrash() != EntityStateGRPC.ack.toString()) {
        final EntityActions? actionToPreform = EntityUtils.stringToDeviceAction(
          newEntity.switchState.getOrCrash(),
        );

        if (actionToPreform == EntityActions.on) {
          (await turnOnSwitch()).fold(
            (l) {
              icLogger.e('Error turning TasmotaIp switch on');
              throw l;
            },
            (r) {
              icLogger.i('TasmotaIp switch turn on success');
            },
          );
        } else if (actionToPreform == EntityActions.off) {
          (await turnOffSwitch()).fold(
            (l) {
              icLogger.e('Error turning TasmotaIp switch off');
              throw l;
            },
            (r) {
              icLogger.i('TasmotaIp switch turn off success');
            },
          );
        } else {
          icLogger
              .e('actionToPreform is not set correctly on TasmotaIp Switch');
        }
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
  Future<Either<CoreFailure, Unit>> turnOnSwitch() async {
    switchState = GenericSwitchSwitchState(EntityActions.on.toString());

    final String deviceIp = deviceLastKnownIp.getOrCrash()!;
    const String getComponentsCommand = 'cm?cmnd=Power%20ON';

    // Map<String, String>? responseJson;

    try {
      final Response response =
          await get(Uri.parse('http://$deviceIp/$getComponentsCommand'));
      // responseJson =
      (json.decode(response.body) as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }

    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffSwitch() async {
    switchState = GenericSwitchSwitchState(EntityActions.off.toString());

    final String deviceIp = deviceLastKnownIp.getOrCrash()!;
    const String getComponentsCommand = 'cm?cmnd=Power%20OFF';

    // Map<String, String>? responseJson;

    try {
      final Response response =
          await get(Uri.parse('http://$deviceIp/$getComponentsCommand'));
      // responseJson =
      (json.decode(response.body) as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }

    return right(unit);
  }
}
