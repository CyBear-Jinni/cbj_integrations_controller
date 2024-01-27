import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/area/area_entity.dart';
import 'package:cbj_integrations_controller/src/domain/area/i_area_repository.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/vendor_entity_information.dart';
import 'package:cbj_integrations_controller/src/domain/scene/scene_cbj_entity.dart';
import 'package:cbj_integrations_controller/src/domain/vendor_login_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/automations_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/entities_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';

/// Creating a common front out side of integrations controller.
/// Also makes sure to notefy the services for changes that relaye to each other
class IcSynchronizer {
  factory IcSynchronizer() {
    return _instance;
  }

  IcSynchronizer._singletonConstractor();

  static final IcSynchronizer _instance =
      IcSynchronizer._singletonConstractor();

  //  -------------------- EntitiesService --------------------

  /// Stream of devices that got discovered or state of device got changed.
  /// from Vendor Connector Conjectore side (or nodeRED for the hub),
  /// this stream dose not include
  /// request for changes from the app!.
  StreamController<MapEntry<String, DeviceEntityBase>> entitiesChangesStream =
      StreamController<MapEntry<String, DeviceEntityBase>>.broadcast();

  Future setEntitiesState(RequestActionObject action) async =>
      EntitiesService().setEntitiesState(action);

  Future<HashMap<String, DeviceEntityBase>> getEntities() async =>
      EntitiesService().getEntities();

  Future loginVendor(VendorLoginEntity value) async =>
      VendorsConnectorConjecture().loginVendor(value);

  List<VendorEntityInformation> getVendors() =>
      VendorsConnectorConjecture().getVendors();

  //  -------------------- IAreaRepository --------------------

  /// Each time area get changed it will be sent here, could be new area got created
  /// or a new entity got added or deleted from it
  StreamController<MapEntry<String, AreaEntity>> areasChangesStream =
      StreamController<MapEntry<String, AreaEntity>>.broadcast();

  void newEntity(HashMap<String, DeviceEntityBase> entities) {
    for (final MapEntry<String, DeviceEntityBase> entry in entities.entries) {
      entitiesChangesStream.add(entry);
    }
    IAreaRepository.instance
        .addEntitiesToDiscoverdArea(HashSet.from(entities.keys));
  }

  Future<HashMap<String, AreaEntity>> getAreas() =>
      IAreaRepository.instance.getAreas();

  Future setNewArea(AreaEntity area) =>
      IAreaRepository.instance.setNewArea(area);

  Future setEtitiesToArea(String area, HashSet<String> entities) =>
      IAreaRepository.instance.setEtitiesToArea(area, entities);

  //  ------------------ AutomationService --------------------
  HashMap<String, SceneCbjEntity> getScenes() =>
      AutomationService().getScenes();

  Future addScene(SceneCbjEntity scene) async =>
      AutomationService().addScene(scene);

  Future activateScene(String id) => AutomationService().activateScene(id);

  Future<HashSet<String>> createPresetScenesForAreaPurposes(
    Set<AreaPurposesTypes> areaPurposes,
  ) =>
      AutomationService().createPresetScenesForAreaPurposes(areaPurposes);

  Future updateAreaAutomation({
    required Set<String> entitiesId,
    required Set<String> scenesId,
  }) async {
    final HashMap<String, DeviceEntityBase> entities = await getEntities();
    final HashMap<String, EntityTypes> entitiesWithType = HashMap.fromEntries(
      entitiesId.map((e) => MapEntry(e, entities[e]!.entityTypes.type)),
    );
    AutomationService().updateAreaAutomation(
      entitiesIdAndType: entitiesWithType,
      scenesId: scenesId,
    );
  }
}
