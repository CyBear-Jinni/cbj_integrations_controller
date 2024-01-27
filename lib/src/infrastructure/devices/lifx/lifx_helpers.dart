import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_white/lifx_white_entity.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LifxHelpers {
  static HashMap<String, DeviceEntityBase> addDiscoveredDevice(
    LIFXBulb lifxDevice,
  ) {
    final String deviceName =
        lifxDevice.label != '' ? lifxDevice.label : 'Lifx test 2';

    final LifxWhiteEntity lifxDE = LifxWhiteEntity(
      uniqueId: CoreUniqueId(),
      entityUniqueId: EntityUniqueId(lifxDevice.id),
      cbjEntityName: CbjEntityName(deviceName),
      entityOriginalName: EntityOriginalName(deviceName),
      deviceOriginalName: DeviceOriginalName(deviceName),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      senderDeviceOs: DeviceSenderDeviceOs('Lifx'),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      senderDeviceModel: DeviceSenderDeviceModel('Cloud'),
      senderId: DeviceSenderId(),
      compUuid: DeviceCompUuid(lifxDevice.uuid),
      stateMassage: DeviceStateMassage(''),
      powerConsumption: DevicePowerConsumption(''),
      lightSwitchState: GenericDimmableLightSwitchState(
        LIFXPower.on.name,
      ),
      deviceUniqueId: DeviceUniqueId(lifxDevice.id),
      devicePort: DevicePort(''),
      deviceLastKnownIp: DeviceLastKnownIp(''),
      deviceHostName: DeviceHostName(''),
      deviceMdns: DeviceMdns(''),
      srvResourceRecord: DeviceSrvResourceRecord(),
      srvTarget: DeviceSrvTarget(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      mdnsServiceType: DevicemdnsServiceType(),
      devicesMacAddress: DevicesMacAddress(''),
      entityKey: EntityKey(''),
      requestTimeStamp: RequestTimeStamp(''),
      lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
      deviceCbjUniqueId: CoreUniqueId(),
      lightBrightness:
          GenericDimmableLightBrightness.fromDouble(lifxDevice.brightness),
    );

    final HashMap<String, DeviceEntityBase> convertedEntites = HashMap();

    return convertedEntites
      ..addEntries([MapEntry(lifxDE.getCbjDeviceId, lifxDE)]);

    // TODO: Add if device type does not supported return null
    // logger.i(
    //   'Please add new philips device type Bulb ${lifxDevice.label}',
    // );
    // return null;
  }
}
