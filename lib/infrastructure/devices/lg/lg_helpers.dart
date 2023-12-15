import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';

class LgHelpers {
  static List<DeviceEntityAbstract> addDiscoveredDevice(
    DeviceEntityAbstract entity,
  ) {
    return [];
    // TODO: Add minimal LG TV api
    // CoreUniqueId uniqueDeviceIdTemp;
    //
    // if (uniqueDeviceId != null) {
    //   uniqueDeviceIdTemp = uniqueDeviceId;
    // } else {
    //   uniqueDeviceIdTemp = CoreUniqueId();
    // }
    //
    // final LgWebosTvEntity lgDE = LgWebosTvEntity(
    //   uniqueId: uniqueDeviceIdTemp,
    //   entityUniqueId: EntityUniqueId.fromUniqueString(mDnsName),
    //   cbjEntityName: CbjEntityName('LG TV'),
    //   entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
    //   senderDeviceOs: DeviceSenderDeviceOs('WebOs'),
    //   senderDeviceModel: DeviceSenderDeviceModel('UP7550PVG'),
    //   senderId: DeviceSenderId(),
    //   compUuid: DeviceCompUuid('34asdfrsd23gggg'),
    //   deviceMdnsName: DeviceMdnsName(mDnsName),
    //   lastKnownIp: DeviceLastKnownIp(ip),
    //   stateMassage: DeviceStateMassage('Hello World'),
    //   powerConsumption: DevicePowerConsumption('0'),
    //   port: DevicePort(port),
    //   smartTvSwitchState: GenericSmartTvSwitchState(
    //     EntityActions.actionNotSupported.toString(),
    //   ),
    // );
    //
    // return [lgDE];
  }
}
