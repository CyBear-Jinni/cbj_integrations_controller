part of 'package:cbj_integrations_controller/src/domain/scene/i_scene_cbj_repository.dart';

@Deprecated('New architecture. Moved to AutomationService')
class _SceneCbjRepository implements ISceneCbjRepository {
  @override
  BehaviorSubject<Set<SceneCbjEntity>>
      scenesResponseFromTheHubStreamController =
      BehaviorSubject<Set<SceneCbjEntity>>();

  @override
  Future<bool> activateScene(SceneCbjEntity sceneCbj) async => false;

  @override
  Future<Either<SceneCbjFailure, Unit>> activateScenes(
    Set<SceneCbjEntity> scenesList,
  ) async =>
      const Left(SceneCbjFailure.unexpected());

  @override
  Future<Either<SceneCbjFailure, Unit>>
      addDevicesToMultipleScenesAreaTypeWithPreSetActions({
    required Set<String> devicesId,
    required Set<String> scenesId,
    required Set<String> areaTypes,
  }) async =>
          const Left(SceneCbjFailure.unexpected());

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addDevicesToSceneAreaTypeWithPreSetActions({
    required Set<String> devicesId,
    required String sceneId,
    required AreaPurposesTypes areaType,
  }) async =>
          const Left(SceneCbjFailure.unexpected());

  @override
  Future<Either<SceneCbjFailure, String>> addNewScene(
    SceneCbjEntity sceneCbj,
  ) async =>
      const Left(SceneCbjFailure.unexpected());

  @override
  Future<Either<SceneCbjFailure, String>> addNewSceneAndSaveInDb(
    SceneCbjEntity sceneCbj,
  ) async =>
      const Left(SceneCbjFailure.unexpected());

  @override
  void addOrUpdateNewSceneInApp(SceneCbjEntity sceneCbj) {}

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>> addOrUpdateNewSceneInHub(
    SceneCbjEntity sceneCbjEntity,
  ) async =>
      const Left(SceneCbjFailure.unexpected());

  @override
  Future<Set<SceneCbjEntity>> getAllScenesAsList() async => {};

  @override
  Future<Map<String, SceneCbjEntity>> getAllScenesAsMap() async =>
      <String, SceneCbjEntity>{};

  @override
  Future<String> getFullMqttPathOfScene(SceneCbjEntity sceneCbj) async {
    return '';
  }

  @override
  Future initiateHubConnection() async {}

  @override
  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateScenesAndSmartDevicesToDb() async {
    return const Left(LocalDbFailures.unexpected());
  }

  @override
  Future setUpAllFromDb() async {}

  @override
  Stream<Either<SceneCbjFailure, Set<SceneCbjEntity>>>
      watchAllScenes() async* {}
}
