import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/domain/room/room_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:color/color.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

part 'package:cbj_integrations_controller/infrastructure/room/room_repository.dart';

abstract class IRoomRepository {
  static IRoomRepository? _instance;

  static IRoomRepository get instance {
    return _instance ??= _RoomRepository();
  }

  void addOrUpdateRoom(RoomEntity roomEntity);

  void addOrUpdateRoomAndStateToWaiting(RoomEntity roomEntity);

  Future<void> initiateHubConnection();

  Either<RoomFailure, KtList<RoomEntity>> getAllRooms();

  Stream<Either<dynamic, KtList<dynamic>>> watchAll();

  Stream<Either<RoomFailure, KtList<RoomEntity>>> watchAllRooms();

  Stream<Either<RoomFailure, KtList<RoomEntity>>> watchLights();

  Stream<Either<RoomFailure, KtList<RoomEntity>>> watchBlinds();

  Stream<Either<RoomFailure, KtList<RoomEntity>>> watchBoilers();

  Stream<Either<RoomFailure, KtList<RoomEntity>>> watchSmartTv();

  Stream<Either<RoomFailure, KtList<RoomEntity>>> watchSwitches();

  Stream<Either<RoomFailure, KtList<RoomEntity>>> watchUncompleted();

  Future<Either<RoomFailure, Unit>> create(
    RoomEntity roomEntity,
  );

  /// Update document in the database in the following fields
  Future<Either<RoomFailure, Unit>> updateDatabase({
    required Map<String, dynamic> documentPath,
    required Map<String, dynamic> fieldsToUpdate,
  });

  Future<Either<RoomFailure, Unit>> updateWithRoomEntity({
    required RoomEntity roomEntity,
  });

  Future<Either<RoomFailure, Unit>> turnOnAllInRooms({
    required List<String>? roomsId,
  });

  Future<Either<RoomFailure, Unit>> turnOffAllInRooms({
    required List<String>? roomsId,
  });

  Future<Either<RoomFailure, Unit>> changeColorTemperatureRooms({
    required List<String>? roomsId,
    required int colorTemperatureToChange,
  });

  Future<Either<RoomFailure, Unit>> changeHsvColorRooms({
    required List<String>? roomsId,
    required HsvColor hsvColorToChange,
  });

  Future<Either<RoomFailure, Unit>> changeBrightnessRooms({
    required List<String>? roomsId,
    required int brightnessToChange,
  });

  Future<Either<RoomFailure, Unit>> moveUpBlinds({
    required List<String>? roomsId,
  });

  Future<Either<RoomFailure, Unit>> stopBlinds({
    required List<String>? roomsId,
  });

  Future<Either<RoomFailure, Unit>> moveDownBlinds({
    required List<String>? roomsId,
  });

  Future<Either<RoomFailure, Unit>> delete(
    RoomEntity roomEntity,
  );

  BehaviorSubject<KtList<dynamic>> allResponseFromTheHubStreamController =
      BehaviorSubject<KtList<dynamic>>();

  BehaviorSubject<KtList<RoomEntity>> roomsResponseFromTheHubStreamController =
      BehaviorSubject<KtList<RoomEntity>>();
}
