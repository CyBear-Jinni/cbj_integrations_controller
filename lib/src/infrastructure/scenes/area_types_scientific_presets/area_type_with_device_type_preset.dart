import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/infrastructure/colors.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/bed_area_actions.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/outside_area_actions.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/study_area_actions.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/video_games_area_actions.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/actions_for_area_types/work_area_actions.dart';

/// Pre define actions for each device in each area type
class AreaTypeWithEntitiesTypePreset {
  static List<RequestActionObject> getPreDefineActionForEntitiesInArea({
    required String entityId,
    required EntityTypes entityType,
    required AreaPurposesTypes areaPurposeType,
  }) {
    // final Either<LocalDbFailures, DeviceEntityBase> dTemp =
    //     await ISavedDevicesRepo.instance.getDeviceById(entityId, entityType,);
    // if (dTemp.isLeft()) {
    //   return left(const SceneCbjFailure.unexpected());
    // }
    // final DeviceEntityBase deviceEntity = DeviceEntityNotAbstract();

    // dTemp.fold((l) => null, (r) {
    // deviceEntity = r;
    // });

    switch (areaPurposeType) {
      case AreaPurposesTypes.attic:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.bathtub:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.bedarea:
        return BedAreaAreaAction().bedAreaSleepDeviceAction(
          entityId,
          entityType,
        );
      case AreaPurposesTypes.boardGames:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.childrenArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.cinemaArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.diningArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.holidayCabin:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.kitchen:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.laundryArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.livingArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.meditation:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.outside:
        return OutsideAreaAction().outsideOffDeviceAction(entityId, entityType);
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
      case AreaPurposesTypes.safeArea:
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
      case AreaPurposesTypes.studyArea:
        return StudyAreaAreaAction()
            .studyAreaDeviceAction(entityId, entityType);
      case AreaPurposesTypes.toiletArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.trainingArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.tvArea:
        // TODO: Handle this case.
        break;
      case AreaPurposesTypes.videoGames:
        return VideoGamesAreaAction()
            .videoGamesRgbModDeviceAction(entityId, entityType);
      case AreaPurposesTypes.workArea:
        return WorkAreaAreaAction().workAreaEntityAction(entityId, entityType);
      case AreaPurposesTypes.undefined:
      // TODO: Handle this case.
    }
    return [];
  }

  static String getColorForAreaType(AreaPurposesTypes areaPurposeType) {
    Colors color = Colors.orange;

    switch (areaPurposeType) {
      case AreaPurposesTypes.attic:
        color = Colors.amberAccent;
      case AreaPurposesTypes.bathtub:
        color = Colors.lightBlue;
      case AreaPurposesTypes.bedarea:
        color = Colors.cyan;
      case AreaPurposesTypes.boardGames:
        color = Colors.brown;
      case AreaPurposesTypes.childrenArea:
        color = Colors.lightBlueAccent;
      case AreaPurposesTypes.cinemaArea:
        color = Colors.pink;
      case AreaPurposesTypes.diningArea:
        color = Colors.amber;
      case AreaPurposesTypes.holidayCabin:
        color = Colors.lightGreen;
      case AreaPurposesTypes.kitchen:
        color = Colors.redAccent;
      case AreaPurposesTypes.laundryArea:
        color = Colors.white12;
      case AreaPurposesTypes.livingArea:
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
      case AreaPurposesTypes.safeArea:
        color = Colors.indigo;
      case AreaPurposesTypes.shower:
        color = Colors.blueAccent;
      case AreaPurposesTypes.stairsInside:
        color = Colors.brown;
      case AreaPurposesTypes.stairsOutside:
        color = Colors.brown;
      case AreaPurposesTypes.studyArea:
        color = Colors.deepPurpleAccent;
      case AreaPurposesTypes.toiletArea:
        color = Colors.green;
      case AreaPurposesTypes.trainingArea:
        color = Colors.redAccent;
      case AreaPurposesTypes.tvArea:
        color = Colors.deepPurple;
      case AreaPurposesTypes.videoGames:
        color = Colors.tealAccent;
      case AreaPurposesTypes.workArea:
        color = Colors.blue;
      case AreaPurposesTypes.undefined:
      // TODO: Handle this case.
    }
    return color.value;
  }
}
