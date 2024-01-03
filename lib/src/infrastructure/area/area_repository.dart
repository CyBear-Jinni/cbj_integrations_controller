part of 'package:cbj_integrations_controller/src/domain/area/i_area_repository.dart';

class _AreaRepository implements IAreaRepository {
  HashMap<String, AreaEntity> areas = HashMap();

  @override
  Future<HashMap<String, AreaEntity>> getAreas() async => areas;

  @override
  Future setNewArea(AreaEntity area) async =>
      areas.addEntries([MapEntry(area.uniqueId.getOrCrash(), area)]);

  @override
  Future setEtitiesToArea(String areaId, HashSet<String> entities) async {
    if (areas[areaId] == null) {
      return;
    }

    final HashSet<String> enititiesDeleted = HashSet.from(
      areas[areaId]!.entitiesId.getOrCrash().difference(entities),
    );

    final HashSet<String> areasChanged = HashSet();

    for (final AreaEntity area in areas.values) {
      final String areaId = area.uniqueId.getOrCrash();
      final Set<String> devicesInArea =
          area.entitiesId.getOrCrash().intersection(entities);
      if (devicesInArea.isEmpty) {
        continue;
      }
      areasChanged.add(areaId);
      area.entitiesId.getOrCrash().removeAll(devicesInArea);
      areas[areaId] = area;
    }
    areas[areaId]?.entitiesId = AreaEntitiesId(entities);

    if (enititiesDeleted.isNotEmpty) {
      areasChanged.add(AreaUniqueId.discovereId);
      addEntitiesToDiscoverdArea(enititiesDeleted, synchronizer: false);
    }

    onAreasUpdated(areasChanged);
  }

  @override
  Future addEntitiesToDiscoverdArea(
    HashSet<String> entities, {
    bool synchronizer = true,
  }) async {
    const String discoverId = AreaUniqueId.discovereId;
    AreaEntity? area = areas[discoverId];
    if (area == null) {
      area = AreaEntity.empty();
      area.uniqueId = AreaUniqueId.discovered();
      area.cbjEntityName = AreaDefaultName.discoveredAreaName();
    }
    area.addEntities(entities);
    areas[discoverId] = area;

    if (synchronizer) {
      onAreasUpdated(HashSet<String>.from([discoverId]));
    }
  }

  @override
  Future onAreasUpdated(HashSet<String> areasId) async {
    final Iterable<MapEntry<String, AreaEntity>> areasTemp =
        areas.entries.where((element) => areasId.contains(element.key));

    for (final MapEntry<String, AreaEntity> areaChanged in areasTemp) {
      IcSynchronizer().areasChangesStream.add(areaChanged);
    }
  }
}
