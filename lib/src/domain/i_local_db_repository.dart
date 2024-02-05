import 'package:cbj_integrations_controller/src/infrastructure/local_db/models/home_hive_model.dart';
import 'package:hive/hive.dart';

part 'package:cbj_integrations_controller/src/infrastructure/local_db/local_db_hive_repository.dart';

abstract class IDbRepository {
  static IDbRepository? _instance;

  static IDbRepository get instance {
    return _instance ??= _HiveRepository();
  }

  Future asyncConstactor();

  void createNewHome(String homeBoxName, String networksJsonString);

  void saveAreas(String homeBoxName, List<String> value);

  void saveEntities(String homeBoxName, List<String> entitiesJsonString);

  void saveScenes(String homeBoxName, List<String> scenesJsonString);

  List<String> getEntities(String homeId);

  List<String> getNetworks();

  List<String> getAreas(String homeId);

  List<String> getScenes(String homeId);
}
