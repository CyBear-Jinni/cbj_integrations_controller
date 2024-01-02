import 'dart:convert';

import 'package:cbj_integrations_controller/domain/area/area_entity.dart';
import 'package:cbj_integrations_controller/domain/area/value_objects_area.dart';
import 'package:cbj_integrations_controller/domain/binding/binding_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/binding/i_binding_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/binding/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/routine/i_routine_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/routine/routine_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/routine/value_objects_routine_cbj.dart';
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
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/area/area_entity_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/bindings/binding_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/device_helper/device_helper.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/areas_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/bindings_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/devices_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/esphome_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/ewelink_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/hub_entity_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/lifx_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/remote_pipes_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/routines_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/scenes_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/local_db/hive_objects/xiaomi_mi_vendor_credentials_hive_model.dart';
import 'package:cbj_integrations_controller/infrastructure/routines/routine_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/scenes/scene_cbj_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors_connector_conjecture.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

part 'package:cbj_integrations_controller/infrastructure/local_db/local_db_hive_repository.dart';

/// Only ISavedDevicesRepo need to call functions here
abstract class IDbRepository {
  static IDbRepository? _instance;

  static IDbRepository get instance {
    return _instance ??= _HiveRepository();
  }

  /// Loading once all the data from the database
  Future<void> initializeDb({required bool isFlutter});

  /// Will load all the local database content into the program
  Future<void> loadFromDb();

  Future<Either<LocalDbFailures, String>> getRemotePipesDnsName();

  /// Get all saved devices from local db
  Future<Either<LocalDbFailures, Set<DeviceEntityBase>>>
      getSmartDevicesFromDb();

  /// Get all saved scenes from local db
  Future<Either<LocalDbFailures, Set<SceneCbjEntity>>> getScenesFromDb();

  /// Get all saved routines from local db
  Future<Either<LocalDbFailures, Set<RoutineCbjEntity>>> getRoutinesFromDb();

  /// Get all saved bindings from local db
  Future<Either<LocalDbFailures, Set<BindingCbjEntity>>> getBindingsFromDb();

  /// Will ger all areas from db, if didn't find any will return discovered area
  /// without any devices
  Future<Either<LocalDbFailures, Set<AreaEntity>>> getAreasFromDb();

  Future<Either<LocalDbFailures, Unit>> saveRemotePipes({
    required String remotePipesDomainName,
  });

  Future<Either<LocalDbFailures, GenericLifxLoginDE>>
      getLifxVendorLoginCredentials({
    required Set<LifxVendorCredentialsHiveModel>
        lifxVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, GenericEspHomeLoginDE>>
      getEspHomeVendorLoginCredentials({
    required Set<EspHomeVendorCredentialsHiveModel>
        espHomeVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, GenericXiaomiMiLoginDE>>
      getXiaomiMiVendorLoginCredentials({
    required Set<XiaomiMiVendorCredentialsHiveModel>
        xiaomiMiVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, GenericEwelinkLoginDE>>
      getEwelinkVendorLoginCredentials({
    required Set<EwelinkVendorCredentialsHiveModel>
        ewelinkVendorCredentialsModelFromDb,
  });

  Future<Either<LocalDbFailures, Unit>> saveAreasToDb({
    required Set<AreaEntity> areasList,
  });

  Future<Either<LocalDbFailures, Unit>> saveSmartDevices({
    required Set<DeviceEntityBase> deviceList,
  });

  Future<Either<LocalDbFailures, Unit>> saveScenes({
    required Set<SceneCbjEntity> sceneList,
  });

  Future<Either<LocalDbFailures, Unit>> saveRoutines({
    required Set<RoutineCbjEntity> routineList,
  });

  Future<Either<LocalDbFailures, Unit>> saveBindings({
    required Set<BindingCbjEntity> bindingList,
  });

  Future<Either<LocalDbFailures, Unit>> saveVendorLoginCredentials({
    required LoginEntityAbstract loginEntityAbstract,
  });
}
