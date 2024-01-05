import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/ic_synchronizer.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';

class EntitiesService {
  factory EntitiesService() {
    return _instance;
  }

  EntitiesService._singletonConstractor();

  static final EntitiesService _instance =
      EntitiesService._singletonConstractor();

  void discovedEntity(HashMap<String, DeviceEntityBase> entities) {
    descoverdDeviceList.addAll(entities);
    IcSynchronizer().newEntity(entities);
  }

  void setEntitiesState(ActionObject action) =>
      VendorsConnectorConjecture().setEntitiesState(action);

  void notifyDeviceState() {
    // Save on db

    // Send to app
  }

  // TODO: Gete devices from db instead
  HashMap<String, DeviceEntityBase> descoverdDeviceList = HashMap();

  HashMap<String, DeviceEntityBase> getEntities() =>
      // TODO: Should retreve all devics from the db
      descoverdDeviceList;
}
