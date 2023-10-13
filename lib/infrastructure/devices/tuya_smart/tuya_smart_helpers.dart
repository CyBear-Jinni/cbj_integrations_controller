import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_jbt_a70_rgbcw_wf/tuya_smart_jbt_a70_rgbcw_wf_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_plug/tuya_smart_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/cloudtuya.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/tuya_device_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/tuya_light.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/tuya_switch.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_switch/tuya_smart_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_plug_device/generic_smart_plug_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_value_objects.dart';
import 'package:cbj_integrations_controller/utils.dart';

class TuyaSmartHelpers {
  static DeviceEntityAbstract? addDiscoverdDevice({
    required TuyaDeviceAbstract tuyaSmartDevice,
    required CloudTuya cloudTuyaOrSmartLifeOrJinvooSmart,
    required CoreUniqueId? uniqueDeviceId,
  }) {
    CoreUniqueId uniqueDeviceIdTemp;

    if (uniqueDeviceId != null) {
      uniqueDeviceIdTemp = uniqueDeviceId;
    } else {
      uniqueDeviceIdTemp = CoreUniqueId();
    }

    DeviceEntityAbstract tuyaSmartDE;

    if (tuyaSmartDevice is TuyaLight) {
      final String deviceName = tuyaSmartDevice.name != ''
          ? tuyaSmartDevice.name
          : 'TuyaSmart test 2';
      tuyaSmartDE = TuyaSmartJbtA70RgbcwWfEntity(
        uniqueId: uniqueDeviceIdTemp,
        entityUniqueId: EntityUniqueId(tuyaSmartDevice.id),
        cbjEntityName: CbjEntityName(deviceName),
        entityOriginalName: EntityOriginalName(deviceName),
        deviceOriginalName: DeviceOriginalName(deviceName),
        entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
        senderDeviceOs: DeviceSenderDeviceOs('tuya_smart'),
        senderDeviceModel: DeviceSenderDeviceModel('1SE'),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid('34asdfrsd23gggg'),
        stateMassage: DeviceStateMassage('Hello World'),
        powerConsumption: DevicePowerConsumption('0'),
        deviceCbjUniqueId: CoreUniqueId(),
        lightSwitchState:
            GenericRgbwLightSwitchState(tuyaSmartDevice.state.toString()),
        lightColorTemperature: GenericRgbwLightColorTemperature(
          tuyaSmartDevice.colorTemp.toString(),
        ),
        lightBrightness:
            GenericRgbwLightBrightness(tuyaSmartDevice.brightness.toString()),
        lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
        lightColorHue: GenericRgbwLightColorHue('0.0'),
        lightColorSaturation: GenericRgbwLightColorSaturation('1.0'),
        lightColorValue: GenericRgbwLightColorValue('1.0'),
        cloudTuya: cloudTuyaOrSmartLifeOrJinvooSmart,
        deviceUniqueId: DeviceUniqueId('0'),
        devicePort: DevicePort('0'),
        deviceLastKnownIp: DeviceLastKnownIp('0'),
        deviceHostName: DeviceHostName('0'),
        deviceMdns: DeviceMdns('0'),
        devicesMacAddress: DevicesMacAddress('0'),
        entityKey: EntityKey('0'),
        requestTimeStamp: RequestTimeStamp('0'),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
      );
    } else if (tuyaSmartDevice is TuyaSwitch &&
        (tuyaSmartDevice.icon ==
                'https://images.tuyaeu.com/smart/solution/134001/66ba22c327bfbf3d_cover.png' ||
            tuyaSmartDevice.icon ==
                'https://images.tuyaus.com/smart/solution/134001/66ba22c327bfbf3d_cover.png' ||
            tuyaSmartDevice.icon ==
                'https://images.tuyaeu.com/smart/icon/ay15422864509092y6k8/1622259081104c41dc2b7.png' ||
            tuyaSmartDevice.icon ==
                'https://images.tuyaus.com/smart/icon/ay15422864509092y6k8/1622259081104c41dc2b7.png')) {
      final String deviceName = tuyaSmartDevice.name != ''
          ? tuyaSmartDevice.name
          : 'TuyaSmart test 2';

      /// Spacial cases to differentiate smart plug from regular switch

      tuyaSmartDE = TuyaSmartPlugEntity(
        uniqueId: uniqueDeviceIdTemp,
        entityUniqueId: EntityUniqueId(tuyaSmartDevice.id),
        cbjEntityName: CbjEntityName(deviceName),
        entityOriginalName: EntityOriginalName(deviceName),
        deviceOriginalName: DeviceOriginalName(deviceName),
        entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
        senderDeviceOs: DeviceSenderDeviceOs('tuya_smart'),
        senderDeviceModel: DeviceSenderDeviceModel('Cloud'),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid('34asdfrsd23gggg'),
        stateMassage: DeviceStateMassage('Hello World'),
        powerConsumption: DevicePowerConsumption('0'),
        smartPlugState: GenericSmartPlugState(tuyaSmartDevice.state.toString()),
        cloudTuya: cloudTuyaOrSmartLifeOrJinvooSmart,
        deviceUniqueId: DeviceUniqueId('0'),
        devicePort: DevicePort('0'),
        deviceLastKnownIp: DeviceLastKnownIp('0'),
        deviceHostName: DeviceHostName('0'),
        deviceMdns: DeviceMdns('0'),
        devicesMacAddress: DevicesMacAddress('0'),
        entityKey: EntityKey('0'),
        requestTimeStamp: RequestTimeStamp('0'),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
        deviceCbjUniqueId: CoreUniqueId(),
      );
    } else if (tuyaSmartDevice is TuyaSwitch) {
      final String deviceName = tuyaSmartDevice.name != ''
          ? tuyaSmartDevice.name
          : 'TuyaSmart test 2';

      tuyaSmartDE = TuyaSmartSwitchEntity(
        uniqueId: uniqueDeviceIdTemp,
        entityUniqueId: EntityUniqueId(tuyaSmartDevice.id),
        cbjEntityName: CbjEntityName(deviceName),
        entityOriginalName: EntityOriginalName(deviceName),
        deviceOriginalName: DeviceOriginalName(deviceName),
        entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
        senderDeviceOs: DeviceSenderDeviceOs('tuya_smart'),
        senderDeviceModel: DeviceSenderDeviceModel('Cloud'),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid('34asdfrsd23gggg'),
        stateMassage: DeviceStateMassage('Hello World'),
        powerConsumption: DevicePowerConsumption('0'),
        switchState: GenericSwitchSwitchState(tuyaSmartDevice.state.toString()),
        cloudTuya: cloudTuyaOrSmartLifeOrJinvooSmart,
        deviceUniqueId: DeviceUniqueId('0'),
        devicePort: DevicePort('0'),
        deviceLastKnownIp: DeviceLastKnownIp('0'),
        deviceHostName: DeviceHostName('0'),
        deviceMdns: DeviceMdns('0'),
        devicesMacAddress: DevicesMacAddress('0'),
        entityKey: EntityKey('0'),
        requestTimeStamp: RequestTimeStamp('0'),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
        deviceCbjUniqueId: CoreUniqueId(),
      );
    } else {
      logger.i(
        'Please add new Tuya device type ${tuyaSmartDevice.haType} ${tuyaSmartDevice.haType}',
      );
      return null;
    }
    return tuyaSmartDE;
  }
}
