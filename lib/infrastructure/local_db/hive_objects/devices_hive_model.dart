import 'package:hive/hive.dart';

part 'devices_hive_model.g.dart';

@HiveType(typeId: 4)
class DevicesHiveModel extends HiveObject {
  @HiveField(0)
  late String deviceStringJson;
}
