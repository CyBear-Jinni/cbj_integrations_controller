import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_device_validators.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:dartz/dartz.dart';

/// Lg communication port
class LgPort extends ValueObjectCore<String> {
  factory LgPort(String? input) {
    assert(input != null);
    return LgPort._(
      validateLgPortNotEmpty(input!),
    );
  }

  const LgPort._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
