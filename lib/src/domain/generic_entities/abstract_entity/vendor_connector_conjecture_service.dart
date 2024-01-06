import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:meta/meta.dart';

abstract class VendorConnectorConjectureService {
  VendorConnectorConjectureService({
    required this.vendorsAndServices,
    this.ports = const [],
    this.uniqeMdnsList = const [],
    this.mdnsList = const [],
    this.uniqueIdentifierNameInMdns = const [],
  }) {
    vendorConnectorConjectureClass.add(this);
    addToPortByVendor(vendorsAndServices, ports);
  }

  static HashSet<VendorConnectorConjectureService>
      vendorConnectorConjectureClass = HashSet();

  static final HashMap<VendorsAndServices, List<int>> _portsUsedByVendor =
      HashMap();

  static HashMap<VendorsAndServices, List<int>> get portsUsedByVendor =>
      _portsUsedByVendor;

  static void addToPortByVendor(
    VendorsAndServices vendorsAndServices,
    List<int> ports,
  ) {
    if (ports.isEmpty) {
      return;
    }
    _portsUsedByVendor.addEntries([MapEntry(vendorsAndServices, ports)]);
  }

  @nonVirtual
  final VendorsAndServices vendorsAndServices;

  final List<int> ports;

  /// Stores all devices for the each vendor, devices will be stored as the
  /// vendor implementation and not as generic devices
  ///
  /// key is entityUniqueId so that it can both use it quickly to not add the
  /// same device twice and to manage requests of actions from the app since
  /// the action already arrives with entityUniqueId value
  HashMap<String, DeviceEntityBase> vendorEntities = HashMap();

  /// Exists only for the vendor devices
  @nonVirtual
  final List<String> uniqeMdnsList;

  /// Can be found on more then one vendor
  @nonVirtual
  final List<String> mdnsList;

  @nonVirtual
  final List<String> uniqueIdentifierNameInMdns;

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
    HashMap<ActionValues, dynamic>? value,
  }) async {
    for (final String id in ids) {
      final DeviceEntityBase? entity = vendorEntities[id];
      if (entity == null) {
        icLogger.e(
          "$vendorsAndServices can't find the device to set cbjUniqeId: $id",
        );
        continue;
      }
      entity.executeAction(property: property, action: action, values: value);
    }
  }
}
