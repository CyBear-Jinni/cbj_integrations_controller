import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';

abstract class AbstractVendorConnectorConjecture {
  AbstractVendorConnectorConjecture() {
    vendorConnectorConjectureClass.add(this);
  }

  static HashSet<AbstractVendorConnectorConjecture>
      vendorConnectorConjectureClass = HashSet();

  VendorsAndServices get vendorsAndServices;

  /// Stores all devices for the each vendor, devices will be stored as the
  /// vendor implementation and not as generic devices
  ///
  /// key is entityUniqueId so that it can both use it quickly to not add the
  /// same device twice and to manage requests of actions from the app since
  /// the action already arrives with entityUniqueId value
  Map<String, DeviceEntityAbstract> vendorEntities = {};

  List<String> get mdnsTypes => [];

  List<String> get uniqueIdentifierNameInMdns => [];

  /// Will set up device for this vendor into the connector conjecture,
  /// will be called for each saved device of this vendor
  Future<void> setUpEntityFromDb(DeviceEntityAbstract entity);

  Future<void> manageHubRequestsForDevice(DeviceEntityAbstract entity);

  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  );

  Future setEntityState({
    required HashSet<String> ids,
    required EntityProperties property,
    required EntityActions action,
    required dynamic value,
  }) async {
    for (final String id in ids) {
      final DeviceEntityAbstract? entity = vendorEntities[id];
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
