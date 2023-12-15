import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors_connector_conjecture.dart';

class DevicesService {
  factory DevicesService() {
    return _instance;
  }

  DevicesService._singletonConstractor();

  static final DevicesService _instance =
      DevicesService._singletonConstractor();

  /// Stream of devices that got discovered or state of device got changed.
  /// from Vendor Connector Conjectore side (or nodeRED for the hub),
  /// this stream dose not include
  /// request for changes from the app!.
  Stream watchDevices() => deviceChangesStream.stream;

  void discovedEntity(HashMap<String, DeviceEntityAbstract> entities) {
    // TODO: Save on db instead
    descoverdDeviceList.addAll(entities);

    for (final MapEntry<String, DeviceEntityAbstract> entry
        in entities.entries) {
      deviceChangesStream.add(entry);
    }
  }

  void setEntityState({
    required HashMap<VendorsAndServices, HashSet<String>> uniqueIdByVendor,
    required EntityProperties property,
    required EntityActions action,
    required dynamic value,
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
  HashMap<String, DeviceEntityAbstract> descoverdDeviceList = HashMap();

  HashMap<String, DeviceEntityAbstract> getEntities() =>
      // TODO: Should retreve all devics from the db
      descoverdDeviceList;

  StreamController<MapEntry<String, DeviceEntityAbstract>> deviceChangesStream =
      StreamController<MapEntry<String, DeviceEntityAbstract>>();
}
