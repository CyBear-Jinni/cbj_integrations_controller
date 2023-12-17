import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/sonoff_diy/sonoff__diy_wall_switch/sonoff_diy_mod_wall_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';

class SonoffDiyHelpers {
  static Future<HashMap<String, DeviceEntityAbstract>> addDiscoveredDevice(
    DeviceEntityAbstract entity,
  ) async {
    final String? mDnsName = entity.deviceMdns.getOrCrash();
    final String? port = entity.devicePort.getOrCrash();
    final String? ip = entity.deviceLastKnownIp.getOrCrash();

    final HashMap<String, DeviceEntityAbstract> entitiesToAdd = HashMap();

    if (mDnsName == null || port == null || ip == null) {
      return entitiesToAdd;
    }

    try {
      if (mDnsName.contains('sonoffDiy1-C45BBE78005D')) {
        final String deviceCbjUniqueId = mDnsName;

        final SonoffDiyRelaySwitchEntity sonoffDiyRelaySwitchEntity =
            SonoffDiyRelaySwitchEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: CbjEntityName(mDnsName),
          entityOriginalName: EntityOriginalName(mDnsName),
          deviceOriginalName: DeviceOriginalName(mDnsName),
          entityStateGRPC: entity.entityStateGRPC,
          senderDeviceOs: entity.senderDeviceOs,
          deviceVendor: entity.deviceVendor,
          deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
          senderDeviceModel: DeviceSenderDeviceModel('d1'),
          senderId: entity.senderId,
          compUuid: entity.compUuid,
          stateMassage: entity.stateMassage,
          powerConsumption: entity.powerConsumption,
          devicePort: DevicePort(port),
          deviceHostName: DeviceHostName(mDnsName.toLowerCase()),
          deviceMdns: DeviceMdns(mDnsName),
          srvResourceRecord: entity.srvResourceRecord,
          ptrResourceRecord: entity.ptrResourceRecord,
          deviceLastKnownIp: DeviceLastKnownIp(ip),
          switchState: GenericSwitchSwitchState(false.toString()),
          deviceUniqueId: entity.deviceUniqueId,
          devicesMacAddress: entity.devicesMacAddress,
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          deviceCbjUniqueId: CoreUniqueId.fromUniqueString(deviceCbjUniqueId),
        );
        entitiesToAdd.addEntries([
          MapEntry(deviceCbjUniqueId, sonoffDiyRelaySwitchEntity),
        ]);
      } else {
        icLogger.i('SonoffDiy device types is not supported');
      }
    } catch (e) {
      icLogger.e('Error setting SonoffDiy\n$e');
    }

    return entitiesToAdd;
  }
}
