import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/i_saved_rooms_repo.dart';
import 'package:cbj_integrations_controller/domain/local_db/i_local_db_repository.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_failures.dart';
import 'package:cbj_integrations_controller/domain/scene/value_objects_scene_cbj.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/node_red/node_red_converter.dart';
import 'package:cbj_integrations_controller/infrastructure/node_red/node_red_repository.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/area_types_scientific_presets/area_type_with_device_type_preset.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

part 'package:cbj_integrations_controller/infrastructure/scenes/scene_repository.dart';

abstract class ISceneCbjRepository {
  static ISceneCbjRepository? _instance;

  static ISceneCbjRepository get instance {
    return _instance ??= _SceneCbjRepository();
  }

  /// Setting up all scenes from db
  Future<void> setUpAllFromDb();

  Future<List<SceneCbjEntity>> getAllScenesAsList();

  Future<Map<String, SceneCbjEntity>> getAllScenesAsMap();

  /// Will add new scene without saving it in the local db
  Future<Either<SceneCbjFailure, String>> addNewScene(
    SceneCbjEntity sceneCbj,
  );

  /// Sending the new scene to the hub to get added
  Future<Either<SceneCbjFailure, String>> addNewSceneAndSaveInDb(
    SceneCbjEntity sceneCbj,
  );

  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateScenesAndSmartDevicesToDb();

  Future<bool> activateScene(
    SceneCbjEntity sceneCbj,
  );

  /// Get entity and return the full MQTT path to it
  Future<String> getFullMqttPathOfScene(SceneCbjEntity sceneCbj);

  Stream<Either<SceneCbjFailure, KtList<SceneCbjEntity>>> watchAllScenes();

  /// Sending the new scene to the hub to get added
  Future<Either<SceneCbjFailure, SceneCbjEntity>> addOrUpdateNewSceneInHub(
    SceneCbjEntity sceneCbjEntity,
  );

  /// Activate action of all scene list
  Future<Either<SceneCbjFailure, Unit>> activateScenes(
    KtList<SceneCbjEntity> scenesList,
  );

  /// Sending the new scene to the hub to get added
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addOrUpdateNewSceneInHubFromDevicesPropertyActionList(
    String sceneName,
    List<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
    AreaPurposesTypes areaPurposesTypes,
  );

  /// Will add all the devices to area scene, for each device will use the preselected
  /// actions for that area type
  Future<Either<SceneCbjFailure, Unit>>
      addDevicesToMultipleScenesAreaTypeWithPreSetActions({
    required List<String> devicesId,
    required List<String> scenesId,
    required List<String> areaTypes,
  });

  /// Will add all the devices to area scene, for each device will use the preselected
  /// actions for that area type
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addDevicesToSceneAreaTypeWithPreSetActions({
    required List<String> devicesId,
    required String sceneId,
    required AreaPurposesTypes areaType,
  });

  /// Sending the new scene from the hub to the app scene list
  void addOrUpdateNewSceneInApp(
    SceneCbjEntity sceneCbj,
  );

  Future<void> initiateHubConnection();

  BehaviorSubject<KtList<SceneCbjEntity>>
      scenesResponseFromTheHubStreamController =
      BehaviorSubject<KtList<SceneCbjEntity>>();
}
