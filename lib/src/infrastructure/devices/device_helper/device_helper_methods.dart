import 'dart:convert';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_object_dtos.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
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
    RequestsAndStatusFromHub entityDto,
  ) {
    // if (entityDto is DeviceEntityDtoBase) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.entityType.name,
    //     allRemoteCommands: DeviceHelper.convertDtoToJsonString(entityDto),
    //   );
    // } else if (entityDto is AreaEntityDtos) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.areaType.name,
    //     allRemoteCommands: jsonEncode(entityDto.toJson()),
    //   );
    // } else if (entityDto is SceneCbjDtos) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.sceneType.name,
    //     allRemoteCommands: jsonEncode(entityDto.toJson()),
    //   );
    // } else if (entityDto is RoutineCbjDtos) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.routineType.name,
    //     allRemoteCommands: jsonEncode(entityDto.toJson()),
    //   );
    // } else {
    //   icLogger.w('Not sure what type to send');
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.undefinedType.name,
    //     allRemoteCommands: '',
    //   );
    // }
    return entityDto;
  }

  Future handleClientStatusRequests(
    ClientStatusRequests clientStatusRequests,
  ) async {
    icLogger.i('Got From App');
    final SendingType sendingType =
        SendingTypeExtension.fromString(clientStatusRequests.sendingType);

    switch (sendingType) {
      case SendingType.routineType:
        final Map<String, dynamic> jsonRoutineFromJsonString =
            jsonDecode(clientStatusRequests.allRemoteCommands)
                as Map<String, dynamic>;

        return RoutineCbjDtos.fromJson(jsonRoutineFromJsonString);

      case SendingType.vendorLoginType:
        final VendorLoginEntityDtos dtoEntity = VendorLoginEntityDtos.fromJson(
          jsonDecode(clientStatusRequests.allRemoteCommands)
              as Map<String, dynamic>,
        );
        return IcSynchronizer().loginVendor(dtoEntity.toDomain());
      case SendingType.firstConnection:
        IHubServerController.instance.sendAllAreasFromHubRequestsStream();
        IHubServerController.instance.sendAllEntitiesFromHubRequestsStream();
        IHubServerController.instance.sendAllScenesFromHubRequestsStream();
        return;
      case SendingType.allEntities:
        IHubServerController.instance.sendAllEntities();
      case SendingType.allAreas:
        IHubServerController.instance.sendAllAreas();
      case SendingType.allScenes:
        IHubServerController.instance.sendAllScenes();
      case SendingType.setEntitiesAction:
        final RequestActionObject action =
            RequestActionObjectDtos.fromJsonString(
          clientStatusRequests.allRemoteCommands,
        ).toDomain();
        IcSynchronizer().setEntitiesState(action);
        return;
      case SendingType.remotePipesInformation:
      // final Map<String, dynamic> jsonDecoded =
      //     jsonDecode(clientStatusRequests.allRemoteCommands)
      //         as Map<String, dynamic>;

      // return RemotePipesDtos.fromJson(jsonDecoded);
      case SendingType.getHubEntityInfo:
      case SendingType.responseHubEntityInfo:
      case SendingType.areaType:
      //  AreaEntityDtos.fromJson(
      //       jsonDecode(clientStatusRequests.allRemoteCommands)
      //           as Map<String, dynamic>,
      //     );
      case SendingType.location:
      case SendingType.undefinedType:
      case SendingType.stringType:
      case SendingType.partialEntityType:
      case SendingType.entityType:
      //  return DeviceHelper.convertJsonStringToDto(
      //       clientStatusRequests.allRemoteCommands,
      //     );
      case SendingType.mqttMassageType:
      case SendingType.sceneType:
      // final Map<String, dynamic> jsonSceneFromJsonString =
      //     jsonDecode(clientStatusRequests.allRemoteCommands)
      //         as Map<String, dynamic>;

      // return SceneCbjDtos.fromJson(jsonSceneFromJsonString);
      case SendingType.scheduleType:
      case SendingType.bindingsType:
    }

    icLogger.w('Request from app does not support this sending device type');
  }
}
