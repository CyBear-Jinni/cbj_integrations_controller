import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/domain/core/value_objects.dart';
import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/domain/room/value_objects_room.dart';
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
    for (final RequestsAndStatusFromHub roomRequest in getAllRooms()) {
      HubRequestsToApp.streamRequestsToApp.add(roomRequest);
    }

    for (final RequestsAndStatusFromHub devicesRequest in getAllDevices()) {
      HubRequestsToApp.streamRequestsToApp.add(devicesRequest);
    }

    for (final RequestsAndStatusFromHub sceneRequest in getAllScenes()) {
      HubRequestsToApp.streamRequestsToApp.add(sceneRequest);
    }
  }

  static List<RequestsAndStatusFromHub> getAllRooms() {
    final List<RequestsAndStatusFromHub> roomsList = [];

    const SendingType sendingTypeRoom = SendingType.roomType;

    /// Discovered Room

    final RoomEntity allRemoteCommandsRoomDiscovered = RoomEntity(
      uniqueId: RoomUniqueId.discovered(),
      cbjEntityName: RoomDefaultName('Discovered'),
      roomTypes: RoomTypes(const {}),
      roomDevicesId:
          RoomDevicesId(const {'65d84b10-434d-11ed-817a-7d350fb52f91'}),
      roomScenesId: RoomScenesId(const {}),
      roomRoutinesId: RoomRoutinesId(const {}),
      roomBindingsId: RoomBindingsId(const {}),
      roomMostUsedBy: RoomMostUsedBy(const {}),
      roomPermissions: RoomPermissions(const {}),
      background: RoomBackground(
        'https://images.pexels.com/photos/459654/pexels-photo-459654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubRoomDiscovered =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeRoom,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsRoomDiscovered.toInfrastructure().toJson(),
      ),
    );
    roomsList.add(requestsAndStatusFromHubRoomDiscovered);

    /// Guy Room

    final RoomEntity allRemoteCommandsRoomGuy = RoomEntity(
      uniqueId:
          RoomUniqueId.fromUniqueString('23deb7f0-4193-11ed-9d1c-5747056d7848'),
      cbjEntityName: RoomDefaultName('Guy Room'),
      roomTypes: RoomTypes({
        AreaPurposesTypes.bedroom.value.toString(),
        AreaPurposesTypes.studyRoom.value.toString(),
        AreaPurposesTypes.workRoom.value.toString(),
        AreaPurposesTypes.videoGames.value.toString(),
      }),
      roomDevicesId: RoomDevicesId(const {
        'a31523m6-463s-32ge-7426-g33c642r7m25',
        'c90137f2-419b-11ed-8246-e17a279f4d89',
        '96386cd0-419b-11ed-8246-e17a279f4d89',
      }),
      roomScenesId:
          RoomScenesId(const {'01bd6880-419b-11ed-af10-f75196d26a5e'}),
      roomRoutinesId: RoomRoutinesId(const {}),
      roomBindingsId: RoomBindingsId(const {}),
      roomMostUsedBy: RoomMostUsedBy(const {}),
      roomPermissions: RoomPermissions(const {}),
      background: RoomBackground(
        'https://images.pexels.com/photos/459654/pexels-photo-459654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubRoomGuy =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeRoom,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsRoomGuy.toInfrastructure().toJson(),
      ),
    );
    roomsList.add(requestsAndStatusFromHubRoomGuy);

    /// Out Side Room

    final RoomEntity allRemoteCommandsRoomOutSide = RoomEntity(
      uniqueId:
          RoomUniqueId.fromUniqueString('38b45780-419c-11ed-bce9-8dc09da0062f'),
      cbjEntityName: RoomDefaultName('Outside'),
      roomTypes: RoomTypes({
        AreaPurposesTypes.bedroom.value.toString(),
        AreaPurposesTypes.studyRoom.value.toString(),
        AreaPurposesTypes.workRoom.value.toString(),
        AreaPurposesTypes.livingRoom.value.toString(),
      }),
      roomDevicesId:
          RoomDevicesId(const {'gcvweg3y-bv2s-cvwe-bdmf-7h4f3f2dw2d1'}),
      roomScenesId: RoomScenesId(const {}),
      roomRoutinesId: RoomRoutinesId(const {}),
      roomBindingsId: RoomBindingsId(const {}),
      roomMostUsedBy: RoomMostUsedBy(const {}),
      roomPermissions: RoomPermissions(const {}),
      background: RoomBackground(
        'https://images.pexels.com/photos/459654/pexels-photo-459654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubRoomOutSide =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeRoom,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsRoomOutSide.toInfrastructure().toJson(),
      ),
    );
    roomsList.add(requestsAndStatusFromHubRoomOutSide);

    /// Out Side Room

    final RoomEntity allRemoteCommandsRoomAmi = RoomEntity(
      uniqueId:
          RoomUniqueId.fromUniqueString('gai23tds-f3t7-vxa2-dvnn-hykkjty8567d'),
      cbjEntityName: RoomDefaultName('Ami Room'),
      roomTypes: RoomTypes({
        AreaPurposesTypes.bedroom.value.toString(),
        AreaPurposesTypes.studyRoom.value.toString(),
        AreaPurposesTypes.workRoom.value.toString(),
        AreaPurposesTypes.livingRoom.value.toString(),
      }),
      roomDevicesId: RoomDevicesId(const {
        '7189ed76-4351-11ed-b249-63fd7e165c16',
        'sfds344t-sdf3-fd3d-24s4-bd2sdf3n5rfd',
        'wfdsg2w6-fgde-234s-vbz2-b234jmgvbfd6',
      }),
      roomScenesId: RoomScenesId(const {}),
      roomRoutinesId: RoomRoutinesId(const {}),
      roomBindingsId: RoomBindingsId(const {}),
      roomMostUsedBy: RoomMostUsedBy(const {}),
      roomPermissions: RoomPermissions(const {}),
      background: RoomBackground(
        'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ),
    );

    final RequestsAndStatusFromHub requestsAndStatusFromHubRoomAmi =
        RequestsAndStatusFromHub(
      sendingType: sendingTypeRoom,
      allRemoteCommands: jsonEncode(
        allRemoteCommandsRoomAmi.toInfrastructure().toJson(),
      ),
    );
    roomsList.add(requestsAndStatusFromHubRoomAmi);

    return roomsList;
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
