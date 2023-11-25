import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_security_camera_device/generic_security_camera_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSecurityCameraSuspendState extends ValueObjectCore<String> {
  factory GenericSecurityCameraSuspendState(String? input) {
    assert(input != null);
    return GenericSecurityCameraSuspendState._(
      validateGenericSecurityCameraStateNotEmpty(input!),
    );
  }

  const GenericSecurityCameraSuspendState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> securityCameraValidActions() {
    return securityCameraAllValidActions();
  }
}
