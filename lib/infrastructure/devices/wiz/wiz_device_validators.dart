import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validateWizIdNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateWizPortNotEmpty(String input) {
  return right(input);
}
