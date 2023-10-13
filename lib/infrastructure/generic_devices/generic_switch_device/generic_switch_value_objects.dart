import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSwitchSwitchState extends ValueObjectCore<String> {
  factory GenericSwitchSwitchState(String? input) {
    assert(input != null);
    return GenericSwitchSwitchState._(
      validateGenericSwitchStateNotEmpty(input!),
    );
  }

  const GenericSwitchSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of smart switch state
  static List<String> smartSwitchValidActions() {
    return smartSwitchAllValidActions();
  }
}
