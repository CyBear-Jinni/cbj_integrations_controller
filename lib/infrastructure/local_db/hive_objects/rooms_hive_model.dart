import 'package:hive/hive.dart';

part 'rooms_hive_model.g.dart';

@HiveType(typeId: 3)
class RoomsHiveModel extends HiveObject {
  @HiveField(0)
  late String roomUniqueId;
  @HiveField(1)
  late String roomDefaultName;
  @HiveField(2)
  late Set<String> roomDevicesId;
  @HiveField(3)
  late Set<String> roomScenesId;
  @HiveField(4)
  late Set<String> roomRoutinesId;
  @HiveField(5)
  late Set<String> roomBindingsId;
  @HiveField(6)
  late Set<String> roomMostUsedBy;
  @HiveField(7)
  late Set<String> roomPermissions;
  @HiveField(8)
  late Set<String> roomTypes;
  @HiveField(9)
  late String roomBackground;
}
