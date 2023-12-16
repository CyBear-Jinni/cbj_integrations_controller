import 'dart:convert';

import 'package:cbj_integrations_controller/domain/i_app_communication_repository.dart';
import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/i_saved_rooms_repo.dart';
import 'package:cbj_integrations_controller/domain/routine/i_routine_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/routine/routine_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/routine/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/domain/scene/i_scene_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/scene/value_objects_scene_cbj.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/device_helper/device_helper.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_login_abstract/login_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/remote_pipes/remote_pipes_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/room/room_entity_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/routines/routine_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/scene_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors/vendor_utils.dart';

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
    if (entityDto is DeviceEntityDtoAbstract) {
      return RequestsAndStatusFromHub(
        sendingType: SendingType.entityType,
        allRemoteCommands: DeviceHelper.convertDtoToJsonString(entityDto),
      );
    } else if (entityDto is RoomEntityDtos) {
      return RequestsAndStatusFromHub(
        sendingType: SendingType.roomType,
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
    if (clientStatusRequests.sendingType == SendingType.entityType) {
      return DeviceHelper.convertJsonStringToDto(
        clientStatusRequests.allRemoteCommands,
      );
    } else if (clientStatusRequests.sendingType == SendingType.roomType) {
      return RoomEntityDtos.fromJson(
        jsonDecode(clientStatusRequests.allRemoteCommands)
            as Map<String, dynamic>,
      );
    } else if (clientStatusRequests.sendingType ==
        SendingType.vendorLoginType) {
      return VendorUtils.convertJsonStringToDto(
        clientStatusRequests.allRemoteCommands,
      );
    } else if (clientStatusRequests.sendingType ==
        SendingType.remotePipesInformation) {
      final Map<String, dynamic> jsonDecoded =
          jsonDecode(clientStatusRequests.allRemoteCommands)
              as Map<String, dynamic>;

      return RemotePipesDtos.fromJson(jsonDecoded);
    } else if (clientStatusRequests.sendingType == SendingType.sceneType) {
      final Map<String, dynamic> jsonSceneFromJsonString =
          jsonDecode(clientStatusRequests.allRemoteCommands)
              as Map<String, dynamic>;

      return SceneCbjDtos.fromJson(jsonSceneFromJsonString);
    } else if (clientStatusRequests.sendingType == SendingType.routineType) {
      final Map<String, dynamic> jsonRoutineFromJsonString =
          jsonDecode(clientStatusRequests.allRemoteCommands)
              as Map<String, dynamic>;

      return RoutineCbjDtos.fromJson(jsonRoutineFromJsonString);
    } else {
      icLogger.w('Request from app does not support this sending device type');
    }

    return null;
  }

  Future handleClientStatusRequests(
    ClientStatusRequests clientStatusRequests,
  ) async {
    icLogger.i('Got From App');

    final dynamic dtoEntity =
        clientStatusRequestsToItsDtoType(clientStatusRequests);

    if (dtoEntity is DeviceEntityDtoAbstract) {
      final DeviceEntityAbstract deviceEntityAbstract = dtoEntity.toDomain();
      deviceEntityAbstract.entityStateGRPC =
          EntityState.state(EntityStateGRPC.waitingInComp);

      IMqttServerRepository.instance.postToHubMqtt(
        entityFromTheApp: deviceEntityAbstract,
        gotFromApp: true,
      );
    } else if (dtoEntity is RoomEntityDtos) {
      ISavedRoomsRepo.instance.saveAndActiveRoomToDb(
        roomEntity: dtoEntity.toDomain(),
      );

      IMqttServerRepository.instance.postToHubMqtt(
        entityFromTheApp: dtoEntity,
        gotFromApp: true,
      );
    } else if (dtoEntity is LoginEntityDtoAbstract) {
      ISavedDevicesRepo.instance
          .saveAndActivateVendorLoginCredentialsDomainToDb(
        loginEntity: dtoEntity.toDomain(),
      );
    } else if (clientStatusRequests.sendingType ==
        SendingType.firstConnection) {
      IAppCommunicationRepository.instance.sendAllRoomsFromHubRequestsStream();
      IAppCommunicationRepository.instance
          .sendAllDevicesFromHubRequestsStream();
      IAppCommunicationRepository.instance.sendAllScenesFromHubRequestsStream();
    } else if (dtoEntity is RemotePipesDtos) {
      ISavedDevicesRepo.instance.saveAndActivateRemotePipesDomainToDb(
        remotePipes: dtoEntity.toDomain(),
      );
    } else if (dtoEntity is SceneCbjDtos) {
      final SceneCbjEntity sceneCbj = dtoEntity.toDomain();

      final String sceneStateGrpcTemp = sceneCbj.entityStateGRPC.getOrCrash()!;

      final SceneCbjEntity sceneCopy = sceneCbj.copyWith(
        entityStateGRPC: SceneCbjDeviceStateGRPC(
          EntityStateGRPC.waitingInComp.toString(),
        ),
      );

      if (sceneStateGrpcTemp == EntityStateGRPC.addingNewScene.toString()) {
        ISceneCbjRepository.instance.addNewSceneAndSaveInDb(sceneCopy);
      } else {
        ISceneCbjRepository.instance.activateScene(sceneCopy);
      }
    } else if (dtoEntity is RoutineCbjDtos) {
      final RoutineCbjEntity routineCbj = dtoEntity.toDomain();

      final String routineStateGrpcTemp =
          routineCbj.entityStateGRPC.getOrCrash()!;

      if (routineStateGrpcTemp == EntityStateGRPC.addingNewRoutine.toString()) {
        IRoutineCbjRepository.instance.addNewRoutineAndSaveItToLocalDb(
          routineCbj.copyWith(
            entityStateGRPC: RoutineCbjDeviceStateGRPC(
              EntityStateGRPC.waitingInComp.toString(),
            ),
          ),
        );
      } else {
        // For a way to active it manually
        // IRoutineCbjRepository.instance.activateRoutine(routineCbj);
      }
    } else {
      icLogger.w('Request from app does not support this sending device type');
    }
  }
}
