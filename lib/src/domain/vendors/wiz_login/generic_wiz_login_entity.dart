import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/wiz_login/generic_wiz_login_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/generic_vendors_login/generic_login_abstract/login_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/src/infrastructure/generic_vendors_login/generic_wiz_login/generic_wiz_login_dtos.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericWiz that exist inside a computer, the
/// implementations will be actual GenericWiz like blinds wizs and more
class GenericWizLoginDE extends LoginEntityAbstract {
  /// All public field of GenericWiz entity
  GenericWizLoginDE({
    required super.senderUniqueId,
    required this.wizApiKey,
  }) : super(
          loginVendor: CoreLoginVendor(VendorsAndServices.wiz),
        );

  /// Empty instance of GenericWizEntity
  factory GenericWizLoginDE.empty() => GenericWizLoginDE(
        senderUniqueId: CoreLoginSenderId.fromUniqueString(''),
        wizApiKey: GenericWizLoginApiKey(''),
      );

  /// Wiz api key
  GenericWizLoginApiKey wizApiKey;

  Option<CoreLoginFailure<dynamic>> get failureOption =>
      senderUniqueId.value.fold((f) => some(f), (_) => none());

  @override
  LoginEntityDtoAbstract toInfrastructure() {
    return GenericWizLoginDtos(
      senderUniqueId: senderUniqueId.getOrCrash(),
      loginVendor: loginVendor.getOrCrash(),
      wizApiKey: wizApiKey.getOrCrash(),
    );
  }
}
