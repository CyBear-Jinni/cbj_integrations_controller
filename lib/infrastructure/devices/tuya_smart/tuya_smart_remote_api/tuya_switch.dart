import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_remote_api/tuya_device_abstract.dart';

class TuyaSwitch extends TuyaDeviceAbstract {
  TuyaSwitch({
    required super.name,
    required super.icon,
    required super.id,
    required super.devType,
    required super.haType,
    required super.online,
    required super.state,
  });

  factory TuyaSwitch.fromInternalLinkedHashMap(dynamic deviceHashMap) {
    return TuyaSwitch(
      name: deviceHashMap['name'] as String,
      icon: deviceHashMap['icon'] as String,
      id: deviceHashMap['id'] as String,
      devType: deviceHashMap['dev_type'] as String,
      haType: deviceHashMap['ha_type'] as String,
      online: deviceHashMap['data']['online'] as bool,
      state: deviceHashMap['data']['state'] == 'true',
    );
  }
}
