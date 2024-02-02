import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/area_type_with_device_type_preset.dart';

class AutomationService {
  factory AutomationService() {
    return _instance;
  }
  AutomationService._singletonConstructor();

  static final AutomationService _instance =
      AutomationService._singletonConstructor();

  /// {SceneId, SceneEntity}
  final HashMap<String, SceneCbjEntity> _scenes = HashMap();

  HashMap<String, SceneCbjEntity> getScenes() => _scenes;

  void addScene(SceneCbjEntity scene) {
    _scenes.addEntries([MapEntry(scene.uniqueId.getOrCrash(), scene)]);
    saveScenesToDb();
  }

  void loadFromDb(String homeId) {
    loadScenesFromDb(homeId);
  }

  void loadScenesFromDb(String homeId) {
    final List<String> scenesString = IDbRepository.instance.getScenes(homeId);
    for (final String sceneString in scenesString) {
      final SceneCbjEntity scene = SceneCbjDtos.fromJson(
        jsonDecode(sceneString) as Map<String, dynamic>,
      ).toDomain();
      _scenes.addEntries([MapEntry(scene.uniqueId.getOrCrash(), scene)]);
    }
  }

  void saveScenesToDb() {
    final List<String> automationsJsonString = [];

    for (final SceneCbjEntity scene in _scenes.values) {
      final String sceneAsJsonString =
          jsonEncode(scene.toInfrastructure().toJson());
      automationsJsonString.add(sceneAsJsonString);
    }
    final String homeBoxName = NetworksManager().currentNetwork!.uniqueId;

    IDbRepository.instance.saveScenes(homeBoxName, automationsJsonString);
  }

  Future activateScene(String id) async {
    final SceneCbjEntity? scene = _scenes[id];
    if (scene == null) {
      return;
    }

    final HashSet<String> entitysId =
        HashSet.from(scene.actions.map((e) => e.entityIds.first));

    for (final String entityId in entitysId) {
      final List<RequestActionObject> actionsForEntity = scene.actions
          .where((element) => element.entityIds.contains(entityId))
          .toList();
      activeAutomationsForEntity(actionsForEntity);
    }
  }

  Future activeAutomationsForEntity(List<RequestActionObject> actions) async {
    for (final RequestActionObject action in actions) {
      if (action.property == EntityProperties.delay) {
        final dynamic duration = action.value[ActionValues.duration];
        if (duration != null && duration is int) {
          await Future.delayed(Duration(milliseconds: duration));
        }
        continue;
      }
      IcSynchronizer().setEntitiesState(action);
    }
  }

  void updateAreaAutomation({
    required HashMap<String, EntityTypes> entitiesIdAndType,
    required Set<String> scenesId,
  }) {
    for (final String sceneId in scenesId) {
      final SceneCbjEntity? scene = _scenes[sceneId];
      if (scene == null) {
        continue;
      }

      final List<RequestActionObject> actionList = [];

      for (final MapEntry<String, EntityTypes> entity
          in entitiesIdAndType.entries) {
        actionList.addAll(
          AreaTypeWithEntitiesTypePreset.getPreDefineActionForEntitiesInArea(
            entityId: entity.key,
            areaPurposeType: scene.areaPurposeType,
            entityType: entity.value,
          ),
        );
      }

      _scenes[sceneId] = scene.copyWithNewAction(actionList);
    }
  }

  Future<HashSet<String>> createPresetScenesForAreaPurposes(
    Set<AreaPurposesTypes> areaPurposes,
  ) async {
    final HashSet<String> scenesId = HashSet();
    for (final AreaPurposesTypes purposesType in areaPurposes) {
      final SceneCbjEntity scene = SceneCbjEntity(
        uniqueId: UniqueId(),
        name: SceneCbjName(purposesType.name),
        backgroundColor: SceneCbjBackgroundColor('#985dc7'),
        automationString: SceneCbjAutomationString(''),
        nodeRedFlowId: SceneCbjNodeRedFlowId(''),
        firstNodeId: SceneCbjFirstNodeId(''),
        iconCodePoint: SceneCbjIconCodePoint(''),
        image: SceneCbjBackgroundImage(''),
        lastDateOfExecute: SceneCbjLastDateOfExecute(''),
        stateMassage: SceneCbjStateMassage(''),
        senderDeviceOs: SceneCbjSenderDeviceOs(''),
        senderDeviceModel: SceneCbjSenderDeviceModel(''),
        senderId: SceneCbjSenderId(''),
        compUuid: SceneCbjCompUuid(''),
        entityStateGRPC: SceneCbjDeviceStateGRPC(EntityStateGRPC.ack.name),
        actions: [],
        areaPurposeType: purposesType,
      );

      scenesId.add(scene.uniqueId.getOrCrash());
      addScene(scene);
    }
    return scenesId;
  }

  // getScenesFor
}
