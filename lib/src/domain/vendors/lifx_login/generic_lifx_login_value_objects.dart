import 'package:cbj_integrations_controller/src/domain/vendors/lifx_login/generic_lifx_login_validators.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:dartz/dartz.dart';

class GenericLifxLoginApiKey extends ValueObjectCoreLogin<String> {
  factory GenericLifxLoginApiKey(String? input) {
    assert(input != null);
    return GenericLifxLoginApiKey._(
      validateGenericLifxLoginApiKeyNotEmty(input!),
    );
  }

  const GenericLifxLoginApiKey._(this.value);

  @override
  final Either<CoreLoginFailure<String>, String> value;
}
