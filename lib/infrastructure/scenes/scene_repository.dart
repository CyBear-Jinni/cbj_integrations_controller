part of 'package:cbj_integrations_controller/domain/scene/i_scene_cbj_repository.dart';

class _SceneCbjRepository implements ISceneCbjRepository {
  final HashMap<String, SceneCbjEntity> _allScenes = HashMap();

  @override
  Future<void> setUpAllFromDb() async {
    await IDbRepository.instance.getScenesFromDb().then((value) {
      value.fold((l) => null, (r) {
        for (final element in r) {
          addNewScene(element);
        }
      });
    });
  }

  @override
  Future<List<SceneCbjEntity>> getAllScenesAsList() async {
    return _allScenes.values.toList();
  }

  @override
  Future<Map<String, SceneCbjEntity>> getAllScenesAsMap() async {
    return _allScenes;
  }

  @override
  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateScenesAndSmartDevicesToDb() async {
    await ISavedDevicesRepo.instance.saveAndActivateSmartDevicesToDb();

    return IDbRepository.instance.saveScenes(
      sceneList: List<SceneCbjEntity>.from(_allScenes.values),
    );
  }

  @override
  Future<Either<SceneCbjFailure, String>> addNewScene(
    SceneCbjEntity sceneCbj,
  ) async {
    SceneCbjEntity tempSceneCbj = sceneCbj;

    final SceneCbjEntity? existingScene =
        findSceneIfAlreadyBeenAdded(tempSceneCbj);

    /// Check if scene already exist
    if (existingScene != null) {
      tempSceneCbj =
          tempSceneCbj.copyWith(nodeRedFlowId: existingScene.nodeRedFlowId);
    }
    _allScenes.addEntries(
      [MapEntry(tempSceneCbj.uniqueId.getOrCrash(), tempSceneCbj)],
    );

    final String entityId = tempSceneCbj.uniqueId.getOrCrash();

    /// If it is new scene
    _allScenes[entityId] = tempSceneCbj;

    String sceneNodeRedFlowId = '';

    if (existingScene == null ||
        tempSceneCbj.automationString.getOrCrash() !=
            existingScene.automationString.getOrCrash()) {
      sceneNodeRedFlowId =
          await NodeRedRepository().createNewNodeRedScene(tempSceneCbj);
    }

    if (sceneNodeRedFlowId.isNotEmpty) {
      tempSceneCbj = tempSceneCbj.copyWith(
        nodeRedFlowId: SceneCbjNodeRedFlowId(sceneNodeRedFlowId),
      );
    }
    ISavedRoomsRepo.instance.addSceneToRoomDiscoveredIfNotExist(tempSceneCbj);
    _allScenes[tempSceneCbj.uniqueId.getOrCrash()] = tempSceneCbj;
    return right(sceneNodeRedFlowId);
  }

  @override
  Future<Either<SceneCbjFailure, String>> addNewSceneAndSaveInDb(
    SceneCbjEntity sceneCbj,
  ) async {
    final Either<SceneCbjFailure, String> sceneNodeRedFlowId =
        await addNewScene(sceneCbj);
    await saveAndActivateScenesAndSmartDevicesToDb();
    return sceneNodeRedFlowId;
  }

  @override
  Future<bool> activateScene(SceneCbjEntity sceneCbj) async {
    final String fullPathOfScene = await getFullMqttPathOfScene(sceneCbj);
    IMqttServerRepository.instance
        .publishMessage(fullPathOfScene, DateTime.now().toString());

    return true;
  }

  /// Get entity and return the full MQTT path to it
  @override
  Future<String> getFullMqttPathOfScene(SceneCbjEntity sceneCbj) async {
    final String hubBaseTopic =
        IMqttServerRepository.instance.getHubBaseTopic();
    final String scenesTopicTypeName =
        IMqttServerRepository.instance.getScenesTopicTypeName();
    final String sceneId = sceneCbj.firstNodeId.getOrCrash()!;

    return '$hubBaseTopic/$scenesTopicTypeName/$sceneId';
  }

