import 'package:cbj_integrations_controller/domain/area/area_failures.dart';
import 'package:cbj_integrations_controller/domain/area/value_objects_area.dart';
import 'package:cbj_integrations_controller/infrastructure/area/area_entity_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/wow.dart';
import 'package:dartz/dartz.dart';

class AreaEntity {
  AreaEntity({
    required this.uniqueId,
    required this.cbjEntityName,
    required this.background,
    required this.areaTypes,
    required this.areaDevicesId,
    required this.areaScenesId,
    required this.areaRoutinesId,
    required this.areaBindingsId,

    /// Who is using this area
    required this.areaMostUsedBy,

    /// Area permissions by users id
    required this.areaPermissions,
  });

  factory AreaEntity.empty() => AreaEntity(
        uniqueId: AreaUniqueId(),
        cbjEntityName: AreaDefaultName('Empty Area Name'),
        background: AreaBackground(
          'https://live.staticflickr.com/5220/5486044345_f67abff3e9_h.jpg',
        ),
        areaDevicesId: AreaDevicesId(const {}),
        areaScenesId: AreaScenesId(const {}),
        areaRoutinesId: AreaRoutinesId(const {}),
        areaBindingsId: AreaBindingsId(const {}),
        areaMostUsedBy: AreaMostUsedBy(const {}),
        areaPermissions: AreaPermissions(const {}),
        areaTypes: AreaTypes(const {}),
      );

  AreaUniqueId uniqueId;
  AreaDefaultName cbjEntityName;
  AreaBackground background;
  AreaTypes areaTypes;
  AreaDevicesId areaDevicesId;
  AreaScenesId areaScenesId;
  AreaRoutinesId areaRoutinesId;
  AreaBindingsId areaBindingsId;

  /// Who is using this area
  AreaMostUsedBy areaMostUsedBy;

  /// Area permissions by users id
  AreaPermissions areaPermissions;

  /// Will add new device id to the devices in the area list
  void addDeviceId(String newDeviceId) {
    final Set<String> tempList = {};
    tempList.addAll(areaDevicesId.getOrCrash());
    tempList.add(newDeviceId);
    try {
      areaDevicesId = AreaDevicesId(tempList);
    } catch (e) {
      icLogger.e('addDeviceId will not work if list got created with const');
    }
  }

  /// Will add new scene id to the scenes in the area list
  void addSceneId(String newSceneId) {
    final Set<String> tempList = {};
    tempList.addAll(areaScenesId.getOrCrash());
    tempList.add(newSceneId);
    try {
      areaScenesId = AreaScenesId(tempList);
    } catch (e) {
      icLogger.e('addSceneId will not work if list got created with const');
    }
  }

  /// Will add new routine id to the scenes in the area list
  void addRoutineId(String newRoutineId) {
    final Set<String> tempList = {};
    tempList.addAll(areaRoutinesId.getOrCrash());
    tempList.add(newRoutineId);
    try {
      areaRoutinesId = AreaRoutinesId(tempList);
    } catch (e) {
      icLogger.e('addRoutineId will not work if list got created with const');
    }
  }

  /// Will add new Binding id to the scenes in the area list
  void addBindingId(String newSceneId) {
    try {
      areaBindingsId.getOrCrash().add(newSceneId);
    } catch (e) {
      icLogger.e('addBindingId will not work if list got created with const');
    }
  }

  /// Return new AreaDevicesId object without id if it exist in areaDevicesId
  AreaDevicesId deleteIdIfExist(String id) {
    final Set<String> tempList = Set.from(areaDevicesId.getOrCrash());
    tempList.removeWhere((element) => element == id);
    return AreaDevicesId(tempList);
  }

  Option<AreaFailure<dynamic>> get failureOption {
    return cbjEntityName.value.fold((f) => some(f), (_) => none());
  }

  AreaEntityDtos toInfrastructure() {
    return AreaEntityDtos(
      uniqueId: uniqueId.getOrCrash(),
      cbjEntityName: cbjEntityName.getOrCrash(),
      background: background.getOrCrash(),
      areaTypes: areaTypes.getOrCrash(),
      areaDevicesId: areaDevicesId.getOrCrash(),
      areaScenesId: areaScenesId.getOrCrash(),
      areaRoutinesId: areaRoutinesId.getOrCrash(),
      areaBindingsId: areaBindingsId.getOrCrash(),
      areaMostUsedBy: areaMostUsedBy.getOrCrash(),
      areaPermissions: areaPermissions.getOrCrash(),
    );
  }
}
