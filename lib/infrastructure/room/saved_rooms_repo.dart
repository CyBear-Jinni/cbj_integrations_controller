part of 'package:cbj_integrations_controller/domain/i_saved_rooms_repo.dart';

class _SavedRoomsRepo extends ISavedRoomsRepo {
  final HashMap<String, RoomEntity> _allRooms = HashMap<String, RoomEntity>();

  @override
  Future<void> setUpAllFromDb() async {
    await IDbRepository.instance.getRoomsFromDb().then((value) {
      value.fold((l) => null, (rooms) {
        /// Gets all rooms from db, if there are non it will create and return
        /// only a discovered room
        if (rooms.isEmpty) {
          final RoomEntity discoveredRoom = RoomEntity.empty().copyWith(
            uniqueId: RoomUniqueId.discovered(),
            cbjEntityName: RoomDefaultName.discoveredRoomName(),
          );
          rooms.add(discoveredRoom);
        }
        for (final element in rooms) {
          addOrUpdateRoom(element);
        }
      });
    });
  }

  @override
  Map<String, RoomEntity> getAllRooms() {
    return _allRooms;
  }

  RoomEntity? getRoomDeviceExistIn(DeviceEntityBase deviceEntityBase) {
    final String uniqueId = deviceEntityBase.uniqueId.getOrCrash();
    for (final RoomEntity roomEntity in _allRooms.values) {
      if (roomEntity.roomDevicesId.getOrCrash().contains(uniqueId)) {
        return roomEntity;
      }
    }
    return null;
  }

  RoomEntity? getRoomSceneExistIn(SceneCbjEntity sceneCbj) {
    final String uniqueId = sceneCbj.uniqueId.getOrCrash();
    for (final RoomEntity roomEntity in _allRooms.values) {
      if (roomEntity.roomScenesId.getOrCrash().contains(uniqueId)) {
        return roomEntity;
      }
    }
    return null;
  }

  RoomEntity? getRoomRoutineExistIn(RoutineCbjEntity routineCbj) {
    final String uniqueId = routineCbj.uniqueId.getOrCrash();
    for (final RoomEntity roomEntity in _allRooms.values) {
      if (roomEntity.roomRoutinesId.getOrCrash().contains(uniqueId)) {
        return roomEntity;
      }
    }
    return null;
  }

  RoomEntity? getRoomBindingExistIn(BindingCbjEntity bindingCbj) {
    final String uniqueId = bindingCbj.uniqueId.getOrCrash();
    for (final RoomEntity roomEntity in _allRooms.values) {
      if (roomEntity.roomBindingsId.getOrCrash().contains(uniqueId)) {
        return roomEntity;
      }
    }
    return null;
  }

  @override
  RoomEntity addOrUpdateRoom(RoomEntity roomEntity) {
    RoomEntity newRoomEntity = roomEntity;

    final RoomEntity? roomFromAllRoomsSet =
        _allRooms[roomEntity.uniqueId.getOrCrash()];

    /// TODO: Check if this should only happen in discover room
    if (roomFromAllRoomsSet != null) {
      /// For devices in the room
      final Set<String> allDevicesInNewRoom =
          roomEntity.roomDevicesId.getOrCrash();
      final Set<String> allDevicesInExistingRoom =
          roomFromAllRoomsSet.roomDevicesId.getOrCrash();

      final HashSet<String> tempAddDevicesSet = HashSet<String>();
      tempAddDevicesSet.addAll(allDevicesInNewRoom);
      tempAddDevicesSet.addAll(allDevicesInExistingRoom);
      newRoomEntity = newRoomEntity.copyWith(
        roomDevicesId: RoomDevicesId(Set.from(tempAddDevicesSet)),
      );

      /// For scenes in the room
      final Set<String> allScenesInNewRoom =
          roomEntity.roomScenesId.getOrCrash();
      final Set<String> allScenesInExistingRoom =
          roomFromAllRoomsSet.roomDevicesId.getOrCrash();

      final HashSet<String> tempAddScenesSet = HashSet<String>();
      tempAddScenesSet.addAll(allScenesInNewRoom);
      tempAddScenesSet.addAll(allScenesInExistingRoom);
      newRoomEntity = newRoomEntity.copyWith(
        roomScenesId: RoomScenesId(Set.from(tempAddScenesSet)),
      );

      /// For Routines in the room
      final Set<String> allRoutinesInNewRoom =
          roomEntity.roomRoutinesId.getOrCrash();
      final Set<String> allRoutinesInExistingRoom =
          roomFromAllRoomsSet.roomRoutinesId.getOrCrash();

      final HashSet<String> tempAddRoutinesSet = HashSet<String>();
      tempAddRoutinesSet.addAll(allRoutinesInNewRoom);
      tempAddRoutinesSet.addAll(allRoutinesInExistingRoom);
      newRoomEntity = newRoomEntity.copyWith(
        roomRoutinesId: RoomRoutinesId(Set.from(tempAddRoutinesSet)),
      );

      /// For Bindings in the room
      final Set<String> allBindingsInNewRoom =
          roomEntity.roomBindingsId.getOrCrash();
      final Set<String> allBindingsInExistingRoom =
          roomFromAllRoomsSet.roomBindingsId.getOrCrash();

      final HashSet<String> tempAddBindingsSet = HashSet<String>();
      tempAddBindingsSet.addAll(allBindingsInNewRoom);
      tempAddBindingsSet.addAll(allBindingsInExistingRoom);
      newRoomEntity = newRoomEntity.copyWith(
        roomBindingsId: RoomBindingsId(Set.from(tempAddBindingsSet)),
      );
    }

    _allRooms.addEntries([
      MapEntry<String, RoomEntity>(
        newRoomEntity.uniqueId.getOrCrash(),
        newRoomEntity,
      ),
    ]);
    return newRoomEntity;
  }

