import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/routine/routine_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/routine/routine_cbj_failures.dart';
import 'package:cbj_integrations_controller/domain/routine/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/routines/routine_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

abstract class IRoutineCbjRepository {
  static IRoutineCbjRepository? _instance;

  static IRoutineCbjRepository get instance {
    return _instance ??= RoutineCbjRepository();
  }

  /// Setting up all routines from db
  Future<void> setUpAllFromDb();

  Future<List<RoutineCbjEntity>> getAllRoutinesAsList();

  Future<Map<String, RoutineCbjEntity>> getAllRoutinesAsMap();

  /// Sending the new routine to the hub to get added, will not save it to local db
  Future<Either<RoutineCbjFailure, Unit>> addNewRoutine(
    RoutineCbjEntity routineCbj,
  );

  /// Sending the new routine to the hub to get added, and saves it to local db
  Future<Either<RoutineCbjFailure, Unit>> addNewRoutineAndSaveItToLocalDb(
    RoutineCbjEntity routineCbj,
  );

  Future<Either<LocalDbFailures, Unit>> saveAndActivateRoutineToDb();

  Future<bool> activateRoutine(RoutineCbjEntity routineCbj);

  /// Get entity and return the full MQTT path to it
  Future<String> getFullMqttPathOfRoutine(RoutineCbjEntity routineCbj);

  Stream<Either<RoutineCbjFailure, KtList<RoutineCbjEntity>>>
      watchAllRoutines();

  /// Sending the new routine to the hub to get added
  Future<Either<RoutineCbjFailure, RoutineCbjEntity>>
      addOrUpdateNewRoutineInHub(
    RoutineCbjEntity routineCbjEntity,
  );

  /// Activate action of all routine list
  Future<Either<RoutineCbjFailure, Unit>> activateRoutines(
    KtList<RoutineCbjEntity> routinesList,
  );

  Future<Either<RoutineCbjFailure, RoutineCbjEntity>> getRoutine();

  /// Sending the new routine to the hub to get added
  Future<Either<RoutineCbjFailure, RoutineCbjEntity>>
      addOrUpdateNewRoutineInHubFromDevicesPropertyActionList(
    String routineName,
    List<MapEntry<DeviceEntityAbstract, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
    RoutineCbjRepeatDateDays daysToRepeat,
    RoutineCbjRepeatDateHour hourToRepeat,
    RoutineCbjRepeatDateMinute minutesToRepeat,
  );

  /// Sending the new routine from the hub to the app routine list
  void addOrUpdateNewRoutineInApp(
    RoutineCbjEntity routineCbj,
  );

  Future<void> initiateHubConnection();

  BehaviorSubject<KtList<RoutineCbjEntity>>
      routinesResponseFromTheHubStreamController =
      BehaviorSubject<KtList<RoutineCbjEntity>>();
}
