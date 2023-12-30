import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:dartz/dartz.dart';

class ChromeBulbeEntity extends GenericLightDE {
  ChromeBulbeEntity({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjDeviceVendor,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
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
    required super.lightSwitchState,
  });

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    googleLightapi.on();
    return right(unit);
  }
}
