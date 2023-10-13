import 'package:hive/hive.dart';

part 'tuya_vendor_credentials_hive_model.g.dart';

@HiveType(typeId: 2)
class TuyaVendorCredentialsHiveModel extends HiveObject {
  @HiveField(0)
  late String? senderUniqueId;
  @HiveField(1)
  late String tuyaUserName;
  @HiveField(2)
  late String tuyaUserPassword;
  @HiveField(3)
  late String tuyaCountryCode;
  @HiveField(4)
  late String tuyaBizType;
  @HiveField(5)
  late String tuyaRegion;
  @HiveField(6)
  late String loginVendor;
}
