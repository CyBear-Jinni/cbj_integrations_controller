import 'dart:collection';
import 'dart:math';

import 'package:cbj_integrations_controller/domain/binding/binding_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/local_db/i_local_db_repository.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/domain/room/value_objects_room.dart';
import 'package:cbj_integrations_controller/domain/routine/routine_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/scene/i_scene_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:dartz/dartz.dart';

part 'package:cbj_integrations_controller/infrastructure/room/saved_rooms_repo.dart';

abstract class ISavedRoomsRepo {
  static ISavedRoomsRepo? _instance;

  static ISavedRoomsRepo get instance {
    return _instance ??= _SavedRoomsRepo();
  }

  /// Setting up all rooms from db
  Future<void> setUpAllFromDb();

  /// Add new room to saved rooms list
  RoomEntity addOrUpdateRoom(RoomEntity roomEntity);

  /// Check if the device exist in one of the rooms, if not will add it to
  /// Discovered room
  void addDeviceToRoomDiscoveredIfNotExist(DeviceEntityAbstract deviceEntity);

  /// Check if the scene exist in one of the rooms, if not will add it to
  /// Discovered room
  void addSceneToRoomDiscoveredIfNotExist(SceneCbjEntity sceneCbjEntity);

  /// Check if the routine exist in one of the rooms, if not will add it to
  /// Discovered room
  void addRoutineToRoomDiscoveredIfNotExist(RoutineCbjEntity routineCbjEntity);

  /// Check if the binding exist in one of the rooms, if not will add it to
  /// Discovered room
  void addBindingToRoomDiscoveredIfNotExist(BindingCbjEntity bindingCbjEntity);

  AreaPurposesTypes? getAreaTypeFromNameCapsWithSpaces(
    String areaNameCapsAndSpaces,
  );

  Future<Either<LocalDbFailures, Unit>> saveAndActiveRoomToDb({
    required RoomEntity roomEntity,
  });

  Future<Either<LocalDbFailures, RoomEntity>>
      createScenesForAllSelectedRoomTypes({
    required RoomEntity roomEntity,
  });

  /// Get all saved rooms
  Map<String, RoomEntity> getAllRooms();
}
