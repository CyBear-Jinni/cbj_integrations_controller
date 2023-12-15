part of 'package:cbj_integrations_controller/domain/local_db/i_local_db_repository.dart';

/// Only ISavedDevicesRepo need to call functions here
class _HiveRepository extends IDbRepository {
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

  @override
  Future<void> initializeDb({required bool isFlutter}) async {
    if (!isFlutter) {
      String? localDbPath = await SystemCommandsManager().getLocalDbPath();

      if (localDbPath[localDbPath.length - 1] == '/') {
        localDbPath = localDbPath.substring(0, localDbPath.length - 1);
      }
      localDbPath += '/hive';

      icLogger.i('Hive db location\n$localDbPath');

      Hive.init(localDbPath);
      await Future.delayed(const Duration(milliseconds: 500));
    }

    Hive.registerAdapter(RemotePipesHiveModelAdapter());
    Hive.registerAdapter(RoomsHiveModelAdapter());
    Hive.registerAdapter(DevicesHiveModelAdapter());
    Hive.registerAdapter(ScenesHiveModelAdapter());
    Hive.registerAdapter(RoutinesHiveModelAdapter());
    Hive.registerAdapter(BindingsHiveModelAdapter());
    Hive.registerAdapter(HubEntityHiveModelAdapter());
    Hive.registerAdapter(LifxVendorCredentialsHiveModelAdapter());
    Hive.registerAdapter(EspHomeVendorCredentialsHiveModelAdapter());
    Hive.registerAdapter(XiaomiMiVendorCredentialsHiveModelAdapter());
    Hive.registerAdapter(EwelinkVendorCredentialsHiveModelAdapter());

    /// Delay inorder for the Hive boxes to initialize
    /// In case you got the following error:
    /// "HiveError: You need to initialize Hive or provide a path to store
    /// the box."
    /// Please increase the duration
    await Future.delayed(const Duration(milliseconds: 100));

    await loadFromDb();
  }

  Box<RoomsHiveModel>? roomsBox;
  Box<DevicesHiveModel>? devicesBox;
  Box<RemotePipesHiveModel>? remotePipesBox;
  Box<ScenesHiveModel>? scenesBox;
  Box<RoutinesHiveModel>? routinesBox;
  Box<BindingsHiveModel>? bindingsBox;
  Box<LifxVendorCredentialsHiveModel>? lifxVendorCredentialsBox;
  Box<EspHomeVendorCredentialsHiveModel>? espHomeVendorCredentialsBox;
  Box<XiaomiMiVendorCredentialsHiveModel>? xiaomiMiVendorCredentialsBox;
  Box<EwelinkVendorCredentialsHiveModel>? ewelinkVendorCredentialsBox;

