import 'dart:convert';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/infrastructure/remote_pipes/remote_pipes_dtos.dart';
import 'package:cbj_integrations_controller/src/infrastructure/routines/routine_cbj_dtos.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendor_login/vendor_login_entity_dtos.dart';

class DeviceHelperMethods {
  factory DeviceHelperMethods() {
    return _instance;
  }

  DeviceHelperMethods._singletonContractor();

  static final DeviceHelperMethods _instance =
      DeviceHelperMethods._singletonContractor();

  RequestsAndStatusFromHub dynamicToRequestsAndStatusFromHub(
    dynamic entityDto,
  ) {
    if (entityDto is DeviceEntityDtoBase) {
      return RequestsAndStatusFromHub(
        sendingType: SendingType.entityType,
        allRemoteCommands: DeviceHelper.convertDtoToJsonString(entityDto),
      );
    } else if (entityDto is AreaEntityDtos) {
      return RequestsAndStatusFromHub(
        sendingType: SendingType.areaType,
        allRemoteCommands: jsonEncode(entityDto.toJson()),
      );
    } else if (entityDto is SceneCbjDtos) {
      return RequestsAndStatusFromHub(
        sendingType: SendingType.sceneType,
        allRemoteCommands: jsonEncode(entityDto.toJson()),
      );
    } else if (entityDto is RoutineCbjDtos) {
      return RequestsAndStatusFromHub(
        sendingType: SendingType.routineType,
        allRemoteCommands: jsonEncode(entityDto.toJson()),
      );
    } else {
      icLogger.w('Not sure what type to send');
      return RequestsAndStatusFromHub(
        sendingType: SendingType.undefinedType,
        allRemoteCommands: '',
      );
    }
  }

  dynamic clientStatusRequestsToItsDtoType(
    ClientStatusRequests clientStatusRequests,
  ) {
    switch (clientStatusRequests.sendingType) {
      case SendingType.areaType:
        return AreaEntityDtos.fromJson(
          jsonDecode(clientStatusRequests.allRemoteCommands)
              as Map<String, dynamic>,
        );
      case SendingType.entityType:
        return DeviceHelper.convertJsonStringToDto(
          clientStatusRequests.allRemoteCommands,
        );
      case SendingType.remotePipesInformation:
        final Map<String, dynamic> jsonDecoded =
            jsonDecode(clientStatusRequests.allRemoteCommands)
                as Map<String, dynamic>;

        return RemotePipesDtos.fromJson(jsonDecoded);
      case SendingType.routineType:
        final Map<String, dynamic> jsonRoutineFromJsonString =
            jsonDecode(clientStatusRequests.allRemoteCommands)
                as Map<String, dynamic>;

        return RoutineCbjDtos.fromJson(jsonRoutineFromJsonString);
      case SendingType.sceneType:
        final Map<String, dynamic> jsonSceneFromJsonString =
            jsonDecode(clientStatusRequests.allRemoteCommands)
                as Map<String, dynamic>;

        return SceneCbjDtos.fromJson(jsonSceneFromJsonString);

      case SendingType.vendorLoginType:
        return VendorLoginEntityDtos.fromJson(
          jsonDecode(clientStatusRequests.allRemoteCommands)
              as Map<String, dynamic>,
        );

      case SendingType.bindingsType:
      case SendingType.firstConnection:
      case SendingType.getHubEntityInfo:
      case SendingType.location:
      case SendingType.mqttMassageType:
      case SendingType.partialEntityType:
      case SendingType.responseHubEntityInfo:
      case SendingType.scheduleType:
      case SendingType.stringType:
      case SendingType.undefinedType:
        break;
    }

    icLogger.w('Request from app does not support this sending device type');

    return null;
  }

  Future handleClientStatusRequests(
    ClientStatusRequests clientStatusRequests,
  ) async {
    icLogger.i('Got From App');

    final dynamic dtoEntity =
        clientStatusRequestsToItsDtoType(clientStatusRequests);

    if (dtoEntity is DeviceEntityDtoBase) {
      final DeviceEntityBase deviceEntityBase = dtoEntity.toDomain();
      deviceEntityBase.entityStateGRPC = EntityState.state(EntityStateGRPC.ack);

      IMqttServerRepository.instance.postToHubMqtt(
        entityFromTheApp: deviceEntityBase,
        gotFromApp: true,
      );
    } else if (dtoEntity is AreaEntityDtos) {
      // ISavedAreasRepo.instance.saveAndActiveAreaToDb(
      // areaEntity: dtoEntity.toDomain(),
      // );

      IMqttServerRepository.instance.postToHubMqtt(
        entityFromTheApp: dtoEntity,
        gotFromApp: true,
      );
    } else if (dtoEntity is VendorLoginEntityDtos) {
      IcSynchronizer().loginVendor(dtoEntity.toDomain());
    } else if (clientStatusRequests.sendingType ==
        SendingType.firstConnection) {
      IAppCommunicationRepository.instance.sendAllAreasFromHubRequestsStream();
      IAppCommunicationRepository.instance
          .sendAllDevicesFromHubRequestsStream();
      IAppCommunicationRepository.instance.sendAllScenesFromHubRequestsStream();
    } else if (dtoEntity is RemotePipesDtos) {
      // ISavedDevicesRepo.instance.saveAndActivateRemotePipesDomainToDb(
      // remotePipes: dtoEntity.toDomain(),
      // );
    } else if (dtoEntity is SceneCbjDtos) {
      // final SceneCbjEntity sceneCbj = dtoEntity.toDomain();

      // final String sceneStateGrpcTemp = sceneCbj.entityStateGRPC.getOrCrash()!;

      // final SceneCbjEntity sceneCopy = sceneCbj.copyWith(
      //   entityStateGRPC: SceneCbjDeviceStateGRPC(
      //     EntityStateGRPC.waitingInComp.toString(),
      //   ),
      // );

      //   if (sceneStateGrpcTemp == EntityStateGRPC.addingNewScene.toString()) {
      //     ISceneCbjRepository.instance.addNewSceneAndSaveInDb(sceneCopy);
      //   } else {
      //     ISceneCbjRepository.instance.activateScene(sceneCopy);
      //   }
      // } else if (dtoEntity is RoutineCbjDtos) {
      //   final RoutineCbjEntity routineCbj = dtoEntity.toDomain();

      //   final String routineStateGrpcTemp =
      //       routineCbj.entityStateGRPC.getOrCrash()!;

      //   if (routineStateGrpcTemp == EntityStateGRPC.addingNewRoutine.toString()) {
      //     IRoutineCbjRepository.instance.addNewRoutineAndSaveItToLocalDb(
      //       routineCbj.copyWith(
      //         entityStateGRPC: RoutineCbjDeviceStateGRPC(
      //           EntityStateGRPC.waitingInComp.toString(),
      //         ),
      //       ),
      //     );
      //   } else {
      //     // For a way to active it manually
      //     // IRoutineCbjRepository.instance.activateRoutine(routineCbj);
      //   }
    } else {
      icLogger.w('Request from app does not support this sending device type');
    }
  }
}
