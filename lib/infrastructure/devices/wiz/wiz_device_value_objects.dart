import 'package:cbj_integrations_controller/infrastructure/devices/wiz/wiz_device_validators.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:dartz/dartz.dart';

/// Wiz communication port
class WizPort extends ValueObjectCore<String> {
  factory WizPort(String? input) {
    assert(input != null);
    return WizPort._(
      validateWizPortNotEmpty(input!),
    );
  }

  const WizPort._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
