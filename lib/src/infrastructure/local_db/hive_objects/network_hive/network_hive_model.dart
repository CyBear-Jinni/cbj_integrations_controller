import 'package:cbj_integrations_controller/src/infrastructure/network/network_object.dart';
import 'package:hive/hive.dart';

part 'network_hive_model.g.dart';

@HiveType(typeId: 8)
class NetworkHiveModel extends HiveObject {
  @HiveField(0)
  late List<NetworkObject> networks;
}
