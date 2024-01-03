import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_validators.dart';
import 'package:dartz/dartz.dart';

class GenericDimmableLightSwitchState extends ValueObjectCore<String> {
  factory GenericDimmableLightSwitchState(String? input) {
    assert(input != null);

    final EntityActions action = EntityUtils.stringToDeviceAction(input!) ??
        EntityActions.actionNotSupported;

    return GenericDimmableLightSwitchState._(
      validateGenericDimmableLightStateNotEmpty(input),
      action,
    );
  }

  const GenericDimmableLightSwitchState._(this.value, this._action);

  final EntityActions _action;

  EntityActions get action => _action;

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> lightValidActions() {
    return lightAllValidActions();
  }
}

class GenericDimmableLightBrightness extends ValueObjectCore<String> {
  factory GenericDimmableLightBrightness(String? input) {
    assert(input != null);
    final String tempInput = input!;

    return GenericDimmableLightBrightness._(
      validateGenericDimmableLightNotEmpty(tempInput),
    );
  }

  factory GenericDimmableLightBrightness.fromDouble(double input) {
    return GenericDimmableLightBrightness._(
      validateGenericDimmableLightNotEmpty(
        convertDecimalPresentagetToIntegerPercentage(input).toString(),
      ),
    );
  }

  const GenericDimmableLightBrightness._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  // Convert percentage 0.0-1.0 numbers to 0-100 with the same percentage
  static int convertDecimalPresentagetToIntegerPercentage(double number) {
    const double oldMax = 1.0;
    const double oldMin = 0;
    const double oldRange = oldMax - oldMin;

    const int newMax = 100;
    const int newMin = 0;
    const int newRange = newMax - newMin;

    final double newValue =
        (((number - oldMin) * newRange) / oldRange) + newMin;

    return newValue.toInt();
  }
}
