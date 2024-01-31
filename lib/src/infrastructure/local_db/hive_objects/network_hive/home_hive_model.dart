import 'package:hive/hive.dart';

part 'home_hive_model.g.dart';

@HiveType(typeId: 8)
class HomeHiveModel extends HiveObject {
  @HiveField(0)
  late String areaUniqueId;
  @HiveField(1)
  late String areaDefaultName;
  @HiveField(2)
  late List<String> areaDevicesId;
  @HiveField(3)
  late List<String> areaScenesId;
  @HiveField(4)
  late List<String> areaRoutinesId;
  @HiveField(5)
  late List<String> areaBindingsId;
  @HiveField(6)
  late List<String> areaMostUsedBy;
  @HiveField(7)
  late List<String> areaPermissions;
  @HiveField(8)
  late List<String> areaTypes;
  @HiveField(9)
  late String areaBackground;
}
