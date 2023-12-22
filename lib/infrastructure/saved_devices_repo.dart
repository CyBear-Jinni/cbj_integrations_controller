part of 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';

class _SavedDevicesRepo extends ISavedDevicesRepo {
  final HashMap<String, DeviceEntityBase> _allDevices =
      HashMap<String, DeviceEntityBase>();

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
  Future<Map<String, DeviceEntityBase>> getAllDevicesAfterInitialize() async {
    while (!setUpAllFromDbAtLestOnce) {
      await Future.delayed(const Duration(milliseconds: 200));
    }
    return _allDevices;
  }

  @override
  DeviceEntityBase? addOrUpdateFromMqtt(dynamic updateFromMqtt) {
    if (updateFromMqtt is DeviceEntityBase) {
      return addOrUpdateDevice(updateFromMqtt);
    } else {
      icLogger.w('Add or update type from MQTT not supported');
    }
    return null;
  }

  @override
  DeviceEntityBase addOrUpdateDevice(DeviceEntityBase deviceEntity) {
    final DeviceEntityBase? deviceExistByIdOfVendor =
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
      MapEntry<String, DeviceEntityBase>(
        entityId,
        _allDevices[entityId]!,
      ),
    );

    final String discoveredRoomId = RoomUniqueId.discovered().getOrCrash();
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
  DeviceEntityBase? findDeviceIfAlreadyBeenAdded(
    DeviceEntityBase deviceEntity,
  ) {
    for (final DeviceEntityBase deviceTemp in _allDevices.values) {
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
      deviceList: Set<DeviceEntityBase>.from(_allDevices.values),
    );
  }

  @override
  Future<Either<LocalDbFailures, DeviceEntityBase>> getDeviceById(
    String entityUniqueId,
  ) async {
    final DeviceEntityBase? device = _allDevices[entityUniqueId];
    if (device != null) {
      return right(device);
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Map<String, DeviceEntityBase> getAllDevices() => _allDevices;
}