  /// Check if all scenes does not contain the same scene already
  /// Will compare the unique id's that each company sent us
  SceneCbjEntity? findSceneIfAlreadyBeenAdded(
    SceneCbjEntity sceneEntity,
  ) {
    return _allScenes[sceneEntity.uniqueId.getOrCrash()];
  }

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>> addOrUpdateNewSceneInHub(
    SceneCbjEntity sceneCbjEntity,
  ) async {
    SceneCbjEntity sceneCbjEntityTemp = sceneCbjEntity;
    final String sceneId = sceneCbjEntityTemp.uniqueId.getOrCrash();
    String nodeRedFlowId = '';

    (await addNewSceneAndSaveInDb(sceneCbjEntityTemp)).fold((l) {}, (r) {
      nodeRedFlowId = r;
    });

    if (nodeRedFlowId.isNotEmpty) {
      sceneCbjEntityTemp = sceneCbjEntityTemp.copyWith(
        nodeRedFlowId: SceneCbjNodeRedFlowId(nodeRedFlowId),
      );
    } else {
      final SceneCbjEntity? tempScene =
          findSceneIfAlreadyBeenAdded(sceneCbjEntityTemp);
      if (tempScene != null) {
        sceneCbjEntityTemp =
            sceneCbjEntityTemp.copyWith(nodeRedFlowId: tempScene.nodeRedFlowId);
        nodeRedFlowId =
            await NodeRedRepository().createNewNodeRedScene(sceneCbjEntityTemp);

        sceneCbjEntityTemp = sceneCbjEntityTemp.copyWith(
          nodeRedFlowId: SceneCbjNodeRedFlowId(nodeRedFlowId),
        );
      }
    }

    _allScenes[sceneId] = sceneCbjEntityTemp;

    saveAndActivateScenesAndSmartDevicesToDb();

    // TODO: Fix after new cbj_integrations_controller
    // AppCommunicationRepository.sendAllScenesFromHubRequestsStream();

    return right(sceneCbjEntityTemp);
  }

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addOrUpdateNewSceneInHubFromDevicesPropertyActionList(
    String sceneName,
    List<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
    AreaPurposesTypes areaPurposesTypes,
  ) async {
    final String colorForArea =
        AreaTypeWithDeviceTypePreset.getColorForAreaType(areaPurposesTypes);

    final SceneCbjEntity newCbjScene = NodeRedConverter.convertToSceneNodes(
      nodeName: sceneName,
      devicesPropertyAction: smartDevicesWithActionToAdd,
      sceneColor: colorForArea,
    );
    return addOrUpdateNewSceneInHub(newCbjScene);
  }

  @override
  Future<Either<SceneCbjFailure, Unit>> activateScenes(
    KtList<SceneCbjEntity> scenesList,
  ) async {
    for (final SceneCbjEntity sceneCbjEntity in scenesList.asList()) {
      addOrUpdateNewSceneInHub(
        sceneCbjEntity.copyWith(
          entityStateGRPC: SceneCbjDeviceStateGRPC(
            EntityStateGRPC.waitingInCloud.toString(),
          ),
        ),
      );
    }
    return right(unit);
  }

  @override
  void addOrUpdateNewSceneInApp(SceneCbjEntity sceneCbj) {
    _allScenes[sceneCbj.uniqueId.getOrCrash()] = sceneCbj;

    scenesResponseFromTheHubStreamController.sink
        .add(_allScenes.values.toImmutableList());
  }

  @override
  Future<void> initiateHubConnection() async {}

  @override
  Stream<Either<SceneCbjFailure, KtList<SceneCbjEntity>>>
      watchAllScenes() async* {
    yield* scenesResponseFromTheHubStreamController.stream
        .map((event) => right(event));
  }

  @override
  BehaviorSubject<KtList<SceneCbjEntity>>
      scenesResponseFromTheHubStreamController =
      BehaviorSubject<KtList<SceneCbjEntity>>();

