import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/sonoff_diy/sonoff__diy_wall_switch/sonoff_diy_mod_wall_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';

class SonoffDiyHelpers {
  static List<DeviceEntityAbstract> addDiscoveredDevice({
    required String mDnsName,
    required String? port,
    required String ip,
    required CoreUniqueId? uniqueDeviceId,
  }) {
    CoreUniqueId uniqueDeviceIdTemp;

    if (uniqueDeviceId != null) {
      uniqueDeviceIdTemp = uniqueDeviceId;
    } else {
      uniqueDeviceIdTemp = CoreUniqueId();
    }

    final List<DeviceEntityAbstract> deviceEntityList = [];

    try {
      if (mDnsName.contains('sonoffDiy1-C45BBE78005D')) {
        final SonoffDiyRelaySwitchEntity sonoffDiyRelaySwitchEntity =
            SonoffDiyRelaySwitchEntity(
          uniqueId: uniqueDeviceIdTemp,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: CbjEntityName(mDnsName),
          entityOriginalName: EntityOriginalName(mDnsName),
          deviceOriginalName: DeviceOriginalName(mDnsName),
          entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
          senderDeviceOs: DeviceSenderDeviceOs('SonoffDiy'),
          deviceVendor: DeviceVendor(null),
          deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
          senderDeviceModel: DeviceSenderDeviceModel('d1'),
          senderId: DeviceSenderId(),
          compUuid: DeviceCompUuid('34asdfrsd23gggg'),
          stateMassage: DeviceStateMassage('Hello World'),
          powerConsumption: DevicePowerConsumption('0'),
          devicePort: DevicePort(port),
          deviceHostName: DeviceHostName(mDnsName.toLowerCase()),
          deviceMdns: DeviceMdns(mDnsName),
          srvResourceRecord: DeviceSrvResourceRecord(),
          ptrResourceRecord: DevicePtrResourceRecord(),
          deviceLastKnownIp: DeviceLastKnownIp(ip),
          switchState: GenericSwitchSwitchState(false.toString()),
          deviceUniqueId: DeviceUniqueId('0'),
          devicesMacAddress: DevicesMacAddress('0'),
          entityKey: EntityKey('0'),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          deviceCbjUniqueId: CoreUniqueId(),
        );
        deviceEntityList.add(sonoffDiyRelaySwitchEntity);
      } else {
        icLogger.i('SonoffDiy device types is not supported');
      }
    } catch (e) {
      icLogger.e('Error setting SonoffDiy\n$e');
    }

    return deviceEntityList;
  }
}
