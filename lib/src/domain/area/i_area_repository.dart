import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/area/area_entity.dart';
import 'package:cbj_integrations_controller/src/domain/area/value_objects_area.dart';
import 'package:cbj_integrations_controller/src/domain/ic_synchronizer.dart';

part 'package:cbj_integrations_controller/src/infrastructure/area/area_repository.dart';

abstract class IAreaRepository {
  static IAreaRepository? _instance;

  static IAreaRepository get instance => _instance ??= _AreaRepository();

  Future<HashMap<String, AreaEntity>> getAreas();

  Future setNewArea(AreaEntity area);

  Future setEtitiesToArea(String area, HashSet<String> entities);

  Future addEntitiesToDiscoverdArea(
    HashSet<String> entitiesId, {
    bool synchronizer = true,
  });

  Future onAreasUpdated(HashSet<String> areasId);
}
