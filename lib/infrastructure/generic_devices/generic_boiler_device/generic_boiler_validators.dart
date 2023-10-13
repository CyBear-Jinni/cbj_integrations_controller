import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validateGenericBoilerStateNotEmpty(
  String input,
) {
  return right(input);
}

/// Return all the valid actions for blinds
List<String> boilerAllValidActions() {
  return [
    EntityActions.off.toString(),
    EntityActions.on.toString(),
  ];
}
