import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validatePhilipsHueIdNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validatePhilipsHuePortNotEmpty(
  String input,
) {
  return right(input);
}
