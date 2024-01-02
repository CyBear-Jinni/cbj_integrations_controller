part of 'package:cbj_integrations_controller/src/domain/scene/i_scene_cbj_repository.dart';

class _SceneCbjRepository implements ISceneCbjRepository {
  @override
  BehaviorSubject<Set<SceneCbjEntity>>
      scenesResponseFromTheHubStreamController =
      BehaviorSubject<Set<SceneCbjEntity>>();

  @override
  Future<bool> activateScene(SceneCbjEntity sceneCbj) {
    // TODO: implement activateScene
    throw UnimplementedError();
  }

  @override
  Future<Either<SceneCbjFailure, Unit>> activateScenes(
    Set<SceneCbjEntity> scenesList,
  ) {
    // TODO: implement activateScenes
    throw UnimplementedError();
  }

  @override
  Future<Either<SceneCbjFailure, Unit>>
      addDevicesToMultipleScenesAreaTypeWithPreSetActions({
    required Set<String> devicesId,
    required Set<String> scenesId,
    required Set<String> areaTypes,
  }) {
    // TODO: implement addDevicesToMultipleScenesAreaTypeWithPreSetActions
    throw UnimplementedError();
  }

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addDevicesToSceneAreaTypeWithPreSetActions({
    required Set<String> devicesId,
    required String sceneId,
    required AreaPurposesTypes areaType,
  }) {
    // TODO: implement addDevicesToSceneAreaTypeWithPreSetActions
    throw UnimplementedError();
  }

  @override
  Future<Either<SceneCbjFailure, String>> addNewScene(SceneCbjEntity sceneCbj) {
    // TODO: implement addNewScene
    throw UnimplementedError();
  }

  @override
  Future<Either<SceneCbjFailure, String>> addNewSceneAndSaveInDb(
    SceneCbjEntity sceneCbj,
  ) {
    // TODO: implement addNewSceneAndSaveInDb
    throw UnimplementedError();
  }

  @override
  void addOrUpdateNewSceneInApp(SceneCbjEntity sceneCbj) {
    // TODO: implement addOrUpdateNewSceneInApp
  }

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>> addOrUpdateNewSceneInHub(
    SceneCbjEntity sceneCbjEntity,
  ) {
    // TODO: implement addOrUpdateNewSceneInHub
    throw UnimplementedError();
  }

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addOrUpdateNewSceneInHubFromDevicesPropertyActionList(
    String sceneName,
    Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
    AreaPurposesTypes areaPurposesTypes,
  ) {
    // TODO: implement addOrUpdateNewSceneInHubFromDevicesPropertyActionList
    throw UnimplementedError();
  }

  @override
  Future<Set<SceneCbjEntity>> getAllScenesAsList() {
    // TODO: implement getAllScenesAsList
    throw UnimplementedError();
  }

  @override
  Future<Map<String, SceneCbjEntity>> getAllScenesAsMap() {
    // TODO: implement getAllScenesAsMap
    throw UnimplementedError();
  }

  @override
  Future<String> getFullMqttPathOfScene(SceneCbjEntity sceneCbj) {
    // TODO: implement getFullMqttPathOfScene
    throw UnimplementedError();
  }

  @override
  Future<void> initiateHubConnection() {
    // TODO: implement initiateHubConnection
    throw UnimplementedError();
  }

  @override
  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateScenesAndSmartDevicesToDb() {
    // TODO: implement saveAndActivateScenesAndSmartDevicesToDb
    throw UnimplementedError();
  }

  @override
  Future<void> setUpAllFromDb() {
    // TODO: implement setUpAllFromDb
    throw UnimplementedError();
  }

  @override
  Stream<Either<SceneCbjFailure, Set<SceneCbjEntity>>> watchAllScenes() {
    // TODO: implement watchAllScenes
    throw UnimplementedError();
  }
}
