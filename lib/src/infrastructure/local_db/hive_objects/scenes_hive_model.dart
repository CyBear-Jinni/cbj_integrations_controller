import 'package:hive/hive.dart';

part 'scenes_hive_model.g.dart';

@HiveType(typeId: 5)
class ScenesHiveModel extends HiveObject {
  @HiveField(0)
  late String scenesStringJson;
}
