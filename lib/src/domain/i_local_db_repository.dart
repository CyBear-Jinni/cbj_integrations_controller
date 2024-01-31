import 'package:cbj_integrations_controller/src/infrastructure/local_db/hive_objects/network_hive/home_hive_model.dart';
import 'package:cbj_integrations_controller/src/infrastructure/local_db/hive_objects/network_hive/network_hive_model.dart';
import 'package:hive/hive.dart';

part 'package:cbj_integrations_controller/src/infrastructure/local_db/local_db_hive_repository.dart';

abstract class IDbRepository {
  static IDbRepository? _instance;

  static IDbRepository get instance {
    return _instance ??= _HiveRepository();
  }

  Future asyncConstractor();
}
