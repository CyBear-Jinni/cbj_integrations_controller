import 'package:cbj_integrations_controller/domain/colors.dart';
import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/bed_room_area_actions.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/outside_area_actions.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/study_room_area_actions.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/video_games_area_actions.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/work_room_area_actions.dart';
import 'package:dartz/dartz.dart';

/// Pre define actions for each device in each area type
class AreaTypeWithDeviceTypePreset {
  static Future<Either<SceneCbjFailure, Map<String, String>>>
      getPreDefineActionForDeviceInArea({
    required String deviceId,
    required AreaPurposesTypes areaPurposeType,
    required String brokerNodeId,
  }) async {
    final Either<LocalDbFailures, DeviceEntityBase> dTemp =
        await ISavedDevicesRepo.instance.getDeviceById(deviceId);
    if (dTemp.isLeft()) {
      return left(const SceneCbjFailure.unexpected());
    }
    late DeviceEntityBase deviceEntity;

    dTemp.fold((l) => null, (r) {
      deviceEntity = r;
    });

    switch (areaPurposeType) {
      case AreaPurposesTypes.attic:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.bathtub:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.bedroom:
        return BedRoomAreaAction()
            .bedRoomSleepDeviceAction(deviceEntity, brokerNodeId);
      case AreaPurposesTypes.boardGames:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.childrenRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.cinemaRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.diningRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.holidayCabin:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.kitchen:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.laundryRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.livingRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.meditation:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.outside:
        return OutsideAreaAction()
            .outsideOffDeviceAction(deviceEntity, brokerNodeId);
      case AreaPurposesTypes.outsideNotPrimary:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.outsidePrimary:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.protectedSpace:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.romantic:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.safeRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.shower:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.stairsInside:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.stairsOutside:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.studyRoom:
        return StudyRoomAreaAction()
            .studyRoomDeviceAction(deviceEntity, brokerNodeId);
      case AreaPurposesTypes.toiletRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.trainingRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.tvRoom:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.videoGames:
        return VideoGamesAreaAction()
            .videoGamesRgbModDeviceAction(deviceEntity, brokerNodeId);
      case AreaPurposesTypes.workRoom:
        return WorkRoomAreaAction()
            .workRoomDeviceAction(deviceEntity, brokerNodeId);
    }
    return left(const SceneCbjFailure.unexpected());
  }

  static String getColorForAreaType(AreaPurposesTypes areaPurposeType) {
    Colors color = Colors.orange;

    switch (areaPurposeType) {
      case AreaPurposesTypes.attic:
        color = Colors.amberAccent;
      case AreaPurposesTypes.bathtub:
        color = Colors.lightBlue;
      case AreaPurposesTypes.bedroom:
        color = Colors.cyan;
      case AreaPurposesTypes.boardGames:
        color = Colors.brown;
      case AreaPurposesTypes.childrenRoom:
        color = Colors.lightBlueAccent;
      case AreaPurposesTypes.cinemaRoom:
        color = Colors.pink;
      case AreaPurposesTypes.diningRoom:
        color = Colors.amber;
      case AreaPurposesTypes.holidayCabin:
        color = Colors.lightGreen;
      case AreaPurposesTypes.kitchen:
        color = Colors.redAccent;
      case AreaPurposesTypes.laundryRoom:
        color = Colors.white12;
      case AreaPurposesTypes.livingRoom:
        color = Colors.orangeAccent;
      case AreaPurposesTypes.meditation:
        color = Colors.purple;
      case AreaPurposesTypes.outside:
        color = Colors.green;
      case AreaPurposesTypes.outsideNotPrimary:
        color = Colors.greenAccent;
      case AreaPurposesTypes.outsidePrimary:
        color = Colors.lightGreenAccent;
      case AreaPurposesTypes.protectedSpace:
        color = Colors.blueGrey;
      case AreaPurposesTypes.romantic:
        color = Colors.pinkAccent;
      case AreaPurposesTypes.safeRoom:
        color = Colors.indigo;
      case AreaPurposesTypes.shower:
        color = Colors.blueAccent;
      case AreaPurposesTypes.stairsInside:
        color = Colors.brown;
      case AreaPurposesTypes.stairsOutside:
        color = Colors.brown;
      case AreaPurposesTypes.studyRoom:
        color = Colors.deepPurpleAccent;
      case AreaPurposesTypes.toiletRoom:
        color = Colors.green;
      case AreaPurposesTypes.trainingRoom:
        color = Colors.redAccent;
      case AreaPurposesTypes.tvRoom:
        color = Colors.deepPurple;
      case AreaPurposesTypes.videoGames:
        color = Colors.tealAccent;
      case AreaPurposesTypes.workRoom:
        color = Colors.blue;
    }
    return color.value;
  }
}
