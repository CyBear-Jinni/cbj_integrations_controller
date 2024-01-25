import 'dart:collection';

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

  void addScene(SceneCbjEntity scene) =>
      _scenes.addEntries([MapEntry(scene.uniqueId.getOrCrash(), scene)]);

  Future activateScene(String id) async {
    final SceneCbjEntity? scene = _scenes[id];
    if (scene == null) {
      return;
    }
    for (final RequestActionObject action in scene.actions) {
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
