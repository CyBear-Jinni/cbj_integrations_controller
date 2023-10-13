import 'package:cbj_integrations_controller/domain/binding/binding_cbj_entity.dart';
import 'package:cbj_integrations_controller/domain/binding/binding_cbj_failures.dart';
import 'package:cbj_integrations_controller/domain/binding/i_binding_cbj_repository.dart';
import 'package:cbj_integrations_controller/domain/binding/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/domain/local_db/i_local_devices_db_repository.dart';
import 'package:cbj_integrations_controller/domain/local_db/local_db_failures.dart';
import 'package:cbj_integrations_controller/domain/mqtt_server/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/domain/rooms/i_saved_rooms_repo.dart';
import 'package:cbj_integrations_controller/domain/saved_devices/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/infrastructure/node_red/node_red_repository.dart';
import 'package:dartz/dartz.dart';

class BindingCbjRepository implements IBindingCbjRepository {
  BindingCbjRepository() {
    IBindingCbjRepository.instance = this;
  }

  final Map<String, BindingCbjEntity> _allBindings = {};

  @override
  Future<void> setUpAllFromDb() async {
    await ILocalDbRepository.instance.getBindingsFromDb().then((value) {
      value.fold((l) => null, (r) async {
        for (final element in r) {
          await addNewBinding(element);
        }
      });
    });
  }

  @override
  Future<List<BindingCbjEntity>> getAllBindingsAsList() async {
    return _allBindings.values.toList();
  }

  @override
  Future<Map<String, BindingCbjEntity>> getAllBindingsAsMap() async {
    return _allBindings;
  }

  @override
  Future<Either<LocalDbFailures, Unit>> saveAndActivateBindingToDb() async {
    return ILocalDbRepository.instance.saveBindings(
      bindingList: List<BindingCbjEntity>.from(_allBindings.values),
    );
  }

  @override
  Future<Either<BindingCbjFailure, Unit>> addNewBinding(
    BindingCbjEntity bindingCbj,
  ) async {
    BindingCbjEntity tempBindingCbj = bindingCbj;

    /// Check if binding already exist
    if (findBindingIfAlreadyBeenAdded(tempBindingCbj) == null) {
      _allBindings.addEntries(
        [MapEntry(tempBindingCbj.uniqueId.getOrCrash(), tempBindingCbj)],
      );

      final String entityId = tempBindingCbj.uniqueId.getOrCrash();

      /// If it is new binding
      _allBindings[entityId] = tempBindingCbj;

      await ISavedDevicesRepo.instance.saveAndActivateSmartDevicesToDb();
      ISavedRoomsRepo.instance
          .addBindingToRoomDiscoveredIfNotExist(tempBindingCbj);
      final String bindingNodeRedFlowId = await NodeRedRepository.instance
          .createNewNodeRedBinding(tempBindingCbj);
      if (bindingNodeRedFlowId.isNotEmpty) {
        tempBindingCbj = tempBindingCbj.copyWith(
          nodeRedFlowId: BindingCbjNodeRedFlowId(bindingNodeRedFlowId),
        );
      }
      await saveAndActivateBindingToDb();
    }
    return right(unit);
  }

  @override
  Future<bool> activateBinding(BindingCbjEntity bindingCbj) async {
    final String fullPathOfBinding = await getFullMqttPathOfBinding(bindingCbj);
    IMqttServerRepository.instance
        .publishMessage(fullPathOfBinding, DateTime.now().toString());

    return true;
  }

  /// Get entity and return the full MQTT path to it
  @override
  Future<String> getFullMqttPathOfBinding(BindingCbjEntity bindingCbj) async {
    final String hubBaseTopic =
        IMqttServerRepository.instance.getHubBaseTopic();
    final String bindingsTopicTypeName =
        IMqttServerRepository.instance.getBindingsTopicTypeName();
    final String bindingId = bindingCbj.firstNodeId.getOrCrash()!;

    return '$hubBaseTopic/$bindingsTopicTypeName/$bindingId';
  }

  /// Check if all bindings does not contain the same binding already
  /// Will compare the unique id's that each company sent us
  BindingCbjEntity? findBindingIfAlreadyBeenAdded(
    BindingCbjEntity bindingEntity,
  ) {
    return _allBindings[bindingEntity.uniqueId.getOrCrash()];
  }
}
