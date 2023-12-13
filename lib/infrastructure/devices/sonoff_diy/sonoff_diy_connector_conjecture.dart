import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/sonoff_diy/sonoff__diy_wall_switch/sonoff_diy_mod_wall_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';

class SonoffDiyConnectorConjecture
    implements AbstractCompanyConnectorConjecture {
  factory SonoffDiyConnectorConjecture() {
    return _instance;
  }

  SonoffDiyConnectorConjecture._singletonContractor();

  static final SonoffDiyConnectorConjecture _instance =
      SonoffDiyConnectorConjecture._singletonContractor();

  static const List<String> mdnsTypes = ['_ewelink._tcp'];
  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundDevice(
    DeviceEntityAbstract entity,
  ) async {
    // /// Add new devices to [companyDevices] if not exist
    // Future<List<DeviceEntityAbstract>> addNewDeviceByMdnsName({
    //   required String mDnsName,
    //   required String ip,
    //   required String port,
    // }) async {

    // CoreUniqueId? tempCoreUniqueId;

    // for (final DeviceEntityAbstract device in companyDevices.values) {
    //   if (device is SonoffDiyRelaySwitchEntity &&
    //       mDnsName == device.entityUniqueId.getOrCrash()) {
    //     return [];
    //   } else if (device is GenericSwitchDE &&
    //       mDnsName == device.entityUniqueId.getOrCrash()) {
    //     /// Device exist as generic and needs to get converted to non generic type for this vendor
    //     tempCoreUniqueId = device.uniqueId;
    //     break;
    //   } else if (mDnsName == device.entityUniqueId.getOrCrash()) {
    //     icLogger.w(
    //       'Sonoff device type supported but implementation is missing here',
    //     );
    //     return [];
    //   }
    // }

    // final List<DeviceEntityAbstract> sonoffDevices =
    //     SonoffDiyHelpers.addDiscoveredDevice(
    //   mDnsName: mDnsName,
    //   ip: ip,
    //   port: port,
    //   uniqueDeviceId: tempCoreUniqueId,
    // );

    // if (sonoffDevices.isEmpty) {
    //   return [];
    // }

    // for (final DeviceEntityAbstract entityAsDevice in sonoffDevices) {
    //   final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
    //       MapEntry(entityAsDevice.uniqueId.getOrCrash(), entityAsDevice);

    //   companyDevices.addEntries([deviceAsEntry]);
    // }
    // icLogger.t('New Sonoff diy devices name:$mDnsName');
    // return sonoffDevices;
    return null;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract sonoffDiyDE,
  ) async {
    final DeviceEntityAbstract? device =
        companyDevices[sonoffDiyDE.entityUniqueId.getOrCrash()];

    if (device is SonoffDiyRelaySwitchEntity) {
      device.executeDeviceAction(newEntity: sonoffDiyDE);
    } else {
      icLogger.w('Sonoff diy device type does not exist');
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {}
}
