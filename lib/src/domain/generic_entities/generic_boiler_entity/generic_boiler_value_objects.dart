import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_boiler_entity/generic_boiler_validators.dart';
import 'package:dartz/dartz.dart';

class GenericBoilerSwitchState extends ValueObjectCore<String> {
  factory GenericBoilerSwitchState(String? input) {
    assert(input != null);
    final EntityActions action = EntityUtils.stringToDeviceAction(input!) ??
        EntityActions.actionNotSupported;

    return GenericBoilerSwitchState._(
      validateGenericBoilerStateNotEmpty(input),
      action,
    );
  }

  const GenericBoilerSwitchState._(this.value, this._action);

  final EntityActions _action;

  EntityActions get action => _action;

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> boilerValidActions() {
    return boilerAllValidActions();
  }
}
