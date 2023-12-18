import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';

abstract class VendorConnectorConjectureService {
  VendorConnectorConjectureService() {
    vendorConnectorConjectureClass.add(this);
  }

  static HashSet<VendorConnectorConjectureService>
      vendorConnectorConjectureClass = HashSet();

  VendorsAndServices get vendorsAndServices;

  /// Stores all devices for the each vendor, devices will be stored as the
  /// vendor implementation and not as generic devices
  ///
  /// key is entityUniqueId so that it can both use it quickly to not add the
  /// same device twice and to manage requests of actions from the app since
  /// the action already arrives with entityUniqueId value
  Map<String, DeviceEntityBase> vendorEntities = {};

  /// Exists only for the vendor devices
  List<String> get mdnsVendorUniqueTypes => [];

  /// Can be found on more then one vendor
  List<String> get mdnsTypes => [];

  List<String> get uniqueIdentifierNameInMdns => [];

  /// Will set up device for this vendor into the connector conjecture,
  /// will be called for each saved device of this vendor
  Future<void> setUpEntityFromDb(DeviceEntityBase entity);

  Future<HashMap<String, DeviceEntityBase>?> foundEntity(
    DeviceEntityBase entity,
  ) async {
    final HashMap<String, DeviceEntityBase> vendorEntityMap =
        await convertToVendorDevice(entity);
    if (vendorEntityMap.isEmpty) {
      return null;
    }
    vendorEntityMap
        .removeWhere((key, value) => vendorEntities.containsKey(key));

    if (vendorEntityMap.isEmpty) {
      return HashMap();
    }

    icLogger.i('New $vendorsAndServices entities got added');

    vendorEntities.addAll(vendorEntityMap);

    return vendorEntityMap;
  }

  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  );

  Future setEntityState({
    required HashSet<String> ids,
    required EntityProperties property,
    required EntityActions action,
    required dynamic value,
  }) async {
    for (final String id in ids) {
      final DeviceEntityBase? entity = vendorEntities[id];
      if (entity == null) {
        icLogger.e(
          "$vendorsAndServices can't find the device to set cbjUniqeId: $id",
        );
        continue;
      }
      entity.executeAction(property: property, action: action, value: value);
    }
  }
}
