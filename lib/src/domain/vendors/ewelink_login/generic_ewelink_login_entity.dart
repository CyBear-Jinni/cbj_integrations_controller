import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/ewelink_login/generic_ewelink_login_value_objects.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/src/infrastructure/generic_vendors_login/generic_ewelink_login/generic_ewelink_login_dtos.dart';
import 'package:cbj_integrations_controller/src/infrastructure/generic_vendors_login/generic_login_abstract/login_entity_dto_abstract.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericEwelink that exist inside a computer, the
/// implementations will be actual GenericEwelink like blinds ewelinks and more
class GenericEwelinkLoginDE extends LoginEntityAbstract {
  /// All public field of GenericEwelink entity
  GenericEwelinkLoginDE({
    required super.senderUniqueId,
    required this.ewelinkAccountEmail,
    required this.ewelinkAccountPass,
  }) : super(
          loginVendor: CoreLoginVendor(VendorsAndServices.sonoffEweLink),
        );

  /// Empty instance of GenericEwelinkEntity
  factory GenericEwelinkLoginDE.empty() => GenericEwelinkLoginDE(
        senderUniqueId: CoreLoginSenderId.fromUniqueString(''),
        ewelinkAccountEmail: GenericEwelinkAccountEmail(''),
        ewelinkAccountPass: GenericEwelinkAccountPass(''),
      );

  /// Ewelink account email
  GenericEwelinkAccountEmail ewelinkAccountEmail;

  /// Ewelink account password
  GenericEwelinkAccountPass ewelinkAccountPass;

  Option<CoreLoginFailure<dynamic>> get failureOption =>
      senderUniqueId.value.fold((f) => some(f), (_) => none());

  @override
  LoginEntityDtoAbstract toInfrastructure() {
    return GenericEwelinkLoginDtos(
      senderUniqueId: senderUniqueId.getOrCrash(),
      loginVendor: loginVendor.getOrCrash(),
      ewelinkAccountEmail: ewelinkAccountEmail.getOrCrash(),
      ewelinkAccountPass: ewelinkAccountPass.getOrCrash(),
    );
  }
}
