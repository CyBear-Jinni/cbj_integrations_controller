import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_1se/yeelight_1se_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:yeedart/yeedart.dart';

class YeelightHelpers {
  static HashMap<String, DeviceEntityBase> addDiscoveredDevice({
    required DiscoveryResponse yeelightDevice,
    required DeviceEntityBase entity,
  }) {
    final HashMap<String, DeviceEntityBase> entitiesMap = HashMap();

    String deviceName;
    if (yeelightDevice.name != null && yeelightDevice.name!.isNotEmpty) {
      deviceName = yeelightDevice.name!;
    } else if (entity.deviceMdns.getOrCrash() != null &&
        entity.deviceMdns.getOrCrash()!.isNotEmpty) {
      deviceName = entity.deviceMdns.getOrCrash()!;
    } else {
      deviceName = 'Yeelight device';
    }

    if (yeelightDevice.model == null) {
      return entitiesMap;
    }

    final String deviceCbjUniqueId = yeelightDevice.id.toString();

    if (yeelightDevice.model == 'color4' || yeelightDevice.model == 'colora') {
      final DeviceEntityBase newEntity = Yeelight1SeEntity(
        uniqueId: entity.uniqueId,
        entityUniqueId: EntityUniqueId(yeelightDevice.id.toString()),
        cbjEntityName: CbjEntityName(deviceName),
        entityOriginalName: EntityOriginalName(deviceName),
        deviceOriginalName: DeviceOriginalName(deviceName),
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
        deviceCbjUniqueId: CoreUniqueId.fromUniqueString(deviceCbjUniqueId),
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
      entitiesMap.addEntries([MapEntry(deviceCbjUniqueId, newEntity)]);
    } else {
      icLogger.i(
        'Please add new Yeelight device type ${yeelightDevice.model}',
      );
    }

    return entitiesMap;
  }
}
