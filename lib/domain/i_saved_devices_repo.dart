import 'dart:collection';

import 'package:cbj_integrations_controller/domain/connector.dart';
import 'package:cbj_integrations_controller/domain/i_app_communication_repository.dart';
import 'package:cbj_integrations_controller/domain/i_saved_rooms_repo.dart';
import 'package:cbj_integrations_controller/domain/local_db/i_local_db_repository.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/remote_pipes/remote_pipes_entity.dart';
import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/domain/room/value_objects_room.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/core/injection.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/remote_pipes/remote_pipes_dtos.dart';
import 'package:dartz/dartz.dart';

part 'package:cbj_integrations_controller/infrastructure/saved_devices_repo.dart';

abstract class ISavedDevicesRepo {
  static ISavedDevicesRepo? _instance;

  static ISavedDevicesRepo get instance {
    return _instance ??= _SavedDevicesRepo();
  }

  /// Setting up all devices from db
  Future<void> setUpAllFromDb();

  DeviceEntityAbstract? addOrUpdateFromMqtt(dynamic updateFromMqtt);

  /// Add new device to saved devices list
  DeviceEntityAbstract addOrUpdateDevice(DeviceEntityAbstract deviceEntity);

  // /// Will save the remote pipes entity to the local storage and will activate
  // /// connection to remote pipes with that info
  // /// Will return true if complete success
  Future<Either<LocalDbFailures, Unit>> saveAndActivateRemotePipesDomainToDb({
    required RemotePipesEntity remotePipes,
  });

  Future<Either<LocalDbFailures, Unit>> saveAndActivateSmartDevicesToDb();

  /// Save login of different form factors to the local db
  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateVendorLoginCredentialsDomainToDb({
    required LoginEntityAbstract loginEntity,
  });

  /// Get all saved devices
  Future<Map<String, DeviceEntityAbstract>> getAllDevicesAfterInitialize();

  Map<String, DeviceEntityAbstract> getAllDevices();

  /// Get device by unique ID
  Future<Either<LocalDbFailures, DeviceEntityAbstract>> getDeviceById(
    String entityUniqueId,
  );
}
