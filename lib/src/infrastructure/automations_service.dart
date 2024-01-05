import 'dart:collection';

import 'package:cbj_integrations_controller/integrations_controller.dart';

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
    for (final ActionObjectSingle action in scene.actions) {
      IcSynchronizer().setEntitiesState(ActionObject.fromSingle(action));
    }
  }
}
