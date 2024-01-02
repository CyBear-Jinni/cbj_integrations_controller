import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/domain/area/area_entity.dart';
import 'package:cbj_integrations_controller/domain/area/value_objects_area.dart';
import 'package:cbj_integrations_controller/domain/core/value_objects.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/scene/value_objects_scene_cbj.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/demo_connection_service_integrations_controller.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/device_helper/device_helper.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';

class HubClientDemo {
  ///  Creates a stream with the Hub
  static Future createStreamWithHub() async {
    try {
      await firstConnection();
    } catch (e) {
      icLogger.e('Error in demo Hub\n$e');
    }
  }

  static Future<void> firstConnection() async {
    for (final RequestsAndStatusFromHub areaRequest in getAllAreas()) {
      HubRequestsToApp.streamRequestsToApp.add(areaRequest);
    }

    for (final RequestsAndStatusFromHub devicesRequest in getAllDevices()) {
      HubRequestsToApp.streamRequestsToApp.add(devicesRequest);
    }

    for (final RequestsAndStatusFromHub sceneRequest in getAllScenes()) {
      HubRequestsToApp.streamRequestsToApp.add(sceneRequest);
    }
  }

  static List<RequestsAndStatusFromHub> getAllAreas() {
    final List<RequestsAndStatusFromHub> areasList = [];

    const SendingType sendingTypeArea = SendingType.areaType;

    /// Discovered Area

    final AreaEntity allRemoteCommandsAreaDiscovered = AreaEntity(
      uniqueId: AreaUniqueId.discovered(),
      cbjEntityName: AreaDefaultName('Discovered'),
      areaTypes: AreaTypes(const {}),
      areaDevicesId:
          AreaDevicesId(const {'65d84b10-434d-11ed-817a-7d350fb52f91'}),
      areaScenesId: AreaScenesId(const {}),
      areaRoutinesId: AreaRoutinesId(const {}),
      areaBindingsId: AreaBindingsId(const {}),
      areaMostUsedBy: AreaMostUsedBy(const {}),
      areaPermissions: AreaPermissions(const {}),
      background: AreaBackground(
        'https://images.pexels.com/photos/459654/pexels-photo-459654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubAreaDiscovered =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeArea,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsAreaDiscovered.toInfrastructure().toJson(),
      ),
    );
    areasList.add(requestsAndStatusFromHubAreaDiscovered);

    /// Guy Area

    final AreaEntity allRemoteCommandsAreaGuy = AreaEntity(
      uniqueId:
          AreaUniqueId.fromUniqueString('23deb7f0-4193-11ed-9d1c-5747056d7848'),
      cbjEntityName: AreaDefaultName('Guy Area'),
      areaTypes: AreaTypes({
        AreaPurposesTypes.bedarea.value.toString(),
        AreaPurposesTypes.studyArea.value.toString(),
        AreaPurposesTypes.workArea.value.toString(),
        AreaPurposesTypes.videoGames.value.toString(),
      }),
      areaDevicesId: AreaDevicesId(const {
        'a31523m6-463s-32ge-7426-g33c642r7m25',
        'c90137f2-419b-11ed-8246-e17a279f4d89',
        '96386cd0-419b-11ed-8246-e17a279f4d89',
      }),
      areaScenesId:
          AreaScenesId(const {'01bd6880-419b-11ed-af10-f75196d26a5e'}),
      areaRoutinesId: AreaRoutinesId(const {}),
      areaBindingsId: AreaBindingsId(const {}),
      areaMostUsedBy: AreaMostUsedBy(const {}),
      areaPermissions: AreaPermissions(const {}),
      background: AreaBackground(
        'https://images.pexels.com/photos/459654/pexels-photo-459654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubAreaGuy =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeArea,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsAreaGuy.toInfrastructure().toJson(),
      ),
    );
    areasList.add(requestsAndStatusFromHubAreaGuy);

    /// Out Side Area

    final AreaEntity allRemoteCommandsAreaOutSide = AreaEntity(
      uniqueId:
          AreaUniqueId.fromUniqueString('38b45780-419c-11ed-bce9-8dc09da0062f'),
      cbjEntityName: AreaDefaultName('Outside'),
      areaTypes: AreaTypes({
        AreaPurposesTypes.bedarea.value.toString(),
        AreaPurposesTypes.studyArea.value.toString(),
        AreaPurposesTypes.workArea.value.toString(),
        AreaPurposesTypes.livingArea.value.toString(),
      }),
      areaDevicesId:
          AreaDevicesId(const {'gcvweg3y-bv2s-cvwe-bdmf-7h4f3f2dw2d1'}),
      areaScenesId: AreaScenesId(const {}),
      areaRoutinesId: AreaRoutinesId(const {}),
      areaBindingsId: AreaBindingsId(const {}),
      areaMostUsedBy: AreaMostUsedBy(const {}),
      areaPermissions: AreaPermissions(const {}),
      background: AreaBackground(
        'https://images.pexels.com/photos/459654/pexels-photo-459654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubAreaOutSide =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeArea,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsAreaOutSide.toInfrastructure().toJson(),
      ),
    );
    areasList.add(requestsAndStatusFromHubAreaOutSide);

    /// Out Side Area

    final AreaEntity allRemoteCommandsAreaAmi = AreaEntity(
      uniqueId:
          AreaUniqueId.fromUniqueString('gai23tds-f3t7-vxa2-dvnn-hykkjty8567d'),
      cbjEntityName: AreaDefaultName('Ami Area'),
      areaTypes: AreaTypes({
        AreaPurposesTypes.bedarea.value.toString(),
        AreaPurposesTypes.studyArea.value.toString(),
        AreaPurposesTypes.workArea.value.toString(),
        AreaPurposesTypes.livingArea.value.toString(),
      }),
      areaDevicesId: AreaDevicesId(const {
        '7189ed76-4351-11ed-b249-63fd7e165c16',
        'sfds344t-sdf3-fd3d-24s4-bd2sdf3n5rfd',
        'wfdsg2w6-fgde-234s-vbz2-b234jmgvbfd6',
      }),
      areaScenesId: AreaScenesId(const {}),
      areaRoutinesId: AreaRoutinesId(const {}),
      areaBindingsId: AreaBindingsId(const {}),
      areaMostUsedBy: AreaMostUsedBy(const {}),
      areaPermissions: AreaPermissions(const {}),
      background: AreaBackground(
        'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubAreaAmi =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeArea,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsAreaAmi.toInfrastructure().toJson(),
      ),
    );
    areasList.add(requestsAndStatusFromHubAreaAmi);

    return areasList;
  }