  @override
  Future<void> loadFromDb() async {
    (await getRemotePipesDnsName()).fold(
        (l) => icLogger
            .w('No Remote Pipes Dns name was found in the local storage'), (r) {
      // TODO: Fix after new cbj_integrations_controller
      // getIt<IAppCommunicationRepository>().startRemotePipesConnection(r);

      icLogger.i('Remote Pipes DNS name was "$r" found');
    });

    {
      await lifxVendorCredentialsBox?.close();

      lifxVendorCredentialsBox =
          await Hive.openBox<LifxVendorCredentialsHiveModel>(
        lifxVendorCredentialsBoxName,
      );

      final List<LifxVendorCredentialsHiveModel>
          lifxVendorCredentialsModelFromDb = lifxVendorCredentialsBox!.values
              .toList()
              .cast<LifxVendorCredentialsHiveModel>();
      await lifxVendorCredentialsBox?.close();

      (await getLifxVendorLoginCredentials(
        lifxVendorCredentialsModelFromDb: lifxVendorCredentialsModelFromDb,
      ))
          .fold((l) {}, (r) {
        VendorsConnectorConjecture().setVendorLoginCredentials(r);

        icLogger.i(
          'Lifx login credentials got found in DB',
        );
      });
    }

    {
      await espHomeVendorCredentialsBox?.close();

      espHomeVendorCredentialsBox =
          await Hive.openBox<EspHomeVendorCredentialsHiveModel>(
        espHomeVendorCredentialsBoxName,
      );

      final List<EspHomeVendorCredentialsHiveModel>
          espHomeVendorCredentialsModelFromDb = espHomeVendorCredentialsBox!
              .values
              .toList()
              .cast<EspHomeVendorCredentialsHiveModel>();
      await espHomeVendorCredentialsBox?.close();

      (await getEspHomeVendorLoginCredentials(
        espHomeVendorCredentialsModelFromDb:
            espHomeVendorCredentialsModelFromDb,
      ))
          .fold((l) {}, (r) {
        VendorsConnectorConjecture().setVendorLoginCredentials(r);

        icLogger.i(
          'ESPHome device password got found in DB',
        );
      });
    }

    /// Xiaomi Mi
    {
      await xiaomiMiVendorCredentialsBox?.close();

      xiaomiMiVendorCredentialsBox =
          await Hive.openBox<XiaomiMiVendorCredentialsHiveModel>(
        xiaomiMiVendorCredentialsBoxName,
      );

      final List<XiaomiMiVendorCredentialsHiveModel>
          xiaomiMiVendorCredentialsModelFromDb = xiaomiMiVendorCredentialsBox!
              .values
              .toList()
              .cast<XiaomiMiVendorCredentialsHiveModel>();
      await xiaomiMiVendorCredentialsBox?.close();

      (await getXiaomiMiVendorLoginCredentials(
        xiaomiMiVendorCredentialsModelFromDb:
            xiaomiMiVendorCredentialsModelFromDb,
      ))
          .fold((l) {}, (r) {
        VendorsConnectorConjecture().setVendorLoginCredentials(r);

        icLogger.i(
          'Xiaomi Mi device password got found in DB',
        );
      });
    }

    /// eWeLink
    {
      await ewelinkVendorCredentialsBox?.close();

      ewelinkVendorCredentialsBox =
          await Hive.openBox<EwelinkVendorCredentialsHiveModel>(
        ewelinkVendorCredentialsBoxName,
      );

      final List<EwelinkVendorCredentialsHiveModel>
          ewelinkVendorCredentialsModelFromDb = ewelinkVendorCredentialsBox!
              .values
              .toList()
              .cast<EwelinkVendorCredentialsHiveModel>();
      await ewelinkVendorCredentialsBox?.close();

      (await getEwelinkVendorLoginCredentials(
        ewelinkVendorCredentialsModelFromDb:
            ewelinkVendorCredentialsModelFromDb,
      ))
          .fold((l) {}, (r) {
        VendorsConnectorConjecture().setVendorLoginCredentials(r);

        icLogger.i(
          'EweLink account email and password got found in DB',
        );
      });
    }

    // Rooms need to stay first one
    await ISavedRoomsRepo.instance.setUpAllFromDb();
    await ISceneCbjRepository.instance.setUpAllFromDb();
    await IRoutineCbjRepository.instance.setUpAllFromDb();
    await IBindingCbjRepository.instance.setUpAllFromDb();
    await ISavedDevicesRepo.instance.setUpAllFromDb();
  }

  @override
  Future<Either<LocalDbFailures, List<RoomEntity>>> getRoomsFromDb() async {
    final List<RoomEntity> rooms = <RoomEntity>[];

    try {
      await roomsBox?.close();
      roomsBox = await Hive.openBox<RoomsHiveModel>(roomsBoxName);
      final List<RoomsHiveModel> roomsHiveModelFromDb =
          roomsBox!.values.toList().cast<RoomsHiveModel>();

      await roomsBox?.close();
      for (final RoomsHiveModel roomHive in roomsHiveModelFromDb) {
        final RoomEntity roomEntity = RoomEntity(
          uniqueId: RoomUniqueId.fromUniqueString(roomHive.roomUniqueId),
          cbjEntityName: RoomDefaultName(roomHive.roomDefaultName),
          background: RoomBackground(roomHive.roomBackground),
          roomTypes: RoomTypes(roomHive.roomTypes),
          roomDevicesId: RoomDevicesId(roomHive.roomDevicesId),
          roomScenesId: RoomScenesId(roomHive.roomScenesId),
          roomRoutinesId: RoomRoutinesId(roomHive.roomRoutinesId),
          roomBindingsId: RoomBindingsId(roomHive.roomBindingsId),
          roomMostUsedBy: RoomMostUsedBy(roomHive.roomMostUsedBy),
          roomPermissions: RoomPermissions(roomHive.roomPermissions),
        );
        rooms.add(roomEntity);
      }
    } catch (e) {
      icLogger.e('Local DB hive error while getting rooms: $e');
      // TODO: Check why hive crash stop this from working
      await deleteAllSavedRooms();
    }

    return right(rooms);
  }

