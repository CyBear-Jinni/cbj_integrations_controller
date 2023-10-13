import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_computer_device/generic_smart_computer_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSmartComputerSuspendState extends ValueObjectCore<String> {
  factory GenericSmartComputerSuspendState(String? input) {
    assert(input != null);
    return GenericSmartComputerSuspendState._(
      validateGenericSmartComputerStateNotEmpty(input!),
    );
  }

  const GenericSmartComputerSuspendState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> smartComputerValidActions() {
    return smartComputerAllValidActions();
  }
}

class GenericSmartComputerShutdownState extends ValueObjectCore<String> {
  factory GenericSmartComputerShutdownState(String? input) {
    assert(input != null);
    return GenericSmartComputerShutdownState._(
      validateGenericSmartComputerStateNotEmpty(input!),
    );
  }

  const GenericSmartComputerShutdownState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> smartComputerValidActions() {
    return smartComputerAllValidActions();
  }
}
