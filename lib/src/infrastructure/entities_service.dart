import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';

class EntitiesService {
  factory EntitiesService() {
    return _instance;
  }

  EntitiesService._singletonConstractor();

  static final EntitiesService _instance =
      EntitiesService._singletonConstractor();

  /// Stream of devices that got discovered or state of device got changed.
  /// from Vendor Connector Conjectore side (or nodeRED for the hub),
  /// this stream dose not include
  /// request for changes from the app!.
  Stream<MapEntry<String, DeviceEntityBase>> watchEntities() =>
      entitiesChangesStream.stream;

  void discovedEntity(HashMap<String, DeviceEntityBase> entities) {
    // TODO: Save on db instead
    descoverdDeviceList.addAll(entities);

    for (final MapEntry<String, DeviceEntityBase> entry in entities.entries) {
      entitiesChangesStream.add(entry);
    }
  }

  void setEntityState({
    required HashMap<VendorsAndServices, HashSet<String>> uniqueIdByVendor,
    required EntityProperties property,
    required EntityActions action,
    required HashMap<ActionValues, dynamic>? value,
  }) {
    VendorsConnectorConjecture().setEntityState(
      uniqueIdByVendor: uniqueIdByVendor,
      action: action,
      property: property,
      value: value,
    );
  }

  void notifyDeviceState() {
    // Save on db

    // Send to app
  }

  // TODO: Gete devices from db instead
  HashMap<String, DeviceEntityBase> descoverdDeviceList = HashMap();

  HashMap<String, DeviceEntityBase> getEntities() =>
      // TODO: Should retreve all devics from the db
      descoverdDeviceList;

  StreamController<MapEntry<String, DeviceEntityBase>> entitiesChangesStream =
      StreamController<MapEntry<String, DeviceEntityBase>>.broadcast();
}
