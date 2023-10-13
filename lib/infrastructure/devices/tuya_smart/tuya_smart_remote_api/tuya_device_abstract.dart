import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/tuya_light.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/tuya_switch.dart';

abstract class TuyaDeviceAbstract {
  TuyaDeviceAbstract({
    required this.name,
    required this.icon,
    required this.id,
    required this.devType,
    required this.haType,
    required this.online,
    required this.state,
  });

  factory TuyaDeviceAbstract.fromInternalLinkedHashMap(dynamic deviceHashMap) {
    final String haDeviceTypeString = deviceHashMap['ha_type'] as String;
    if (haDeviceTypeString == 'light') {
      return TuyaLight.fromInternalLinkedHashMap(deviceHashMap);
    } else if (haDeviceTypeString == 'switch') {
      return TuyaSwitch.fromInternalLinkedHashMap(deviceHashMap);
    }
    throw 'Device type $haDeviceTypeString does not exist';
  }

  String name;
  String icon;
  String id;
  String devType;
  String haType;
  bool online;
  bool state;
}
