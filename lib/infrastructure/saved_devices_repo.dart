part of 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';

class _SavedDevicesRepo extends ISavedDevicesRepo {
  final HashMap<String, DeviceEntityAbstract> _allDevices =
      HashMap<String, DeviceEntityAbstract>();

  bool setUpAllFromDbAtLestOnce = false;

  @override
  Future<void> setUpAllFromDb() async {
    await IDbRepository.instance.getSmartDevicesFromDb().then((value) {
      value.fold((l) => null, (r) {
        for (final element in r) {
          addOrUpdateDevice(element);
        }
      });
    });
    setUpAllFromDbAtLestOnce = true;
  }

  @override
  Future<Map<String, DeviceEntityAbstract>>
      getAllDevicesAfterInitialize() async {
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
      icLogger.w('Add or update type from MQTT not supported');
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

    ISavedRoomsRepo.instance.addDeviceToRoomDiscoveredIfNotExist(deviceEntity);
    Connector().fromMqtt(
      MapEntry<String, DeviceEntityAbstract>(
        entityId,
        _allDevices[entityId]!,
      ),
    );

    final String discoveredRoomId =
        RoomUniqueId.discoveredRoomId().getOrCrash();
    Connector().fromMqtt(
      MapEntry<String, RoomEntity>(
        discoveredRoomId,
        ISavedRoomsRepo.instance.getAllRooms()[discoveredRoomId]!,
      ),
    );
    return deviceEntity;
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveAndActivateRemotePipesDomainToDb({
    required RemotePipesEntity remotePipes,
  }) async {
    final RemotePipesDtos remotePipesDtos = remotePipes.toInfrastructure();

    final String rpDomainName = remotePipesDtos.domainName;

    getItCbj<IAppCommunicationRepository>()
        .startRemotePipesConnection(rpDomainName);

    return IDbRepository.instance
        .saveRemotePipes(remotePipesDomainName: rpDomainName);
  }

  @override
  Future<Either<LocalDbFailures, Unit>>
      saveAndActivateVendorLoginCredentialsDomainToDb({
    required LoginEntityAbstract loginEntity,
  }) async {
    VendorsConnectorConjecture().setVendorLoginCredentials(loginEntity);

    return IDbRepository.instance
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
    return IDbRepository.instance.saveSmartDevices(
      deviceList: List<DeviceEntityAbstract>.from(_allDevices.values),
    );
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

  @override
  Map<String, DeviceEntityAbstract> getAllDevices() => _allDevices;
}