  @override
  Future<Either<LocalDbFailures, List<DeviceEntityAbstract>>>
      getSmartDevicesFromDb() async {
    final List<DeviceEntityAbstract> devices = <DeviceEntityAbstract>[];

    try {
      await devicesBox?.close();
      devicesBox = await Hive.openBox<DevicesHiveModel>(devicesBoxName);

      final List<DevicesHiveModel> devicesHiveModelFromDb =
          devicesBox!.values.toList().cast<DevicesHiveModel>();

      await devicesBox?.close();

      for (final DevicesHiveModel deviceHive in devicesHiveModelFromDb) {
        final DeviceEntityAbstract deviceEntity =
            DeviceHelper.convertJsonStringToDomain(deviceHive.deviceStringJson);

        devices.add(
          deviceEntity
            ..entityStateGRPC =
                EntityState(EntityStateGRPC.waitingInComp.toString()),
        );
      }
      return right(devices);
    } catch (e) {
      icLogger.e('Local DB hive error while getting devices: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, GenericLifxLoginDE>>
      getLifxVendorLoginCredentials({
    required List<LifxVendorCredentialsHiveModel>
        lifxVendorCredentialsModelFromDb,
  }) async {
    try {
      if (lifxVendorCredentialsModelFromDb.isNotEmpty) {
        final LifxVendorCredentialsHiveModel firstLifxVendorFromDB =
            lifxVendorCredentialsModelFromDb[0];

        final String? senderUniqueId = firstLifxVendorFromDB.senderUniqueId;
        final String lifxApiKey = firstLifxVendorFromDB.lifxApiKey;

        final GenericLifxLoginDE genericLifxLoginDE = GenericLifxLoginDE(
          senderUniqueId: CoreLoginSenderId.fromUniqueString(senderUniqueId),
          lifxApiKey: GenericLifxLoginApiKey(lifxApiKey),
        );

        icLogger.i(
          'Lifx got returned from local storage',
        );
        return right(genericLifxLoginDE);
      }
      // logger.i(
      //   "Didn't find any Lifx in the local DB",
      // );
    } catch (e) {
      icLogger.e('Local DB hive error while getting Lifx vendor: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, GenericEspHomeLoginDE>>
      getEspHomeVendorLoginCredentials({
    required List<EspHomeVendorCredentialsHiveModel>
        espHomeVendorCredentialsModelFromDb,
  }) async {
    try {
      if (espHomeVendorCredentialsModelFromDb.isNotEmpty) {
        final EspHomeVendorCredentialsHiveModel firstEspHomeVendorFromDB =
            espHomeVendorCredentialsModelFromDb[0];

        final String? senderUniqueId = firstEspHomeVendorFromDB.senderUniqueId;
        final String espHomeDevicePass =
            firstEspHomeVendorFromDB.espHomeDevicePass;

        final GenericEspHomeLoginDE genericEspHomeLoginDE =
            GenericEspHomeLoginDE(
          senderUniqueId: CoreLoginSenderId.fromUniqueString(senderUniqueId),
          espHomeDevicePass:
              GenericEspHomeDeviceLoginApiPass(espHomeDevicePass),
        );

        icLogger.i(
          'ESPHome got returned from local storage',
        );
        return right(genericEspHomeLoginDE);
      }
      // logger.i(
      //   "Didn't find any ESPHome in the local DB",
      // );
    } catch (e) {
      icLogger.e('Local DB hive error while getting ESPHome vendor: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, GenericXiaomiMiLoginDE>>
      getXiaomiMiVendorLoginCredentials({
    required List<XiaomiMiVendorCredentialsHiveModel>
        xiaomiMiVendorCredentialsModelFromDb,
  }) async {
    try {
      if (xiaomiMiVendorCredentialsModelFromDb.isNotEmpty) {
        final XiaomiMiVendorCredentialsHiveModel firstXiaomiMiVendorFromDB =
            xiaomiMiVendorCredentialsModelFromDb[0];

        final String? senderUniqueId = firstXiaomiMiVendorFromDB.senderUniqueId;
        final String xiaomiMiAccountEmail =
            firstXiaomiMiVendorFromDB.xiaomiMiAccountEmail;
        final String xiaomiMiAccountPass =
            firstXiaomiMiVendorFromDB.xiaomiMiAccountPass;

        final GenericXiaomiMiLoginDE genericXiaomiMiLoginDE =
            GenericXiaomiMiLoginDE(
          senderUniqueId: CoreLoginSenderId.fromUniqueString(senderUniqueId),
          xiaomiMiAccountEmail:
              GenericXiaomiMiAccountEmail(xiaomiMiAccountEmail),
          xiaomiMiAccountPass: GenericXiaomiMiAccountPass(xiaomiMiAccountPass),
        );

        icLogger.i(
          'Xiaomi Mi got returned from local storage',
        );
        return right(genericXiaomiMiLoginDE);
      }
      // logger.i(
      //   "Didn't find any Xiaomi Mi in the local DB",
      // );
    } catch (e) {
      icLogger.e('Local DB hive error while getting Xiaomi Mi vendor: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, GenericEwelinkLoginDE>>
      getEwelinkVendorLoginCredentials({
    required List<EwelinkVendorCredentialsHiveModel>
        ewelinkVendorCredentialsModelFromDb,
  }) async {
    try {
      if (ewelinkVendorCredentialsModelFromDb.isNotEmpty) {
        final EwelinkVendorCredentialsHiveModel firstEwelinkVendorFromDB =
            ewelinkVendorCredentialsModelFromDb[0];

        final String? senderUniqueId = firstEwelinkVendorFromDB.senderUniqueId;
        final String ewelinkAccountEmail =
            firstEwelinkVendorFromDB.ewelinkAccountEmail;
        final String ewelinkAccountPass =
            firstEwelinkVendorFromDB.ewelinkAccountPass;

        final GenericEwelinkLoginDE genericEwelinkLoginDE =
            GenericEwelinkLoginDE(
          senderUniqueId: CoreLoginSenderId.fromUniqueString(senderUniqueId),
          ewelinkAccountEmail: GenericEwelinkAccountEmail(ewelinkAccountEmail),
          ewelinkAccountPass: GenericEwelinkAccountPass(ewelinkAccountPass),
        );

        icLogger.i(
          'EweLink got returned from local storage',
        );
        return right(genericEwelinkLoginDE);
      }
      // logger.i(
      //   "Didn't find any Xiaomi Mi in the local DB",
      // );
    } catch (e) {
      icLogger.e('Local DB hive error while getting Xiaomi Mi vendor: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, String>> getRemotePipesDnsName() async {
    try {
      await remotePipesBox?.close();
      remotePipesBox =
          await Hive.openBox<RemotePipesHiveModel>(remotePipesBoxName);
      final List<RemotePipesHiveModel> remotePipesHiveModelFromDb =
          remotePipesBox!.values.toList().cast<RemotePipesHiveModel>();
      await remotePipesBox?.close();

      if (remotePipesHiveModelFromDb.isNotEmpty) {
        final String remotePipesDnsName =
            remotePipesHiveModelFromDb[0].domainName;

        icLogger.i(
          'Remote pipes domain name is: '
          '$remotePipesDnsName',
        );
        return right(remotePipesDnsName);
      }
      icLogger.i("Didn't find any remote pipes in the local DB");
    } catch (e) {
      icLogger.e('Local DB hive error while getting Remote Pipes: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveSmartDevices({
    required List<DeviceEntityAbstract> deviceList,
  }) async {
    try {
      final List<DevicesHiveModel> devicesHiveList = [];

      final List<String> devicesListStringJson = List<String>.from(
        deviceList.map((e) => DeviceHelper.convertDomainToJsonString(e)),
      );

      for (final String devicesEntityDtosJsonString in devicesListStringJson) {
        final DevicesHiveModel devicesHiveModel = DevicesHiveModel()
          ..deviceStringJson = devicesEntityDtosJsonString;
        devicesHiveList.add(devicesHiveModel);
      }

      await devicesBox?.close();
      devicesBox = await Hive.openBox<DevicesHiveModel>(devicesBoxName);
      await devicesBox?.clear();
      await devicesBox?.addAll(devicesHiveList);

      await devicesBox?.close();
      icLogger.i('Devices got saved to local storage');
    } catch (e) {
      icLogger.e('Error saving Devices to local storage\n$e');
      return left(const LocalDbFailures.unexpected());
    }

    return right(unit);
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveRoomsToDb({
    required List<RoomEntity> roomsList,
  }) async {
    try {
      final List<RoomsHiveModel> rommsHiveList = [];

      final List<RoomEntityDtos> roomsListDto =
          List<RoomEntityDtos>.from(roomsList.map((e) => e.toInfrastructure()));

      for (final RoomEntityDtos roomEntityDtos in roomsListDto) {
        final RoomsHiveModel roomsHiveModel = RoomsHiveModel()
          ..roomUniqueId = roomEntityDtos.uniqueId
          ..roomDefaultName = roomEntityDtos.cbjEntityName
          ..roomBackground = roomEntityDtos.background
          ..roomDevicesId = roomEntityDtos.roomDevicesId
          ..roomScenesId = roomEntityDtos.roomScenesId
          ..roomRoutinesId = roomEntityDtos.roomRoutinesId
          ..roomBindingsId = roomEntityDtos.roomBindingsId
          ..roomMostUsedBy = roomEntityDtos.roomMostUsedBy
          ..roomPermissions = roomEntityDtos.roomPermissions
          ..roomTypes = roomEntityDtos.roomTypes;
        rommsHiveList.add(roomsHiveModel);
      }

      await roomsBox?.close();
      roomsBox = await Hive.openBox<RoomsHiveModel>(roomsBoxName);

      await roomsBox?.clear();
      await roomsBox?.addAll(rommsHiveList);

      await roomsBox?.close();
      icLogger.i('Rooms got saved to local storage');
    } catch (e) {
      icLogger.e('Error saving Rooms to local storage\n$e');
      return left(const LocalDbFailures.unexpected());
    }

    return right(unit);
  }

  // @override
  // Future<Either<LocalDbFailures, Unit>> saveHubEntity({
  //   required String hubNetworkBssid,
  //   required String networkName,
  //   required String lastKnownIp,
  // }) async {
  //   // TODO: implement saveHubEntity
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<LocalDbFailures, Unit>> saveVendorLoginCredentials({
    required LoginEntityAbstract loginEntityAbstract,
  }) async {
    if (loginEntityAbstract is GenericLifxLoginDE) {
      saveLifxVendorCredentials(
        lifxLoginDE: loginEntityAbstract,
        vendorCredentialsBoxName: lifxVendorCredentialsBoxName,
      );
    } else if (loginEntityAbstract is GenericEspHomeLoginDE) {
      saveEspHomeVendorCredentials(
        espHomeLoginDE: loginEntityAbstract,
        vendorCredentialsBoxName: espHomeVendorCredentialsBoxName,
      );
    } else if (loginEntityAbstract is GenericXiaomiMiLoginDE) {
      saveXiaomiMiVendorCredentials(
        xiaomiMiLoginDE: loginEntityAbstract,
        vendorCredentialsBoxName: xiaomiMiVendorCredentialsBoxName,
      );
    } else if (loginEntityAbstract is GenericEwelinkLoginDE) {
      saveEwelinkVendorCredentials(
        ewelinkLoginDE: loginEntityAbstract,
        vendorCredentialsBoxName: ewelinkVendorCredentialsBoxName,
      );
    } else {
      icLogger.e(
        'Please implement save function for this login type '
        '${loginEntityAbstract.runtimeType}',
      );
    }

    return right(unit);
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveRemotePipes({
    required String remotePipesDomainName,
  }) async {
    try {
      await remotePipesBox?.close();
      remotePipesBox =
          await Hive.openBox<RemotePipesHiveModel>(remotePipesBoxName);
      final RemotePipesHiveModel remotePipesHiveModel = RemotePipesHiveModel()
        ..domainName = remotePipesDomainName;

      if (remotePipesBox!.isNotEmpty) {
        await remotePipesBox!.putAt(0, remotePipesHiveModel);
      } else {
        remotePipesBox!.add(remotePipesHiveModel);
      }

      await remotePipesBox?.close();
      icLogger.i(
        'Remote Pipes got saved to local storage with domain name is: '
        '$remotePipesDomainName',
      );
    } catch (e) {
      icLogger.e('Error saving Remote Pipes to local storage');
      return left(const LocalDbFailures.unexpected());
    }

    return right(unit);
  }

  Future<Either<LocalDbFailures, Unit>> saveLifxVendorCredentials({
    required GenericLifxLoginDE lifxLoginDE,
    required String vendorCredentialsBoxName,
  }) async {
    try {
      final Box<LifxVendorCredentialsHiveModel> lifxVendorCredentialsBox =
          await Hive.openBox<LifxVendorCredentialsHiveModel>(
        vendorCredentialsBoxName,
      );

      final LifxVendorCredentialsHiveModel lifxVendorCredentialsModel =
          LifxVendorCredentialsHiveModel()
            ..senderUniqueId = lifxLoginDE.senderUniqueId.getOrCrash()
            ..lifxApiKey = lifxLoginDE.lifxApiKey.getOrCrash();

      if (lifxVendorCredentialsBox.isNotEmpty) {
        await lifxVendorCredentialsBox.putAt(0, lifxVendorCredentialsModel);
      } else {
        lifxVendorCredentialsBox.add(lifxVendorCredentialsModel);
      }

      await lifxVendorCredentialsBox.close();
      icLogger.i(
        'Lifx vendor credentials saved to local storage',
      );
    } catch (e) {
      icLogger.e('Error saving Lifx vendor credentials to local storage');
      return left(const LocalDbFailures.unexpected());
    }
    return right(unit);
  }

  Future<Either<LocalDbFailures, Unit>> saveEspHomeVendorCredentials({
    required GenericEspHomeLoginDE espHomeLoginDE,
    required String vendorCredentialsBoxName,
  }) async {
    try {
      final Box<EspHomeVendorCredentialsHiveModel> espHomeVendorCredentialsBox =
          await Hive.openBox<EspHomeVendorCredentialsHiveModel>(
        vendorCredentialsBoxName,
      );

      final EspHomeVendorCredentialsHiveModel espHomeVendorCredentialsModel =
          EspHomeVendorCredentialsHiveModel()
            ..senderUniqueId = espHomeLoginDE.senderUniqueId.getOrCrash()
            ..espHomeDevicePass = espHomeLoginDE.espHomeDevicePass.getOrCrash();

      if (espHomeVendorCredentialsBox.isNotEmpty) {
        await espHomeVendorCredentialsBox.putAt(
          0,
          espHomeVendorCredentialsModel,
        );
      } else {
        espHomeVendorCredentialsBox.add(espHomeVendorCredentialsModel);
      }

      await espHomeVendorCredentialsBox.close();
      icLogger.i(
        'ESPHome vendor credentials saved to local storage',
      );
    } catch (e) {
      icLogger.e('Error saving ESPHome vendor credentials to local storage');
      return left(const LocalDbFailures.unexpected());
    }
    return right(unit);
  }

  Future<Either<LocalDbFailures, Unit>> saveXiaomiMiVendorCredentials({
    required GenericXiaomiMiLoginDE xiaomiMiLoginDE,
    required String vendorCredentialsBoxName,
  }) async {
    try {
      final Box<XiaomiMiVendorCredentialsHiveModel>
          xiaomiMiVendorCredentialsBox =
          await Hive.openBox<XiaomiMiVendorCredentialsHiveModel>(
        vendorCredentialsBoxName,
      );

      final XiaomiMiVendorCredentialsHiveModel xiaomiMiVendorCredentialsModel =
          XiaomiMiVendorCredentialsHiveModel()
            ..senderUniqueId = xiaomiMiLoginDE.senderUniqueId.getOrCrash()
            ..xiaomiMiAccountEmail =
                xiaomiMiLoginDE.xiaomiMiAccountEmail.getOrCrash()
            ..xiaomiMiAccountPass =
                xiaomiMiLoginDE.xiaomiMiAccountPass.getOrCrash();

      if (xiaomiMiVendorCredentialsBox.isNotEmpty) {
        await xiaomiMiVendorCredentialsBox.putAt(
          0,
          xiaomiMiVendorCredentialsModel,
        );
      } else {
        xiaomiMiVendorCredentialsBox.add(xiaomiMiVendorCredentialsModel);
      }

      await xiaomiMiVendorCredentialsBox.close();
      icLogger.i(
        'Xiaomi Mi vendor credentials saved to local storage',
      );
    } catch (e) {
      icLogger.e('Error saving Xiaomi Mi vendor credentials to local storage');
      return left(const LocalDbFailures.unexpected());
    }
    return right(unit);
  }

  Future<Either<LocalDbFailures, Unit>> saveEwelinkVendorCredentials({
    required GenericEwelinkLoginDE ewelinkLoginDE,
    required String vendorCredentialsBoxName,
  }) async {
    try {
      final Box<EwelinkVendorCredentialsHiveModel> ewelinkVendorCredentialsBox =
          await Hive.openBox<EwelinkVendorCredentialsHiveModel>(
        vendorCredentialsBoxName,
      );

      final EwelinkVendorCredentialsHiveModel ewelinkVendorCredentialsModel =
          EwelinkVendorCredentialsHiveModel()
            ..senderUniqueId = ewelinkLoginDE.senderUniqueId.getOrCrash()
            ..ewelinkAccountEmail =
                ewelinkLoginDE.ewelinkAccountEmail.getOrCrash()
            ..ewelinkAccountPass =
                ewelinkLoginDE.ewelinkAccountPass.getOrCrash();

      if (ewelinkVendorCredentialsBox.isNotEmpty) {
        await ewelinkVendorCredentialsBox.putAt(
          0,
          ewelinkVendorCredentialsModel,
        );
      } else {
        ewelinkVendorCredentialsBox.add(ewelinkVendorCredentialsModel);
      }

      await ewelinkVendorCredentialsBox.close();
      icLogger.i(
        'EweLink vendor credentials saved to local storage',
      );
    } catch (e) {
      icLogger.e('Error saving EweLink vendor credentials to local storage');
      return left(const LocalDbFailures.unexpected());
    }
    return right(unit);
  }

  Future<void> deleteAllSavedRooms() async {
    await saveRoomsToDb(roomsList: []);
  }

  @override
  Future<Either<LocalDbFailures, List<SceneCbjEntity>>>
      getScenesFromDb() async {
    final List<SceneCbjEntity> scenes = <SceneCbjEntity>[];

    try {
      await scenesBox?.close();

      scenesBox = await Hive.openBox<ScenesHiveModel>(scenesBoxName);

      final List<ScenesHiveModel> scenesHiveModelFromDb =
          scenesBox!.values.toList().cast<ScenesHiveModel>();

      await scenesBox?.close();

      for (final ScenesHiveModel sceneHive in scenesHiveModelFromDb) {
        final SceneCbjEntity sceneEntity = SceneCbjDtos.fromJson(
          jsonDecode(sceneHive.scenesStringJson) as Map<String, dynamic>,
        ).toDomain();

        scenes.add(
          sceneEntity.copyWith(
            entityStateGRPC: SceneCbjDeviceStateGRPC(
              EntityStateGRPC.waitingInComp.toString(),
            ),
          ),
        );
      }
      return right(scenes);
    } catch (e) {
      icLogger.e('Local DB hive error while getting scenes: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, List<RoutineCbjEntity>>>
      getRoutinesFromDb() async {
    final List<RoutineCbjEntity> routines = <RoutineCbjEntity>[];

    try {
      await routinesBox?.close();
      routinesBox = await Hive.openBox<RoutinesHiveModel>(routinesBoxName);

      final List<RoutinesHiveModel> routinesHiveModelFromDb =
          routinesBox!.values.toList().cast<RoutinesHiveModel>();

      await routinesBox?.close();

      for (final RoutinesHiveModel routineHive in routinesHiveModelFromDb) {
        final RoutineCbjEntity routineEntity = RoutineCbjDtos.fromJson(
          jsonDecode(routineHive.routinesStringJson) as Map<String, dynamic>,
        ).toDomain();

        routines.add(
          routineEntity.copyWith(
            entityStateGRPC: RoutineCbjDeviceStateGRPC(
              EntityStateGRPC.waitingInComp.toString(),
            ),
          ),
        );
      }
      return right(routines);
    } catch (e) {
      icLogger.e('Local DB hive error while getting routines: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, List<BindingCbjEntity>>>
      getBindingsFromDb() async {
    final List<BindingCbjEntity> bindings = <BindingCbjEntity>[];

    try {
      await bindingsBox?.close();
      bindingsBox = await Hive.openBox<BindingsHiveModel>(bindingsBoxName);

      final List<BindingsHiveModel> bindingsHiveModelFromDb =
          bindingsBox!.values.toList().cast<BindingsHiveModel>();

      await bindingsBox?.close();

      for (final BindingsHiveModel bindingHive in bindingsHiveModelFromDb) {
        final BindingCbjEntity bindingEntity = BindingCbjDtos.fromJson(
          jsonDecode(bindingHive.bindingsStringJson) as Map<String, dynamic>,
        ).toDomain();

        bindings.add(
          bindingEntity.copyWith(
            entityStateGRPC: BindingCbjDeviceStateGRPC(
              EntityStateGRPC.waitingInComp.toString(),
            ),
          ),
        );
      }
      return right(bindings);
    } catch (e) {
      icLogger.e('Local DB hive error while getting bindings: $e');
    }
    return left(const LocalDbFailures.unexpected());
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveScenes({
    required List<SceneCbjEntity> sceneList,
  }) async {
    try {
      final List<ScenesHiveModel> scenesHiveList = [];

      final List<String> scenesListStringJson = List<String>.from(
        sceneList.map((e) => jsonEncode(e.toInfrastructure().toJson())),
      );

      for (final String scenesEntityDtosJsonString in scenesListStringJson) {
        final ScenesHiveModel scenesHiveModel = ScenesHiveModel()
          ..scenesStringJson = scenesEntityDtosJsonString;
        scenesHiveList.add(scenesHiveModel);
      }

      await scenesBox?.close();
      scenesBox = await Hive.openBox<ScenesHiveModel>(scenesBoxName);

      await scenesBox?.clear();
      await scenesBox?.addAll(scenesHiveList);

      await scenesBox?.close();
      icLogger.i('Scenes got saved to local storage');
    } catch (e) {
      icLogger.e('Error saving Scenes to local storage\n$e');
      return left(const LocalDbFailures.unexpected());
    }

    return right(unit);
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveRoutines({
    required List<RoutineCbjEntity> routineList,
  }) async {
    try {
      final List<RoutinesHiveModel> routinesHiveList = [];

      final List<String> routinesListStringJson = List<String>.from(
        routineList.map((e) => jsonEncode(e.toInfrastructure().toJson())),
      );

      for (final String routinesEntityDtosJsonString
          in routinesListStringJson) {
        final RoutinesHiveModel routinesHiveModel = RoutinesHiveModel()
          ..routinesStringJson = routinesEntityDtosJsonString;
        routinesHiveList.add(routinesHiveModel);
      }

      await routinesBox?.close();
      routinesBox = await Hive.openBox<RoutinesHiveModel>(routinesBoxName);

      await routinesBox?.clear();
      await routinesBox?.addAll(routinesHiveList);

      await routinesBox?.close();
      icLogger.i('Routines got saved to local storage');
    } catch (e) {
      icLogger.e('Error saving Routines to local storage\n$e');
      return left(const LocalDbFailures.unexpected());
    }

    return right(unit);
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveBindings({
    required List<BindingCbjEntity> bindingList,
  }) async {
    try {
      final List<BindingsHiveModel> bindingsHiveList = [];

      final List<String> bindingsListStringJson = List<String>.from(
        bindingList.map((e) => jsonEncode(e.toInfrastructure().toJson())),
      );

      for (final String bindingsEntityDtosJsonString
          in bindingsListStringJson) {
        final BindingsHiveModel bindingsHiveModel = BindingsHiveModel()
          ..bindingsStringJson = bindingsEntityDtosJsonString;
        bindingsHiveList.add(bindingsHiveModel);
      }

      await bindingsBox?.close();

      bindingsBox = await Hive.openBox<BindingsHiveModel>(bindingsBoxName);

      await bindingsBox?.clear();
      await bindingsBox?.addAll(bindingsHiveList);

      await bindingsBox?.close();
      icLogger.i('Bindings got saved to local storage');
    } catch (e) {
      icLogger.e('Error saving Bindings to local storage\n$e');
      return left(const LocalDbFailures.unexpected());
    }

    return right(unit);
  }

  // @override
  // Future<String> getHomeId() async {
  //   final List<HomeEntityIsarModel> homeEntityIsarModelList =
  //       await isar.homeEntityIsarModels.where().findAll();
  //
  //   return homeEntityIsarModelList[0].homeId;
  // }
  //
  // @override
  // Future<void> setHomeId(String homeId) async {
  //   final HomeEntityIsarModel homeEntityIsarModel = HomeEntityIsarModel()
  //     ..homeId = homeId;
  //   await isar.writeTxn(() async {
  //     await isar.homeEntityIsarModels.clear();
  //     await isar.homeEntityIsarModels.put(homeEntityIsarModel);
  //   });
  // }
}
