import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_device_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_led/tasmota_mqtt_led_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:mqtt_client/mqtt_client.dart';

class TasmotaMqttHelpers {
  static DeviceEntityAbstract? addDiscoveredDevice({
    required MapEntry<String, dynamic> deviceChangeFromMqtt,
    required CoreUniqueId? uniqueDeviceId,
  }) {
    CoreUniqueId uniqueDeviceIdTemp;

    if (uniqueDeviceId != null) {
      uniqueDeviceIdTemp = uniqueDeviceId;
    } else {
      uniqueDeviceIdTemp = CoreUniqueId();
    }

    final List<String> topicsSplitted = deviceChangeFromMqtt.key.split('/');
    if (topicsSplitted.length < 3 || topicsSplitted[3] != 'config') {
      return null;
    }

    final String pt = MqttPublishPayload.bytesToStringAsString(
      (deviceChangeFromMqtt.value as MqttPublishMessage).payload.message,
    ).replaceAll('\n', '');

    /// mac = Mac address of the device
    final String? mac = getValueFromMqttResult(pt, 'mac');

    /// Check if this is result full of info and not just response for action
    if (mac == null) {
      return null;
    }

    /// t = mqtt topic of device
    final String deviceTopic = getValueFromMqttResult(pt, '"t"')!;

    /// state = List of all the device supported states
    final String supportedStatesOfDevice = getValueFromMqttResult(pt, 'state')!;

    /// dn = Device Name (Tasmotac)
    final String name = getValueFromMqttResult(pt, 'dn')!;

    const EntityActions deviceActions = EntityActions.actionNotSupported;

    if (supportedStatesOfDevice.contains('ON') &&
        supportedStatesOfDevice.contains('OFF')) {
      return TasmotaMqttLedEntity(
        uniqueId: uniqueDeviceIdTemp,
        entityUniqueId: EntityUniqueId(mac),
        cbjEntityName: CbjEntityName(name),
        entityOriginalName: EntityOriginalName(name),
        deviceOriginalName: DeviceOriginalName(name),
        entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
        senderDeviceOs: DeviceSenderDeviceOs('TasmotaMqtt'),
        deviceVendor: DeviceVendor(null),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
        senderDeviceModel: DeviceSenderDeviceModel('LED'),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid(mac),
        stateMassage: DeviceStateMassage('Hello World'),
        powerConsumption: DevicePowerConsumption('0'),
        lightSwitchState: GenericLightSwitchState(deviceActions.toString()),
        tasmotaMqttDeviceTopicName: TasmotaMqttDeviceTopicName(deviceTopic),
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
      );
    }

    icLogger.i(
      'Please add new Tasmota Mqtt device type $topicsSplitted',
    );
    return null;
  }

  static String? getValueFromMqttResult(String result, String valueName) {
    String value;
    try {
      value = result.substring(result.indexOf(valueName));
      value = value.substring(value.indexOf(':') + 2);
      value = value.substring(0, value.indexOf(':') - 1);
      if (value.contains(']')) {
        value = value.substring(0, value.indexOf(']'));
      } else {
        value = value.substring(0, value.indexOf(',') - 1);
      }
    } catch (e) {
      return null;
    }
    return value;
  }
}