  @override
  void addDeviceToRoomDiscoveredIfNotExist(DeviceEntityBase deviceEntity) {
    final RoomEntity? roomEntity = getRoomDeviceExistIn(deviceEntity);
    if (roomEntity != null) {
      return;
    }

    final RoomEntity discoverRoom = createRoomDiscoverIfNotExist();

    _allRooms[discoverRoom.uniqueId.getOrCrash()]!
        .addDeviceId(deviceEntity.uniqueId.getOrCrash());
  }

  @override
  void addSceneToRoomDiscoveredIfNotExist(SceneCbjEntity sceneCbjEntity) {
    final RoomEntity? roomEntity = getRoomSceneExistIn(sceneCbjEntity);
    if (roomEntity != null) {
      return;
    }

    final RoomEntity discoverRoom = createRoomDiscoverIfNotExist();

    _allRooms[discoverRoom.uniqueId.getOrCrash()]!
        .addSceneId(sceneCbjEntity.uniqueId.getOrCrash());
  }

  @override
  void addRoutineToRoomDiscoveredIfNotExist(RoutineCbjEntity routineCbjEntity) {
    final RoomEntity? roomEntity = getRoomRoutineExistIn(routineCbjEntity);
    if (roomEntity != null) {
      return;
    }
    final RoomEntity discoverRoom = createRoomDiscoverIfNotExist();

    _allRooms[discoverRoom.uniqueId.getOrCrash()]!
        .addRoutineId(routineCbjEntity.uniqueId.getOrCrash());
  }