  @override
  Future<Either<SceneCbjFailure, Unit>>
      addDevicesToMultipleScenesAreaTypeWithPreSetActions({
    required List<String> devicesId,
    required List<String> scenesId,
    required List<String> areaTypes,
  }) async {
    final List<MapEntry<String, AreaPurposesTypes>> areaTypeWithSceneIdList =
        [];

    for (final String sceneId in scenesId) {
      if (_allScenes[sceneId] == null) {
        icLogger.w('Scene ID does not exist in saved scenes list\n $sceneId');
        continue;
      }
      final SceneCbjEntity sceneCbjEntity = _allScenes[sceneId]!;

      final AreaPurposesTypes? areaTypeForScene =
          ISavedRoomsRepo.instance.getAreaTypeFromNameCapsWithSpaces(
        sceneCbjEntity.name.getOrCrash(),
      );

      if (areaTypeForScene != null) {
        areaTypeWithSceneIdList.add(MapEntry(sceneId, areaTypeForScene));
      }
    }

    for (final MapEntry<String, AreaPurposesTypes> areaTypeWithSceneId
        in areaTypeWithSceneIdList) {
      addDevicesToSceneAreaTypeWithPreSetActions(
        devicesId: devicesId,
        sceneId: areaTypeWithSceneId.key,
        areaType: areaTypeWithSceneId.value,
      );
    }

    return right(unit);
  }

  @override
  Future<Either<SceneCbjFailure, SceneCbjEntity>>
      addDevicesToSceneAreaTypeWithPreSetActions({
    required List<String> devicesId,
    required String sceneId,
    required AreaPurposesTypes areaType,
  }) async {
    SceneCbjEntity? scene = _allScenes[sceneId];

    if (scene == null || scene.automationString.getOrCrash() == null) {
      return left(const SceneCbjFailure.unexpected());
    }

    final String sceneAutomationString = scene.automationString.getOrCrash()!;
    late String brokerNodeId;
    try {
      final String? tempValue = getPropertyValueFromAutomation(
        sceneAutomationString,
        'mqtt-broker',
        'id',
      );
      if (tempValue == null) {
        return left(const SceneCbjFailure.unexpected());
      }
      brokerNodeId = tempValue;
    } catch (e) {
      icLogger.e('Error decoding automation string\n$sceneAutomationString');
    }
    final Map<String, String> nodeActionsMap = {};
    final List<String> nodeRedFuncNodesIds = [];

    for (final String deviceId in devicesId) {
      if (!scene.automationString.getOrCrash()!.contains(deviceId)) {
        // TODO: change to List<Map<String, String> so that each type will be able to create multiple scenes
        final Either<SceneCbjFailure, Map<String, String>>
            actionForDevicesInArea = await AreaTypeWithDeviceTypePreset
                .getPreDefineActionForDeviceInArea(
          deviceId: deviceId,
          areaPurposeType: areaType,
          brokerNodeId: brokerNodeId,
        );
        if (actionForDevicesInArea.isRight()) {
          actionForDevicesInArea.fold(
            (l) => null,
            (Map<String, String> r) {
              nodeActionsMap.addAll(r);
              nodeRedFuncNodesIds.addAll(r.keys);
            },
          );
        }
      }
    }

    final String colorForArea =
        AreaTypeWithDeviceTypePreset.getColorForAreaType(areaType);

    // Removing start and end curly braces of the map object

    final String sceneAutomationStringNoBrackets =
        sceneAutomationString.substring(1, sceneAutomationString.length - 1);

    // Using nodeActionsMap.values.toString() some times creates wrong string with 3 dots that looks like that
    //   "wires": []
    // }, ...,     {
    // "id": ,
    List<String> nodActionsMapValues = [];
    if (nodeActionsMap.values.isNotEmpty) {
      nodActionsMapValues = nodeActionsMap.values.toList();
    }

    String mapAutomationFixed = '';
    for (final String actionValue in nodActionsMapValues) {
      // ignore: use_string_buffers
      mapAutomationFixed += actionValue;
      if (actionValue != nodActionsMapValues.last) {
        mapAutomationFixed += ", ";
      }
    }

    String tempNewAutomation;
    if (mapAutomationFixed.isEmpty) {
      tempNewAutomation = '[\n$sceneAutomationStringNoBrackets\n]';
    } else {
      /// Add all automations id (functions) to mqttIn wires
      String nodeIdsToAddToMqttIn = nodeRedFuncNodesIds
          .toString()
          .substring(1, nodeRedFuncNodesIds.toString().length - 1);
      nodeIdsToAddToMqttIn =
          '"${nodeIdsToAddToMqttIn.replaceAll(', ', '", "')}"';
      final String mapAutomationFixedWithNewWires =
          changePropertyValueInAutomation(
        sceneAutomationStringNoBrackets,
        'mqtt in',
        'wires',
        '[[$nodeIdsToAddToMqttIn]]',
      );
      tempNewAutomation =
          '[\n$mapAutomationFixedWithNewWires, $mapAutomationFixed\n]';
    }
    scene = scene.copyWith(
      automationString: SceneCbjAutomationString(tempNewAutomation),
      backgroundColor: SceneCbjBackgroundColor(colorForArea),
    );

    String nodeRedFlowId = '';

    (await addNewSceneAndSaveInDb(scene)).fold((l) {}, (r) {
      nodeRedFlowId = r;
    });

    if (nodeRedFlowId.isNotEmpty) {
      scene =
          scene.copyWith(nodeRedFlowId: SceneCbjNodeRedFlowId(nodeRedFlowId));
    } else {
      final SceneCbjEntity? tempScene = findSceneIfAlreadyBeenAdded(scene);
      if (tempScene != null) {
        scene = scene.copyWith(nodeRedFlowId: tempScene.nodeRedFlowId);

        nodeRedFlowId = await NodeRedRepository().createNewNodeRedScene(scene);

        scene =
            scene.copyWith(nodeRedFlowId: SceneCbjNodeRedFlowId(nodeRedFlowId));
      }
    }

    _allScenes[sceneId] = scene;

    saveAndActivateScenesAndSmartDevicesToDb();

    //TODO: add to the automationString part the new automation for devices String from actionForDevicesInArea and connect all to first node id
    return right(scene);
  }

