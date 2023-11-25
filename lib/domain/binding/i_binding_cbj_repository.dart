import 'package:cbj_integrations_controller/domain/binding/binding_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/binding/binding_cbj_failures.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/bindings/binding_repository.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

abstract class IBindingCbjRepository {
  static IBindingCbjRepository? _instance;

  static IBindingCbjRepository get instance {
    return _instance ??= BindingCbjRepository();
  }

  /// Setting up all bindings from db
  Future<void> setUpAllFromDb();

  Future<List<BindingCbjEntity>> getAllBindingsAsList();

  Future<Map<String, BindingCbjEntity>> getAllBindingsAsMap();

  Stream<Either<BindingCbjFailure, KtList<BindingCbjEntity>>>
      watchAllBindings();

  /// Sending the new binding to the hub to get added
  Future<Either<BindingCbjFailure, BindingCbjEntity>>
      addOrUpdateNewBindingInHub(
    BindingCbjEntity bindingCbjEntity,
  );

  /// Activate action of all binding list
  Future<Either<BindingCbjFailure, Unit>> activateBindings(
    KtList<BindingCbjEntity> bindingsList,
  );

  /// Sending the new binding to the hub to get added
  Future<Either<BindingCbjFailure, Unit>> addNewBinding(
    BindingCbjEntity bindingCbj,
  );

  Future<Either<LocalDbFailures, Unit>> saveAndActivateBindingToDb();

  Future<bool> activateBinding(
    BindingCbjEntity bindingCbj,
  );

  /// Get entity and return the full MQTT path to it
  Future<String> getFullMqttPathOfBinding(BindingCbjEntity bindingCbj);

  Future<Either<BindingCbjFailure, BindingCbjEntity>> getBinding();

  /// Sending the new binding to the hub to get added
  Future<Either<BindingCbjFailure, BindingCbjEntity>>
      addOrUpdateNewBindingInHubFromDevicesPropertyActionList(
    String bindingName,
    List<MapEntry<DeviceEntityAbstract, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
  );

  /// Sending the new binding from the hub to the app binding list
  void addOrUpdateNewBindingInApp(
    BindingCbjEntity bindingCbj,
  );

  Future<void> initiateHubConnection();

  BehaviorSubject<KtList<BindingCbjEntity>>
      bindingsResponseFromTheHubStreamController =
      BehaviorSubject<KtList<BindingCbjEntity>>();
}