  @override
  void addBindingToRoomDiscoveredIfNotExist(BindingCbjEntity bindingCbjEntity) {
    final RoomEntity? roomEntity = getRoomBindingExistIn(bindingCbjEntity);
    if (roomEntity != null) {
      return;
    }
    final RoomEntity discoverRoom = createRoomDiscoverIfNotExist();

    _allRooms[discoverRoom.uniqueId.getOrCrash()]!
        .addBindingId(bindingCbjEntity.uniqueId.getOrCrash());
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveAndActiveRoomToDb({
    required RoomEntity roomEntity,
  }) async {
    // TODO: Rewrite it to call addOrUpdateRoom and just save the final state
    RoomEntity roomEntityTemp = roomEntity;
    final String roomId = roomEntityTemp.uniqueId.getOrCrash();

    await removeSameDevicesFromOtherRooms(roomEntityTemp);

    Set<String> newDevicesSet = roomEntityTemp.roomDevicesId.getOrCrash();

    bool newRoom = false;
    if (_allRooms[roomId] == null) {
      final String roomImage = pickRoomImage();
      roomEntityTemp =
          roomEntityTemp.copyWith(background: RoomBackground(roomImage));

      _allRooms.addEntries([MapEntry(roomId, roomEntityTemp)]);
      newRoom = true;
    } else {
      final RoomEntity savedRoom = _allRooms[roomId]!;
      newDevicesSet = getOnlyWhatOnlyExistInFirsSet(
        roomEntityTemp.roomDevicesId.getOrCrash(),
        savedRoom.roomDevicesId.getOrCrash(),
      );

      final RoomEntity roomEntityCombinedDevices = roomEntityTemp.copyWith(
        roomDevicesId: RoomDevicesId(
          combineNoDuplicateSetOfString(
            savedRoom.roomDevicesId.getOrCrash(),
            roomEntityTemp.roomDevicesId.getOrCrash(),
          ),
        ),
        roomTypes: RoomTypes(
          // Getting handled in createScenesForAllSelectedRoomTypes
          savedRoom.roomTypes.getOrCrash(),
        ),
        roomScenesId: RoomScenesId(
          combineNoDuplicateSetOfString(
            savedRoom.roomScenesId.getOrCrash(),
            roomEntityTemp.roomScenesId.getOrCrash(),
          ),
        ),
        background: savedRoom.background,
      );
      _allRooms[roomId] = roomEntityCombinedDevices;
    }
    // TODO: check if this line is not redundant
    await ISavedDevicesRepo.instance.saveAndActivateSmartDevicesToDb();

    await createScenesForAllSelectedRoomTypes(
      roomEntity: roomEntityTemp,
      newRoom: newRoom,
    );

    await ISceneCbjRepository.instance
        .addDevicesToMultipleScenesAreaTypeWithPreSetActions(
      devicesId: newDevicesSet,
      scenesId: _allRooms[roomId]!.roomScenesId.getOrCrash(),
      areaTypes: _allRooms[roomId]!.roomTypes.getOrCrash(),
    );
    final Future<Either<LocalDbFailures, Unit>> saveRoomToDbResponse =
        IDbRepository.instance.saveRoomsToDb(
      roomsList: Set<RoomEntity>.from(_allRooms.values),
    );

    // TODO: Fix after new cbj_integrations_controller
    // AppCommunicationRepository.sendAllRoomsFromHubRequestsStream();
    return saveRoomToDbResponse;
  }

  @override
  Future<Either<LocalDbFailures, RoomEntity>>
      createScenesForAllSelectedRoomTypes({
    required RoomEntity roomEntity,
    bool newRoom = false,
  }) async {
    try {
      // To make Sets mutable
      final RoomEntity roomEntityTemp = roomEntity.copyWith(
        roomTypes: RoomTypes(roomEntity.roomTypes.getOrCrash().toSet()),
        roomDevicesId:
            RoomDevicesId(roomEntity.roomDevicesId.getOrCrash().toSet()),
        roomScenesId:
            RoomScenesId(roomEntity.roomScenesId.getOrCrash().toSet()),
        roomRoutinesId:
            RoomRoutinesId(roomEntity.roomRoutinesId.getOrCrash().toSet()),
        roomBindingsId:
            RoomBindingsId(roomEntity.roomBindingsId.getOrCrash().toSet()),
        roomMostUsedBy:
            RoomMostUsedBy(roomEntity.roomMostUsedBy.getOrCrash().toSet()),
        roomPermissions:
            RoomPermissions(roomEntity.roomPermissions.getOrCrash().toSet()),
      );

      final Set<String> tempSet =
          _allRooms[roomEntityTemp.uniqueId.getOrCrash()]
                  ?.roomTypes
                  .getOrCrash() ??
              {};
      final Set<String> roomTypesToAdd;

      if (newRoom) {
        roomTypesToAdd = roomEntity.roomTypes.getOrCrash();
      } else {
        roomTypesToAdd = getOnlyWhatOnlyExistInFirsSet(
          roomEntity.roomTypes.getOrCrash(),
          tempSet,
        );
      }

      for (final String roomTypeNumber in roomTypesToAdd) {
        final AreaPurposesTypes areaPurposeType =
            AreaPurposesTypes.values[int.parse(roomTypeNumber)];

        final String areaNameEdited = areaNameCapsWithSpaces(areaPurposeType);

        final Either<SceneCbjFailure, SceneCbjEntity> sceneOrFailure =
            await ISceneCbjRepository.instance
                .addOrUpdateNewSceneInHubFromDevicesPropertyActionList(
          areaNameEdited,
          {},
          areaPurposeType,
        );
        sceneOrFailure.fold(
          (l) => icLogger.e('Error creating scene from room type'),
          (r) {
            //Add scene id to room
            roomEntityTemp.addSceneId(r.uniqueId.getOrCrash());
          },
        );
        _allRooms[roomEntityTemp.uniqueId.getOrCrash()] = roomEntityTemp;
      }
      return right(_allRooms[roomEntityTemp.uniqueId.getOrCrash()]!);
    } catch (e) {
      icLogger.e('Error setting new scene from room type\n$e');
      return left(const LocalDbFailures.unexpected());
    }
  }

  /// Remove all devices in our room from all the rooms to prevent duplicate
  Future<void> removeSameDevicesFromOtherRooms(RoomEntity roomEntity) async {
    final Set<String> devicesIdInThePassedRoom =
        Set.from(roomEntity.roomDevicesId.getOrCrash());
    if (devicesIdInThePassedRoom.isEmpty) {
      return;
    }

    for (RoomEntity roomEntityTemp in _allRooms.values) {
      if (roomEntityTemp.roomDevicesId.failureOrUnit != right(unit)) {
        continue;
      }
      final Set<String> devicesIdInTheRoom =
          Set.from(roomEntityTemp.roomDevicesId.getOrCrash());

      for (final String deviceIdInTheRoom in devicesIdInTheRoom) {
        final bool indexOfDeviceId =
            devicesIdInThePassedRoom.contains(deviceIdInTheRoom);

        /// If device id exist in other room than delete it from that room
        if (!indexOfDeviceId) {
          roomEntityTemp = roomEntityTemp.copyWith(
            roomDevicesId: roomEntityTemp.deleteIdIfExist(deviceIdInTheRoom),
          );
          _allRooms[roomEntityTemp.uniqueId.getOrCrash()] = roomEntityTemp;
        }
      }
    }
  }

  Set<String> combineNoDuplicateSetOfString(
    Set<String> devicesId,
    Set<String> newDevicesId,
  ) {
    final HashSet<String> hashSetDevicesId = HashSet<String>();
    hashSetDevicesId.addAll(devicesId);
    hashSetDevicesId.addAll(newDevicesId);
    return Set.from(hashSetDevicesId);
  }

  Set<String> getOnlyWhatOnlyExistInFirsSet(
    Set<String> firstSet,
    Set<String> secondSet,
  ) {
    final Set<String> tempSet = {};

    for (final String stringText in firstSet) {
      if (!secondSet.contains(stringText)) {
        tempSet.add(stringText);
      }
    }

    return tempSet;
  }

  String areaNameCapsWithSpaces(AreaPurposesTypes areaPurposeType) {
    final String tempAreaName =
        areaPurposeType.name.substring(1, areaPurposeType.name.length);
    String areaNameEdited = areaPurposeType.name.substring(0, 1).toUpperCase();
    for (int tempNum = 0; tempNum < tempAreaName.length; tempNum++) {
      final String charFromAreaType = tempAreaName[tempNum];
      if (charFromAreaType[0] == charFromAreaType[0].toUpperCase()) {
        areaNameEdited += ' ';
      }
      // ignore: use_string_buffers
      areaNameEdited += charFromAreaType;
    }
    return areaNameEdited;
  }

  @override
  AreaPurposesTypes? getAreaTypeFromNameCapsWithSpaces(
    String areaNameCapsAndSpaces,
  ) {
    String tempString = areaNameCapsAndSpaces.replaceAll(' ', '');

    tempString =
        tempString.substring(0, 1).toLowerCase() + tempString.substring(1);

    final AreaPurposesTypes areaPTemp = AreaPurposesTypes.values
        .firstWhere((element) => element.name == tempString);
    return areaPTemp;
  }

  String pickRoomImage() {
    final Set<String> roomImages = HashSet.from([
      'https://live.staticflickr.com/5220/5486044345_f67abff3e9_h.jpg',
      'https://live.staticflickr.com/7850/31597166847_486557e555_h.jpg',
      'https://images.pexels.com/photos/459654/pexels-photo-459654.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'https://live.staticflickr.com/7034/13522716673_1e13298046_h.jpg',
      'https://live.staticflickr.com/8430/7731774826_7c1627cfcd_h.jpg',
      'https://images.pexels.com/photos/2343475/pexels-photo-2343475.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'https://live.staticflickr.com/7160/6470998009_b7107d55fe_h.jpg',
      'https://live.staticflickr.com/1256/1471268812_c73d690f26_h.jpg',
      'https://live.staticflickr.com/1415/4592575839_15ca3982b7_c.jpg',
      'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'https://images.unsplash.com/photo-1564829439675-0eec72f0b695?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80',
    ]);

    return roomImages.elementAt(Random().nextInt(roomImages.length - 1));
  }

  /// Create discovered room if not exist and returns it.
  RoomEntity createRoomDiscoverIfNotExist() {
    final String discoveredRoomId = RoomUniqueId.discovered().getOrCrash();

    if (_allRooms[discoveredRoomId] == null) {
      _allRooms.addEntries([
        MapEntry(
          discoveredRoomId,
          RoomEntity.empty().copyWith(
            uniqueId: RoomUniqueId.fromUniqueString(discoveredRoomId),
            cbjEntityName: RoomDefaultName.discoveredRoomName(),
          ),
        ),
      ]);
    }
    return _allRooms[discoveredRoomId]!;
  }
}