  static String? getPropertyValueFromAutomation(
    String sceneAutomationString,
    String nodeType,
    String keyToGetFromNode,
  ) {
    try {
      final List<Map<String, dynamic>> sceneAutomationJson =
          (jsonDecode(sceneAutomationString) as List)
              .map((e) => e as Map<String, dynamic>)
              .toList();
      for (final Map<String, dynamic> fullNode in sceneAutomationJson) {
        if (fullNode['type'] == nodeType) {
          return fullNode[keyToGetFromNode].toString();
        }
      }
    } catch (e) {
      icLogger.e('Error decoding automation string\n$sceneAutomationString');
    }
    return null;
  }

  static String changePropertyValueInAutomation(
    String sceneAutomationString,
    String nodeType,
    String keyToChange,
    String valueToInsert,
  ) {
    try {
      final int locationOfNodeType =
          sceneAutomationString.indexOf('"type": "$nodeType",');
      final String sceneAutomationStringBeforeType =
          sceneAutomationString.substring(0, locationOfNodeType);
      final String sceneAutomationStringAfterType =
          sceneAutomationString.substring(locationOfNodeType);

      final int locationOfKeyToChange =
          sceneAutomationStringAfterType.indexOf('"$keyToChange"');
      final String sceneAutomationStringBeforeKey =
          sceneAutomationStringAfterType.substring(0, locationOfKeyToChange);
      String sceneAutomationStringAfterKey =
          sceneAutomationStringAfterType.substring(locationOfKeyToChange);
      sceneAutomationStringAfterKey = sceneAutomationStringAfterKey
          .substring(sceneAutomationStringAfterKey.indexOf('},'));

      final String finalString =
          '$sceneAutomationStringBeforeType$sceneAutomationStringBeforeKey"$keyToChange":  $valueToInsert\n$sceneAutomationStringAfterKey';
      return finalString;
    } catch (e) {
      icLogger.e(
        'Wrong node or key in node $sceneAutomationString $nodeType $keyToChange $valueToInsert\n $e',
      );
    }
    return sceneAutomationString;
  }
}
