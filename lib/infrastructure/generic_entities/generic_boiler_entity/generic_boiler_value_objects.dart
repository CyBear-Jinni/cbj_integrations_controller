import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_boiler_entity/generic_boiler_validators.dart';
import 'package:dartz/dartz.dart';

class GenericBoilerSwitchState extends ValueObjectCore<String> {
  factory GenericBoilerSwitchState(String? input) {
    assert(input != null);
    return GenericBoilerSwitchState._(
      validateGenericBoilerStateNotEmpty(input!),
    );
  }

  const GenericBoilerSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> boilerValidActions() {
    return boilerAllValidActions();
  }
}
