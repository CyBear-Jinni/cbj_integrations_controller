import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_device_validators.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:dartz/dartz.dart';

/// TuyaSmart communication port
class TuyaSmartPort extends ValueObjectCore<String> {
  factory TuyaSmartPort(String? input) {
    assert(input != null);
    return TuyaSmartPort._(
      validateTuyaSmartPortNotEmpty(input!),
    );
  }

  const TuyaSmartPort._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