  static List<RequestsAndStatusFromHub> getAllDevices() {
    final List<RequestsAndStatusFromHub> devicesList = [];

    final HashMap<String, DeviceEntityBase> demoDevices =
        DemoConnectionController.getAllEntities();

    const SendingType sendingTypeDevice = SendingType.entityType;

    for (final DeviceEntityBase entity in demoDevices.values.toList()) {
      final RequestsAndStatusFromHub requestsAndStatusFromHubBlinds =
          RequestsAndStatusFromHub(
        sendingType: sendingTypeDevice,
        allRemoteCommands: DeviceHelper.convertDomainToJsonString(entity),
      );

      devicesList.add(requestsAndStatusFromHubBlinds);
    }
    return devicesList;
  }

  static List<RequestsAndStatusFromHub> getAllScenes() {
    final List<RequestsAndStatusFromHub> scenesList = [];

    const SendingType sendingTypeDevice = SendingType.sceneType;

    /// Study Scene

    final SceneCbjEntity allRemoteCommandsSceneOpen = SceneCbjEntity(
      uniqueId:
          UniqueId.fromUniqueString('01bd6880-419b-11ed-af10-f75196d26a5e'),
      name: SceneCbjName('Study Scene'),
      backgroundColor: SceneCbjBackgroundColor('0xFFFF9800'),
      nodeRedFlowId: SceneCbjNodeRedFlowId('6b63068c3c970eeb'),
      automationString: SceneCbjAutomationString('[]'),
      firstNodeId: SceneCbjFirstNodeId('3f1a9440-41a1-11ed-8b6a-5f136f4fe196'),
      iconCodePoint: SceneCbjIconCodePoint(null),
      image: SceneCbjBackgroundImage(null),
      lastDateOfExecute: SceneCbjLastDateOfExecute(null),
      stateMassage: SceneCbjStateMassage(null),
      senderDeviceOs: SceneCbjSenderDeviceOs(null),
      senderDeviceModel: SceneCbjSenderDeviceModel(null),
      senderId: SceneCbjSenderId(null),
      compUuid: SceneCbjCompUuid(null),
      entityStateGRPC: SceneCbjDeviceStateGRPC('waitingInComp'),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubSceneOpen =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeDevice,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsSceneOpen.toInfrastructure().toJson(),
      ),
    );

    scenesList.add(requestsAndStatusFromHubSceneOpen);

    return scenesList;
  }

  ///  Get Hub computer and software info
  static Future<CompHubInfo?> getHubCompInfo(
    String addressToHub,
    int hubPort,
    CompHubInfo compHubInfo,
  ) async {
    return null;
  }
}
