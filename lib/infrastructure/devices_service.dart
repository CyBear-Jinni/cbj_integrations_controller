import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';

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

  void deviceStateChanged() {
    // Save on db

    // Add device to deviceChangesStream
  }

  // TODO: Gete devices from db instead
  HashMap<String, DeviceEntityAbstract> descoverdDeviceList = HashMap();

  HashMap<String, DeviceEntityAbstract> getEntities() =>
      // TODO: Should retreve all devics from the db
      descoverdDeviceList;

  StreamController<MapEntry<String, DeviceEntityAbstract>> deviceChangesStream =
      StreamController<MapEntry<String, DeviceEntityAbstract>>();
}
