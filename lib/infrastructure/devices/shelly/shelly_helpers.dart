import 'dart:convert';

import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_light/shelly_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_relay_switch/shelly_relay_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_value_objects.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:color/color.dart';
import 'package:shelly/shelly.dart';

class ShellyHelpers {
  static Future<List<DeviceEntityAbstract>> addDiscoverdDevice({
    required String mDnsName,
    required String? port,
    required String ip,
    required CoreUniqueId? uniqueDeviceId,
  }) async {
    CoreUniqueId uniqueDeviceIdTemp;

    if (uniqueDeviceId != null) {
      uniqueDeviceIdTemp = uniqueDeviceId;
    } else {
      uniqueDeviceIdTemp = CoreUniqueId();
    }
    final List<DeviceEntityAbstract> deviceEntityList = [];

    try {
      // TODO: shelly duo bulb needs type that as the time of writing is
      // not supported, bulb + brightness + white temperature (not rgb).
      // Lets create new type and add it.
      if (mDnsName.contains('colorbulb')) {
        final ShellyApiColorBulb shellyApiDeviceAbstract = ShellyApiColorBulb(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: uniqueDeviceIdTemp.getOrCrash(),
        );

        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        final String mac = responseAsJson['mac'] as String;

        final dynamic bulbLightProp = responseAsJson['lights'][0];

        final String bulbMod = bulbLightProp['mode'] as String;
        shellyApiDeviceAbstract.bulbMode =
            bulbMod == 'color' ? ShellyBulbMode.colore : ShellyBulbMode.white;

        final int brightness = bulbLightProp['brightness'] as int;
        final int gain =
            bulbLightProp['gain'] as int; // Brightness for color mod
        final int currentBrightness =
            shellyApiDeviceAbstract.bulbMode == ShellyBulbMode.colore
                ? gain
                : brightness;
        final int temp = bulbLightProp['temp'] as int;

        final int red = bulbLightProp['red'] as int;
        final int green = bulbLightProp['green'] as int;
        final int blue = bulbLightProp['blue'] as int;

        final RgbColor rgbColor = RgbColor(red, green, blue);
        final HsvColor hsvColor = rgbColor.toHsvColor();

        final bool isOn = bulbLightProp['ison'] as bool;

        final ShellyColorLightEntity shellyColorLightEntity =
            ShellyColorLightEntity(
          uniqueId: uniqueDeviceIdTemp,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: CbjEntityName(mDnsName),
          entityOriginalName: EntityOriginalName(mDnsName),
          deviceOriginalName: DeviceOriginalName(mDnsName),
          entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
          senderDeviceOs: DeviceSenderDeviceOs('Shelly'),
          senderDeviceModel: DeviceSenderDeviceModel('d1'),
          senderId: DeviceSenderId(),
          compUuid: DeviceCompUuid(mac),
          stateMassage: DeviceStateMassage('Hello World'),
          powerConsumption: DevicePowerConsumption('0'),
          lightSwitchState: GenericRgbwLightSwitchState(isOn ? 'on' : 'off'),
          lightColorTemperature:
              GenericRgbwLightColorTemperature(temp.toString()),
          lightBrightness:
              GenericRgbwLightBrightness(currentBrightness.toString()),
          lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
          lightColorHue: GenericRgbwLightColorHue(hsvColor.h.toString()),
          lightColorSaturation:
              GenericRgbwLightColorSaturation(hsvColor.s.toString()),
          lightColorValue: GenericRgbwLightColorValue(hsvColor.v.toString()),
          devicePort: DevicePort(port),
          deviceHostName: DeviceHostName(mDnsName.toLowerCase()),
          deviceMdns: DeviceMdns(mDnsName),
          deviceLastKnownIp: DeviceLastKnownIp(ip),
          bulbMode: shellyApiDeviceAbstract,
          deviceUniqueId: DeviceUniqueId('0'),
          devicesMacAddress: DevicesMacAddress('0'),
          entityKey: EntityKey('0'),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          deviceCbjUniqueId: CoreUniqueId(),
        );
        deviceEntityList.add(shellyColorLightEntity);
      } else if (mDnsName.contains('BulbDuo')) {
        final ShellyApiColorBulb shellyApiDeviceAbstract = ShellyApiColorBulb(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: uniqueDeviceIdTemp.getOrCrash(),
        );

        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        final String mac = responseAsJson['mac'] as String;

        final dynamic bulbLightProp = responseAsJson['lights'][0];

        shellyApiDeviceAbstract.bulbMode = ShellyBulbMode.white;

        final int brightness = bulbLightProp['brightness'] as int;

        final int currentBrightness = brightness;

        final int temp = bulbLightProp['temp'] as int;

        final bool isOn = bulbLightProp['ison'] as bool;

        final ShellyColorLightEntity shellyColorLightEntity =
            ShellyColorLightEntity(
          uniqueId: uniqueDeviceIdTemp,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: CbjEntityName(mDnsName),
          entityOriginalName: EntityOriginalName(mDnsName),
          deviceOriginalName: DeviceOriginalName(mDnsName),
          entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
          senderDeviceOs: DeviceSenderDeviceOs('Shelly'),
          senderDeviceModel: DeviceSenderDeviceModel('d1'),
          senderId: DeviceSenderId(),
          compUuid: DeviceCompUuid(mac),
          stateMassage: DeviceStateMassage('Hello World'),
          powerConsumption: DevicePowerConsumption('0'),
          lightSwitchState: GenericRgbwLightSwitchState(isOn ? 'on' : 'off'),
          lightColorTemperature:
              GenericRgbwLightColorTemperature(temp.toString()),
          lightBrightness:
              GenericRgbwLightBrightness(currentBrightness.toString()),
          lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
          lightColorHue: GenericRgbwLightColorHue('0'),
          lightColorSaturation: GenericRgbwLightColorSaturation('0'),
          lightColorValue: GenericRgbwLightColorValue('0'),
          devicePort: DevicePort(port),
          deviceHostName: DeviceHostName(mDnsName.toLowerCase()),
          deviceMdns: DeviceMdns(mDnsName),
          deviceLastKnownIp: DeviceLastKnownIp(ip),
          bulbMode: shellyApiDeviceAbstract,
          deviceUniqueId: DeviceUniqueId('0'),
          devicesMacAddress: DevicesMacAddress('0'),
          entityKey: EntityKey('0'),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          deviceCbjUniqueId: CoreUniqueId(),
        );
        deviceEntityList.add(shellyColorLightEntity);
      } else if (mDnsName.contains('shelly1-C45BBE78005D')) {
        final ShellyRelaySwitchEntity shellyRelaySwitchEntity =
            ShellyRelaySwitchEntity(
          uniqueId: uniqueDeviceIdTemp,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: CbjEntityName(mDnsName),
          entityOriginalName: EntityOriginalName(mDnsName),
          deviceOriginalName: DeviceOriginalName(mDnsName),
          entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
          senderDeviceOs: DeviceSenderDeviceOs('Shelly'),
          senderDeviceModel: DeviceSenderDeviceModel('d1'),
          senderId: DeviceSenderId(),
          compUuid: DeviceCompUuid('34asdfrsd23gggg'),
          stateMassage: DeviceStateMassage('Hello World'),
          powerConsumption: DevicePowerConsumption('0'),
          devicePort: DevicePort(port),
          deviceHostName: DeviceHostName(mDnsName.toLowerCase()),
          deviceMdns: DeviceMdns(mDnsName),
          deviceLastKnownIp: DeviceLastKnownIp(ip),
          switchState: GenericSwitchSwitchState(false.toString()),
          deviceUniqueId: DeviceUniqueId('0'),
          devicesMacAddress: DevicesMacAddress('0'),
          entityKey: EntityKey('0'),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          deviceCbjUniqueId: CoreUniqueId(),
        );
        deviceEntityList.add(shellyRelaySwitchEntity);
      } else {
        logger.i('Shelly device types is not supported');
      }
    } catch (e) {
      logger.e('Error setting shelly\n$e');
    }

    return deviceEntityList;
  }
}
