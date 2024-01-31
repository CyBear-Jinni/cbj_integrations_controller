part of 'package:cbj_integrations_controller/src/domain/i_local_db_repository.dart';

class _HiveRepository extends IDbRepository {
  _HiveRepository() {
    Hive.registerAdapter(HomeHiveModelAdapter());
    Hive.registerAdapter(NetworkHiveModelAdapter());
  }

  String networksBoxName = 'networksBox';

  @override
  Future asyncConstractor() async {}
}
