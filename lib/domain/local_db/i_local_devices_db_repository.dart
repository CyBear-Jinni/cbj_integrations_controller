import 'dart:convert';

import 'package:cbj_integrations_controller/domain/binding/binding_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/binding/i_binding_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/binding/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/domain/room/value_objects_room.dart';
import 'package:cbj_integrations_controller/domain/rooms/i_saved_rooms_repo.dart';
import 'package:cbj_integrations_controller/domain/routine/i_routine_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/routine/routine_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/routine/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/domain/saved_devices/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/scene/i_scene_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/scene/scene_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/scene/value_objects_scene_cbj.dart';
import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/domain/vendors/tuya_login/generic_tuya_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/tuya_login/generic_tuya_login_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/bindings/binding_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/device_helper/device_helper.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/bindings_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/devices_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/esphome_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/ewelink_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/hub_entity_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/lifx_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/remote_pipes_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/rooms_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/routines_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/scenes_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/tuya_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/xiaomi_mi_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/room/room_entity_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/routines/routine_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/scene_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

part 'package:cbj_integrations_controller/infrastructure/local_db/local_db_hive_repository.dart';

/// Only ISavedDevicesRepo need to call functions here
abstract class ILocalDbRepository {
  static ILocalDbRepository? _instance;

  static ILocalDbRepository get instance {
    return _instance ??= _HiveRepository();
  }

  /// Name of the box that stores Remote Pipes credentials
  String remotePipesBoxName = 'remotePipesBox';

  /// Name of the box that stores all the rooms
  String roomsBoxName = 'roomsBox';

  /// Name of the box that stores all the devices in form of string json
  String devicesBoxName = 'devicesBox';

  /// Name of the box that stores all the scenes in form of string json
  String scenesBoxName = 'scenesBox';

  /// Name of the box that stores all the routines in form of string json
  String routinesBoxName = 'routinesBox';

  /// Name of the box that stores all the bindings in form of string json
  String bindingsBoxName = 'bindingsBox';

  /// Name of the box that stores Tuya login credentials
  String tuyaVendorCredentialsBoxName = 'tuyaVendorCredentialsBoxName';

  /// Name of the box that stores Smart Life login credentials
  String smartLifeVendorCredentialsBoxName =
      'smartLifeVendorCredentialsBoxName';

  /// Name of the box that stores Jinvoo Smart login credentials
  String jinvooSmartVendorCredentialsBoxName =
      'jinvooSmartVendorCredentialsBoxName';

  /// Name of the box that stores Lifx login credentials
  String lifxVendorCredentialsBoxName = 'lifxVendorCredentialsBoxName';

  /// Name of the box that stores ESPHome device password
  String espHomeVendorCredentialsBoxName = 'espHomeVendorCredentialsBoxName';

  /// Name of the box that stores Xiaomi Mi account email ans password
  String xiaomiMiVendorCredentialsBoxName = 'xiaomiMiVendorCredentialsBoxName';

  /// Name of the box that stores eWeLink account email ans password
  String ewelinkVendorCredentialsBoxName = 'ewelinkVendorCredentialsBoxName';

  /// Name of the box that stores Hub devices info
  String hubDevicesBox = 'hubDevicesBox';

  /// Loading once all the data from the database
  Future<void> initializeDb();

  /// Will load all the local database content into the program
  Future<void> loadFromDb();

  String hubEntityBoxName = 'hubEntityBox';

  Future<Either<LocalDbFailures, String>> getRemotePipesDnsName();

  /// Get all saved devices from local db
  Future<Either<LocalDbFailures, List<DeviceEntityAbstract>>>
      getSmartDevicesFromDb();

  /// Get all saved scenes from local db
  Future<Either<LocalDbFailures, List<SceneCbjEntity>>> getScenesFromDb();

  /// Get all saved routines from local db
  Future<Either<LocalDbFailures, List<RoutineCbjEntity>>> getRoutinesFromDb();

  /// Get all saved bindings from local db
  Future<Either<LocalDbFailures, List<BindingCbjEntity>>> getBindingsFromDb();

  /// Will ger all rooms from db, if didn't find any will return discovered room
  /// without any devices
  Future<Either<LocalDbFailures, List<RoomEntity>>> getRoomsFromDb();

  Future<Either<LocalDbFailures, Unit>> saveRemotePipes({
    required String remotePipesDomainName,
  });

  Future<Either<LocalDbFailures, GenericTuyaLoginDE>>
      getTuyaVendorLoginCredentials({
    required List<TuyaVendorCredentialsHiveModel>
        tuyaVendorCredentialsModelFromDb,
    required String vendorBoxName,
  });

  Future<Either<LocalDbFailures, GenericLifxLoginDE>>
      getLifxVendorLoginCredentials({
    required List<LifxVendorCredentialsHiveModel>
        lifxVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, GenericEspHomeLoginDE>>
      getEspHomeVendorLoginCredentials({
    required List<EspHomeVendorCredentialsHiveModel>
        espHomeVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, GenericXiaomiMiLoginDE>>
      getXiaomiMiVendorLoginCredentials({
    required List<XiaomiMiVendorCredentialsHiveModel>
        xiaomiMiVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, GenericEwelinkLoginDE>>
      getEwelinkVendorLoginCredentials({
    required List<EwelinkVendorCredentialsHiveModel>
        ewelinkVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, Unit>> saveRoomsToDb({
    required List<RoomEntity> roomsList,
  });

  Future<Either<LocalDbFailures, Unit>> saveSmartDevices({
    required List<DeviceEntityAbstract> deviceList,
  });

  Future<Either<LocalDbFailures, Unit>> saveScenes({
    required List<SceneCbjEntity> sceneList,
  });

  Future<Either<LocalDbFailures, Unit>> saveRoutines({
    required List<RoutineCbjEntity> routineList,
  });

  Future<Either<LocalDbFailures, Unit>> saveBindings({
    required List<BindingCbjEntity> bindingList,
  });

  Future<Either<LocalDbFailures, Unit>> saveVendorLoginCredentials({
    required LoginEntityAbstract loginEntityAbstract,
  });
}
