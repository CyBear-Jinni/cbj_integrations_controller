import 'package:cbj_integrations_controller/infrastructure/devices/lifx/lifx_white/lifx_white_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_value_objects.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LifxHelpers {
  static DeviceEntityAbstract? addDiscoveredDevice({
    required LIFXBulb lifxDevice,
    required CoreUniqueId? uniqueDeviceId,
  }) {
    CoreUniqueId uniqueDeviceIdTemp;

    if (uniqueDeviceId != null) {
      uniqueDeviceIdTemp = uniqueDeviceId;
    } else {
      uniqueDeviceIdTemp = CoreUniqueId();
    }
    final String deviceName =
        lifxDevice.label != '' ? lifxDevice.label : 'Lifx test 2';

    final LifxWhiteEntity lifxDE = LifxWhiteEntity(
      uniqueId: uniqueDeviceIdTemp,
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
      stateMassage: DeviceStateMassage('Hello World'),
      powerConsumption: DevicePowerConsumption('0'),
      lightSwitchState: GenericDimmableLightSwitchState(
        (lifxDevice.power == LIFXPower.on).toString(),
      ),
      deviceUniqueId: DeviceUniqueId('0'),
      devicePort: DevicePort('0'),
      deviceLastKnownIp: DeviceLastKnownIp('0'),
      deviceHostName: DeviceHostName('0'),
      deviceMdns: DeviceMdns('0'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('0'),
      entityKey: EntityKey('0'),
      requestTimeStamp: RequestTimeStamp('0'),
      lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
      deviceCbjUniqueId: CoreUniqueId(),
      lightBrightness:
          GenericDimmableLightBrightness.fromDouble(lifxDevice.brightness),
    );

    return lifxDE;

    // TODO: Add if device type does not supported return null
    // logger.i(
    //   'Please add new philips device type Bulb ${lifxDevice.label}',
    // );
    // return null;
  }
}
