part 'package:cbj_integrations_controller/src/infrastructure/area/area_repository.dart';

abstract class IAreaRepository {
  static IAreaRepository? _instance;

  static IAreaRepository get instance {
    return _instance ??= _AreaRepository();
  }
}
