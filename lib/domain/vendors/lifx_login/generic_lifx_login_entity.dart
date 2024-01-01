import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_lifx_login/generic_lifx_login_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_login_abstract/login_entity_dto_abstract.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericLifx that exist inside a computer, the
/// implementations will be actual GenericLifx like blinds lifxs and more
class GenericLifxLoginDE extends LoginEntityAbstract {
  /// All public field of GenericLifx entity
  GenericLifxLoginDE({
    required super.senderUniqueId,
    required this.lifxApiKey,
  }) : super(
          loginVendor: CoreLoginVendor(VendorsAndServices.lifx),
        );

  /// Empty instance of GenericLifxEntity
  factory GenericLifxLoginDE.empty() => GenericLifxLoginDE(
        senderUniqueId: CoreLoginSenderId.fromUniqueString(''),
        lifxApiKey: GenericLifxLoginApiKey(''),
      );

  /// Lifx api key
  GenericLifxLoginApiKey lifxApiKey;

  Option<CoreLoginFailure<dynamic>> get failureOption =>
      senderUniqueId.value.fold((f) => some(f), (_) => none());

  @override
  LoginEntityDtoAbstract toInfrastructure() {
    return GenericLifxLoginDtos(
      senderUniqueId: senderUniqueId.getOrCrash(),
      loginVendor: loginVendor.getOrCrash(),
      lifxApiKey: lifxApiKey.getOrCrash(),
    );
  }
}
