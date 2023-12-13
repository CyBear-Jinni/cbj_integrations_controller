import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_1se/yeelight_1se_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_value_objects.dart';
import 'package:yeedart/yeedart.dart';

class YeelightHelpers {
  static DeviceEntityAbstract? addDiscoveredDevice({
    required DiscoveryResponse yeelightDevice,
    required DeviceEntityAbstract entity,
  }) {
    String deviceName;
    if (yeelightDevice.name != null && yeelightDevice.name != '') {
      deviceName = yeelightDevice.name!;
    } else if (entity.deviceMdns.getOrCrash() != null) {
      deviceName = entity.deviceMdns.getOrCrash()!;
    } else {
      deviceName = 'Yeelight device';
    }

    if (yeelightDevice.model == null) {
      return null;
    }

    final DeviceEntityAbstract deviceEntity;

    if (yeelightDevice.model == 'color4') {
      deviceEntity = Yeelight1SeEntity(
        uniqueId: entity.uniqueId,
        entityUniqueId: EntityUniqueId(yeelightDevice.id.toString()),
        cbjEntityName: CbjEntityName(deviceName),
        entityOriginalName: EntityOriginalName(deviceName),
        deviceOriginalName: DeviceOriginalName(deviceName),
        entityStateGRPC: entity.entityStateGRPC,
        senderDeviceOs: entity.senderDeviceOs,
        senderDeviceModel: entity.senderDeviceModel,
        senderId: entity.senderId,
        compUuid: entity.compUuid,
        deviceMdns: entity.deviceMdns,
        srvResourceRecord: entity.srvResourceRecord,
        ptrResourceRecord: entity.ptrResourceRecord,
        deviceLastKnownIp: DeviceLastKnownIp(yeelightDevice.address.address),
        stateMassage: entity.stateMassage,
        powerConsumption: entity.powerConsumption,
        devicePort: DevicePort(yeelightDevice.port.toString()),
        deviceUniqueId: entity.deviceUniqueId,
        deviceHostName: entity.deviceHostName,
        devicesMacAddress: entity.devicesMacAddress,
        entityKey: entity.entityKey,
        requestTimeStamp: entity.requestTimeStamp,
        lastResponseFromDeviceTimeStamp: entity.lastResponseFromDeviceTimeStamp,
        deviceCbjUniqueId:
            CoreUniqueId.fromUniqueString(yeelightDevice.id.toString()),
        lightSwitchState:
            GenericRgbwLightSwitchState(yeelightDevice.powered.toString()),
        lightColorTemperature: GenericRgbwLightColorTemperature(
          yeelightDevice.colorTemperature.toString(),
        ),
        lightBrightness:
            GenericRgbwLightBrightness(yeelightDevice.brightness.toString()),
        lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
        lightColorHue: GenericRgbwLightColorHue(yeelightDevice.hue.toString()),
        lightColorSaturation: GenericRgbwLightColorSaturation(
          yeelightDevice.sat.toString(),
        ),
        lightColorValue: GenericRgbwLightColorValue('1.0'),
      );
    } else {
      icLogger.i(
        'Please add new Yeelight device type ${yeelightDevice.model}',
      );
      return null;
    }

    return deviceEntity;
  }
}
