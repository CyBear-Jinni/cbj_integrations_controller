import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

part 'package:cbj_integrations_controller/src/infrastructure/scenes/scene_repository.dart';

@Deprecated('New architecture. Moved to AutomationService')
abstract class ISceneCbjRepository {
  static ISceneCbjRepository? _instance;

  static ISceneCbjRepository get instance {
    return _instance ??= _SceneCbjRepository();
  }

  /// Setting up all scenes from db
  Future setUpAllFromDb();

  Future<Set<SceneCbjEntity>> getAllScenesAsList();

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

  Stream<Either<SceneCbjFailure, Set<SceneCbjEntity>>> watchAllScenes();

  /// Sending the new scene to the hub to get added
  Future<Either<SceneCbjFailure, SceneCbjEntity>> addOrUpdateNewSceneInHub(
    SceneCbjEntity sceneCbjEntity,
  );

  /// Activate action of all scene list
  Future<Either<SceneCbjFailure, Unit>> activateScenes(
    Set<SceneCbjEntity> scenesList,
  );

  /// Will add all the devices to area scene, for each device will use the preselected
  /// actions for that area type
  Future<Either<SceneCbjFailure, Unit>>
      addDevicesToMultipleScenesAreaTypeWithPreSetActions({
    required Set<String> devicesId,
    required Set<String> scenesId,
    required Set<String> areaTypes,
  });

  /// Will add all the devices to area scene, for each device will use the preselected
  /// actions for that area type
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addDevicesToSceneAreaTypeWithPreSetActions({
    required Set<String> devicesId,
    required String sceneId,
    required AreaPurposesTypes areaType,
  });

  /// Sending the new scene from the hub to the app scene list
  void addOrUpdateNewSceneInApp(
    SceneCbjEntity sceneCbj,
  );

  Future initiateHubConnection();

  BehaviorSubject<Set<SceneCbjEntity>>
      scenesResponseFromTheHubStreamController =
      BehaviorSubject<Set<SceneCbjEntity>>();
}
