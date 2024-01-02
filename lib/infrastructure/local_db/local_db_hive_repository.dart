part of 'package:cbj_integrations_controller/domain/local_db/i_local_db_repository.dart';

/// Only ISavedDevicesRepo need to call functions here
class _HiveRepository extends IDbRepository {
  /// Name of the box that stores Remote Pipes credentials
  String remotePipesBoxName = 'remotePipesBox';

  /// Name of the box that stores all the areas
  String areasBoxName = 'areasBox';

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
    Hive.registerAdapter(AreasHiveModelAdapter());
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

  Box<AreasHiveModel>? areasBox;
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

      final Set<LifxVendorCredentialsHiveModel>
          lifxVendorCredentialsModelFromDb = lifxVendorCredentialsBox!.values
              .toSet()
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

      final Set<EspHomeVendorCredentialsHiveModel>
          espHomeVendorCredentialsModelFromDb = espHomeVendorCredentialsBox!
              .values
              .toSet()
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

      final Set<XiaomiMiVendorCredentialsHiveModel>
          xiaomiMiVendorCredentialsModelFromDb = xiaomiMiVendorCredentialsBox!
              .values
              .toSet()
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

      final Set<EwelinkVendorCredentialsHiveModel>
          ewelinkVendorCredentialsModelFromDb = ewelinkVendorCredentialsBox!
              .values
              .toSet()
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

