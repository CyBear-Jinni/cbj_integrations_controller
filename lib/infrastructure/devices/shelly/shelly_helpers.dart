import 'dart:convert';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_light/shelly_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_relay_switch/shelly_relay_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_value_objects.dart';
import 'package:color/color.dart';
import 'package:shelly/shelly.dart';

class ShellyHelpers {
  static Future<List<DeviceEntityAbstract>> addDiscoveredDevice(
    DeviceEntityAbstract entity,
  ) async {
    final List<DeviceEntityAbstract> deviceEntityList = [];
    final String ip = entity.deviceLastKnownIp.getOrCrash()!;
    final String mDnsName = entity.deviceMdns.getOrCrash()!;
    final String hostName = entity.deviceHostName.getOrCrash();

    try {
      // TODO: shelly duo bulb needs type that as the time of writing is
      // not supported, bulb + brightness + white temperature (not rgb).
      // Lets create new type and add it.
      if (entity.deviceMdns.getOrCrash()!.contains('colorbulb')) {
        final ShellyApiColorBulb shellyApiDeviceAbstract = ShellyApiColorBulb(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: hostName,
        );

        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        // ignore: avoid_dynamic_calls
        final String mac = responseAsJson['mac'] as String;
        // ignore: avoid_dynamic_calls
        final dynamic bulbLightProp = responseAsJson['lights'][0];
        // ignore: avoid_dynamic_calls
        final String bulbMod = bulbLightProp['mode'] as String;
        shellyApiDeviceAbstract.bulbMode =
            bulbMod == 'color' ? ShellyBulbMode.colore : ShellyBulbMode.white;
        // ignore: avoid_dynamic_calls
        final int brightness = bulbLightProp['brightness'] as int;
        final int gain =
            // ignore: avoid_dynamic_calls
            bulbLightProp['gain'] as int; // Brightness for color mod
        final int currentBrightness =
            shellyApiDeviceAbstract.bulbMode == ShellyBulbMode.colore
                ? gain
                : brightness;
        // ignore: avoid_dynamic_calls
        final int temp = bulbLightProp['temp'] as int;
        // ignore: avoid_dynamic_calls
        final int red = bulbLightProp['red'] as int;
        // ignore: avoid_dynamic_calls
        final int green = bulbLightProp['green'] as int;
        // ignore: avoid_dynamic_calls
        final int blue = bulbLightProp['blue'] as int;

        final RgbColor rgbColor = RgbColor(red, green, blue);
        final HsvColor hsvColor = rgbColor.toHsvColor();

        // ignore: avoid_dynamic_calls
        final bool isOn = bulbLightProp['ison'] as bool;

        final ShellyColorLightEntity shellyColorLightEntity =
            ShellyColorLightEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: entity.entityOriginalName,
          deviceOriginalName: entity.deviceOriginalName,
          entityStateGRPC: entity.entityStateGRPC,
          senderDeviceOs: entity.senderDeviceOs,
          deviceVendor: entity.deviceVendor,
          deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
          senderDeviceModel: entity.senderDeviceModel,
          senderId: entity.senderId,
          compUuid: entity.compUuid,
          deviceMdns: entity.deviceMdns,
          srvResourceRecord: entity.srvResourceRecord,
          ptrResourceRecord: entity.ptrResourceRecord,
          deviceLastKnownIp: entity.deviceLastKnownIp,
          stateMassage: entity.stateMassage,
          powerConsumption: entity.powerConsumption,
          devicePort: entity.devicePort,
          deviceUniqueId: entity.deviceUniqueId,
          deviceHostName: entity.deviceHostName,
          devicesMacAddress: DevicesMacAddress(mac),
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          deviceCbjUniqueId: CoreUniqueId.fromUniqueString(mDnsName),
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
          bulbMode: shellyApiDeviceAbstract,
        );
        deviceEntityList.add(shellyColorLightEntity);
      } else if (mDnsName.contains('BulbDuo')) {
        final ShellyApiColorBulb shellyApiDeviceAbstract = ShellyApiColorBulb(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: hostName,
        );

        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        // ignore: avoid_dynamic_calls
        final String mac = responseAsJson['mac'] as String;

        // ignore: avoid_dynamic_calls
        final dynamic bulbLightProp = responseAsJson['lights'][0];

        shellyApiDeviceAbstract.bulbMode = ShellyBulbMode.white;

        // ignore: avoid_dynamic_calls
        final int brightness = bulbLightProp['brightness'] as int;

        final int currentBrightness = brightness;

        // ignore: avoid_dynamic_calls
        final int temp = bulbLightProp['temp'] as int;

        // ignore: avoid_dynamic_calls
        final bool isOn = bulbLightProp['ison'] as bool;

        final ShellyColorLightEntity shellyColorLightEntity =
            ShellyColorLightEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: entity.entityOriginalName,
          deviceOriginalName: entity.deviceOriginalName,
          entityStateGRPC: entity.entityStateGRPC,
          senderDeviceOs: entity.senderDeviceOs,
          deviceVendor: entity.deviceVendor,
          deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
          senderDeviceModel: entity.senderDeviceModel,
          senderId: entity.senderId,
          compUuid: entity.compUuid,
          deviceMdns: entity.deviceMdns,
          srvResourceRecord: entity.srvResourceRecord,
          ptrResourceRecord: entity.ptrResourceRecord,
          deviceLastKnownIp: entity.deviceLastKnownIp,
          stateMassage: entity.stateMassage,
          powerConsumption: entity.powerConsumption,
          devicePort: entity.devicePort,
          deviceUniqueId: entity.deviceUniqueId,
          deviceHostName: entity.deviceHostName,
          devicesMacAddress: DevicesMacAddress(mac),
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          deviceCbjUniqueId: CoreUniqueId.fromUniqueString(mDnsName),
          lightSwitchState: GenericRgbwLightSwitchState(isOn ? 'on' : 'off'),
          lightColorTemperature:
              GenericRgbwLightColorTemperature(temp.toString()),
          lightBrightness:
              GenericRgbwLightBrightness(currentBrightness.toString()),
          lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
          lightColorHue: GenericRgbwLightColorHue('0'),
          lightColorSaturation: GenericRgbwLightColorSaturation('0'),
          lightColorValue: GenericRgbwLightColorValue('0'),
          bulbMode: shellyApiDeviceAbstract,
        );
        deviceEntityList.add(shellyColorLightEntity);
      } else if (mDnsName.contains('shelly1-C45BBE78005D')) {
        final ShellyApiRelaySwitch shellyApiDeviceAbstract =
            ShellyApiRelaySwitch(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: hostName,
        );
        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        // ignore: avoid_dynamic_calls
        final String mac = responseAsJson['mac'] as String;

        final ShellyRelaySwitchEntity shellyRelaySwitchEntity =
            ShellyRelaySwitchEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: entity.entityOriginalName,
          deviceOriginalName: entity.deviceOriginalName,
          entityStateGRPC: entity.entityStateGRPC,
          senderDeviceOs: entity.senderDeviceOs,
          deviceVendor: entity.deviceVendor,
          deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
          senderDeviceModel: entity.senderDeviceModel,
          senderId: entity.senderId,
          compUuid: entity.compUuid,
          deviceMdns: entity.deviceMdns,
          srvResourceRecord: entity.srvResourceRecord,
          ptrResourceRecord: entity.ptrResourceRecord,
          deviceLastKnownIp: entity.deviceLastKnownIp,
          stateMassage: entity.stateMassage,
          powerConsumption: entity.powerConsumption,
          devicePort: entity.devicePort,
          deviceUniqueId: entity.deviceUniqueId,
          deviceHostName: entity.deviceHostName,
          devicesMacAddress: DevicesMacAddress(mac),
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          deviceCbjUniqueId: CoreUniqueId.fromUniqueString(mDnsName),
          switchState: GenericSwitchSwitchState(false.toString()),
        );
        deviceEntityList.add(shellyRelaySwitchEntity);
      } else {
        icLogger.i('Shelly device types is not supported');
      }
    } catch (e) {
      icLogger.e('Error setting shelly\n$e');
    }

    return deviceEntityList;
  }
}
