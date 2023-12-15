import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_plug_entity/generic_smart_plug_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSmartPlugState extends ValueObjectCore<String> {
  factory GenericSmartPlugState(String? input) {
    assert(input != null);
    return GenericSmartPlugState._(
      validateGenericSmartPlugStateNotEmpty(input!),
    );
  }

  const GenericSmartPlugState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of light state
  static List<String> lightValidActions() {
    return lightAllValidActions();
  }
}