    // Areas need to stay first one
    // await ISavedAreasRepo.instance.setUpAllFromDb();
    await ISceneCbjRepository.instance.setUpAllFromDb();
    await IRoutineCbjRepository.instance.setUpAllFromDb();
    await IBindingCbjRepository.instance.setUpAllFromDb();
    // await ISavedDevicesRepo.instance.setUpAllFromDb();
  }

  @override
  Future<Either<LocalDbFailures, Set<AreaEntity>>> getAreasFromDb() async {
    final Set<AreaEntity> areas = <AreaEntity>{};

    try {
      await areasBox?.close();
      areasBox = await Hive.openBox<AreasHiveModel>(areasBoxName);
      final Set<AreasHiveModel> areasHiveModelFromDb =
          areasBox!.values.toSet().cast<AreasHiveModel>();

      await areasBox?.close();
      for (final AreasHiveModel areaHive in areasHiveModelFromDb) {
        final AreaEntity areaEntity = AreaEntity(
          uniqueId: AreaUniqueId.fromUniqueString(areaHive.areaUniqueId),
          cbjEntityName: AreaDefaultName(areaHive.areaDefaultName),
          background: AreaBackground(areaHive.areaBackground),
          areaTypes: AreaTypes(areaHive.areaTypes.toSet()),
          areaDevicesId: AreaDevicesId(areaHive.areaDevicesId.toSet()),
          areaScenesId: AreaScenesId(areaHive.areaScenesId.toSet()),
          areaRoutinesId: AreaRoutinesId(areaHive.areaRoutinesId.toSet()),
          areaBindingsId: AreaBindingsId(areaHive.areaBindingsId.toSet()),
          areaMostUsedBy: AreaMostUsedBy(areaHive.areaMostUsedBy.toSet()),
          areaPermissions: AreaPermissions(areaHive.areaPermissions.toSet()),
        );
        areas.add(areaEntity);
      }
    } catch (e) {
      icLogger.e('Local DB hive error while getting areas: $e');
      // TODO: Check why hive crash stop this from working
      await deleteAllSavedAreas();
    }

    return right(areas);
  }

  @override
  Future<Either<LocalDbFailures, Set<DeviceEntityBase>>>
      getSmartDevicesFromDb() async {
    final Set<DeviceEntityBase> devices = {};

    try {
      await devicesBox?.close();
      devicesBox = await Hive.openBox<DevicesHiveModel>(devicesBoxName);

      final Set<DevicesHiveModel> devicesHiveModelFromDb =
          devicesBox!.values.toSet().cast<DevicesHiveModel>();

      await devicesBox?.close();

      for (final DevicesHiveModel deviceHive in devicesHiveModelFromDb) {
        final DeviceEntityBase deviceEntity =
            DeviceHelper.convertJsonStringToDomain(deviceHive.deviceStringJson);

        devices.add(
          deviceEntity
            ..entityStateGRPC =
                EntityState.state(EntityStateGRPC.waitingInComp),
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
    required Set<LifxVendorCredentialsHiveModel>
        lifxVendorCredentialsModelFromDb,
  }) async {
    try {
      if (lifxVendorCredentialsModelFromDb.isNotEmpty) {
        final LifxVendorCredentialsHiveModel firstLifxVendorFromDB =
            lifxVendorCredentialsModelFromDb.elementAt(0);

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
    required Set<EspHomeVendorCredentialsHiveModel>
        espHomeVendorCredentialsModelFromDb,
  }) async {
    try {
      if (espHomeVendorCredentialsModelFromDb.isNotEmpty) {
        final EspHomeVendorCredentialsHiveModel firstEspHomeVendorFromDB =
            espHomeVendorCredentialsModelFromDb.elementAt(0);

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
    required Set<XiaomiMiVendorCredentialsHiveModel>
        xiaomiMiVendorCredentialsModelFromDb,
  }) async {
    try {
      if (xiaomiMiVendorCredentialsModelFromDb.isNotEmpty) {
        final XiaomiMiVendorCredentialsHiveModel firstXiaomiMiVendorFromDB =
            xiaomiMiVendorCredentialsModelFromDb.elementAt(0);

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
    required Set<EwelinkVendorCredentialsHiveModel>
        ewelinkVendorCredentialsModelFromDb,
  }) async {
    try {
      if (ewelinkVendorCredentialsModelFromDb.isNotEmpty) {
        final EwelinkVendorCredentialsHiveModel firstEwelinkVendorFromDB =
            ewelinkVendorCredentialsModelFromDb.elementAt(0);

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
      final Set<RemotePipesHiveModel> remotePipesHiveModelFromDb =
          remotePipesBox!.values.toSet().cast<RemotePipesHiveModel>();
      await remotePipesBox?.close();

      if (remotePipesHiveModelFromDb.isNotEmpty) {
        final String remotePipesDnsName =
            remotePipesHiveModelFromDb.elementAt(0).domainName;

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
    required Set<DeviceEntityBase> deviceList,
  }) async {
    try {
      final Set<DevicesHiveModel> devicesHiveList = {};

      final Set<String> devicesListStringJson = Set<String>.from(
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
  Future<Either<LocalDbFailures, Unit>> saveAreasToDb({
    required Set<AreaEntity> areasList,
  }) async {
    try {
      final Set<AreasHiveModel> rommsHiveList = {};

      final Set<AreaEntityDtos> areasListDto =
          Set<AreaEntityDtos>.from(areasList.map((e) => e.toInfrastructure()));

      for (final AreaEntityDtos areaEntityDtos in areasListDto) {
        final AreasHiveModel areasHiveModel = AreasHiveModel()
          ..areaUniqueId = areaEntityDtos.uniqueId
          ..areaDefaultName = areaEntityDtos.cbjEntityName
          ..areaBackground = areaEntityDtos.background
          ..areaDevicesId = areaEntityDtos.areaDevicesId.toList()
          ..areaScenesId = areaEntityDtos.areaScenesId.toList()
          ..areaRoutinesId = areaEntityDtos.areaRoutinesId.toList()
          ..areaBindingsId = areaEntityDtos.areaBindingsId.toList()
          ..areaMostUsedBy = areaEntityDtos.areaMostUsedBy.toList()
          ..areaPermissions = areaEntityDtos.areaPermissions.toList()
          ..areaTypes = areaEntityDtos.areaTypes.toList();
        rommsHiveList.add(areasHiveModel);
      }

      await areasBox?.close();
      areasBox = await Hive.openBox<AreasHiveModel>(areasBoxName);

      await areasBox?.clear();
      await areasBox?.addAll(rommsHiveList);

      await areasBox?.close();
      icLogger.i('Areas got saved to local storage');
    } catch (e) {
      icLogger.e('Error saving Areas to local storage\n$e');
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

  Future<void> deleteAllSavedAreas() async {
    await saveAreasToDb(areasList: {});
  }

  @override
  Future<Either<LocalDbFailures, Set<SceneCbjEntity>>> getScenesFromDb() async {
    final Set<SceneCbjEntity> scenes = <SceneCbjEntity>{};

    try {
      await scenesBox?.close();

      scenesBox = await Hive.openBox<ScenesHiveModel>(scenesBoxName);

      final Set<ScenesHiveModel> scenesHiveModelFromDb =
          scenesBox!.values.toSet().cast<ScenesHiveModel>();

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
  Future<Either<LocalDbFailures, Set<RoutineCbjEntity>>>
      getRoutinesFromDb() async {
    final Set<RoutineCbjEntity> routines = <RoutineCbjEntity>{};

    try {
      await routinesBox?.close();
      routinesBox = await Hive.openBox<RoutinesHiveModel>(routinesBoxName);

      final Set<RoutinesHiveModel> routinesHiveModelFromDb =
          routinesBox!.values.toSet().cast<RoutinesHiveModel>();

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
  Future<Either<LocalDbFailures, Set<BindingCbjEntity>>>
      getBindingsFromDb() async {
    final Set<BindingCbjEntity> bindings = <BindingCbjEntity>{};

    try {
      await bindingsBox?.close();
      bindingsBox = await Hive.openBox<BindingsHiveModel>(bindingsBoxName);

      final Set<BindingsHiveModel> bindingsHiveModelFromDb =
          bindingsBox!.values.toSet().cast<BindingsHiveModel>();

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
    required Set<SceneCbjEntity> sceneList,
  }) async {
    try {
      final Set<ScenesHiveModel> scenesHiveList = {};

      final Set<String> scenesListStringJson = Set<String>.from(
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
    required Set<RoutineCbjEntity> routineList,
  }) async {
    try {
      final Set<RoutinesHiveModel> routinesHiveList = {};

      final Set<String> routinesListStringJson = Set<String>.from(
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
    required Set<BindingCbjEntity> bindingList,
  }) async {
    try {
      final Set<BindingsHiveModel> bindingsHiveList = {};

      final Set<String> bindingsListStringJson = Set<String>.from(
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
  //   final Set<HomeEntityIsarModel> homeEntityIsarModelList =
  //       await isar.homeEntityIsarModels.where().findAll();
  //
  //   return homeEntityIsarModelList.elementAt(0).homeId;
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
