import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/tuya_device_abstract.dart';

class TuyaLight extends TuyaDeviceAbstract {
  TuyaLight({
    required super.name,
    required super.icon,
    required super.id,
    required super.devType,
    required super.haType,
    required super.online,
    required super.state,
    required this.brightness,
    required this.colorMode,
    required this.colorTemp,
  });

  factory TuyaLight.fromInternalLinkedHashMap(dynamic deviceHashMap) {
    return TuyaLight(
      name: deviceHashMap['name'] as String,
      icon: deviceHashMap['icon'] as String,
      id: deviceHashMap['id'] as String,
      devType: deviceHashMap['dev_type'] as String,
      haType: deviceHashMap['ha_type'] as String,
      brightness: int.parse(deviceHashMap['data']['brightness'] as String),
      colorMode: deviceHashMap['data']['color_mode'] as String,
      online: deviceHashMap['data']['online'] as bool,
      state: deviceHashMap['data']['state'] == 'true',
      colorTemp: deviceHashMap['data']['color_temp'] as int,
    );
  }

  int brightness;
  String colorMode;
  int colorTemp;
}
