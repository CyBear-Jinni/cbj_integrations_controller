import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validateTuyaSmartIdNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateTuyaSmartPortNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure, Unit> tuyaResponseToCyBearJinniSucessFailure(
  String tuyaResponse,
) {
  if (tuyaResponse == 'SUCCESS') {
    return right(unit);
  } else if (tuyaResponse == 'TargetOffline') {
    return left(const CoreFailure.unableToUpdate());
  }
  return left(const CoreFailure.unexpected());
}
