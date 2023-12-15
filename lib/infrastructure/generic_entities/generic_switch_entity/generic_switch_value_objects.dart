import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_validators.dart';
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
