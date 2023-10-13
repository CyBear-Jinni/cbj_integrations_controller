import 'dart:collection';

import 'package:cbj_integrations_controller/domain/local_db/i_local_devices_db_repository.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/saved_devices/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/companies_connector_conjector.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/injection.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISavedDevicesRepo)
class SavedDevicesRepo extends ISavedDevicesRepo {
  static final HashMap<String, DeviceEntityAbstract> _allDevices =
      HashMap<String, DeviceEntityAbstract>();

  static bool setUpAllFromDbAtLestOnce = false;

  @override
  Future<void> setUpAllFromDb() async {
    await getItCbj<ILocalDbRepository>().getSmartDevicesFromDb().then((value) {
      value.fold((l) => null, (r) {
        for (final element in r) {
          addOrUpdateDevice(element);
        }
      });
    });
    setUpAllFromDbAtLestOnce = true;
  }

  @override
  Future<Map<String, DeviceEntityAbstract>> getAllDevices() async {
    while (!setUpAllFromDbAtLestOnce) {
      await Future.delayed(const Duration(milliseconds: 200));
    }
    return _allDevices;
  }

  @override
  DeviceEntityAbstract? addOrUpdateFromMqtt(dynamic updateFromMqtt) {
    if (updateFromMqtt is DeviceEntityAbstract) {
      return addOrUpdateDevice(updateFromMqtt);
    } else {
      logger.w('Add or update type from MQTT not supported');
    }
    return null;
  }

  @override
  DeviceEntityAbstract addOrUpdateDevice(DeviceEntityAbstract deviceEntity) {
    final DeviceEntityAbstract? deviceExistByIdOfVendor =
        findDeviceIfAlreadyBeenAdded(deviceEntity);

    /// Check if device already exist
    if (deviceExistByIdOfVendor != null) {
      deviceEntity.uniqueId = deviceExistByIdOfVendor.uniqueId;
      _allDevices[deviceExistByIdOfVendor.uniqueId.getOrCrash()] = deviceEntity;
      return deviceEntity;
    }

    final String entityId = deviceEntity.getDeviceId();

    /// If it is new device
    _allDevices[entityId] = deviceEntity;

    // TODO: Fix after new cbj_integrations_controller
    // getItCbj<ISavedRoomsRepo>()
    //     .addDeviceToRoomDiscoveredIfNotExist(deviceEntity);

    return deviceEntity;

    //
    // ConnectorStreamToMqtt.toMqttController.sink.add(
    //   MapEntry<String, DeviceEntityAbstract>(
    //     entityId,
    //     allDevices[entityId]!,
    //   ),
    // );
    // ConnectorStreamToMqtt.toMqttController.sink.add(
    //   MapEntry<String, RoomEntity>(
    //     discoveredRoomId,
    //     allRooms[discoveredRoomId]!,
    //   ),
    // );
  }

  // @override
  // Future<Either<LocalDbFailures, Unit>> saveAndActivateRemotePipesDomainToDb({
  //   required RemotePipesEntity remotePipes,
  // }) async {
  //   final RemotePipesDtos remotePipesDtos = remotePipes.toInfrastructure();
  //
  //   final String rpDomainName = remotePipesDtos.domainName;
  //
  //   getItCbj<IAppCommunicationRepository>()
  //       .startRemotePipesConnection(rpDomainName);
  //
  //   return getItCbj<ILocalDbRepository>()
  //       .saveRemotePipes(remotePipesDomainName: rpDomainName);
  // }

  @override
  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateVendorLoginCredentialsDomainToDb({
    required LoginEntityAbstract loginEntity,
  }) async {
    CompaniesConnectorConjector.setVendorLoginCredentials(loginEntity);

    return getItCbj<ILocalDbRepository>()
        .saveVendorLoginCredentials(loginEntityAbstract: loginEntity);
  }

  /// Check if allDevices does not contain the same device already
  /// Will compare the unique id's that each company sent us
  DeviceEntityAbstract? findDeviceIfAlreadyBeenAdded(
    DeviceEntityAbstract deviceEntity,
  ) {
    for (final DeviceEntityAbstract deviceTemp in _allDevices.values) {
      if (deviceEntity.entityUniqueId.getOrCrash() ==
          deviceTemp.entityUniqueId.getOrCrash()) {
        return deviceTemp;
      }
    }
    return null;
  }

  @override
  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateSmartDevicesToDb() async {
    // TODO: Fix after new cbj_integrations_controller
    // return getItCbj<ILocalDbRepository>().saveSmartDevices(
    //   deviceList: List<DeviceEntityAbstract>.from(_allDevices.values),
    // );
    return left(const LocalDbFailures.unableToUpdate());
  }

  @override
  Future<Either<LocalDbFailures, DeviceEntityAbstract>> getDeviceById(
    String entityUniqueId,
  ) async {
    final DeviceEntityAbstract? device = _allDevices[entityUniqueId];
    if (device != null) {
      return right(device);
    }
    return left(const LocalDbFailures.unexpected());
  }
}
