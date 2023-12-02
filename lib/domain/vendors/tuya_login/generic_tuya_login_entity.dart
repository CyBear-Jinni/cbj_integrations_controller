import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/domain/vendors/tuya_login/generic_tuya_login_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_login_abstract/login_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_tuya_login/generic_tuya_login_dtos.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericTuya that exist inside a computer, the
/// implementations will be actual GenericTuya like blinds tuyas and more
class GenericTuyaLoginDE extends LoginEntityAbstract {
  /// All public field of GenericTuya entity
  GenericTuyaLoginDE({
    required super.senderUniqueId,
    required super.loginVendor,
    required this.tuyaUserName,
    required this.tuyaUserPassword,
    required this.tuyaCountryCode,
    required this.tuyaBizType,
    required this.tuyaRegion,
  });

  /// Empty instance of GenericTuyaEntity
  factory GenericTuyaLoginDE.empty() => GenericTuyaLoginDE(
        senderUniqueId: CoreLoginSenderId.fromUniqueString(''),
        loginVendor: CoreLoginVendor(
          /// I think this should stay vendorsAndServicesNotSupported so that
          /// the correct tuya/smartLife/jinvooSmart to be inserted later.
          VendorsAndServices.vendorsAndServicesNotSupported.name,
        ),
        tuyaUserName: GenericTuyaLoginUserName(''),
        tuyaUserPassword: GenericTuyaLoginUserPassword(''),
        tuyaCountryCode: GenericTuyaLoginCountryCode(''),
        tuyaBizType: GenericTuyaLoginBizType(''),
        tuyaRegion: GenericTuyaLoginRegion(''),
      );

  /// User name
  GenericTuyaLoginUserName tuyaUserName;

  /// User password
  GenericTuyaLoginUserPassword tuyaUserPassword;

  /// User current countryCode or countryCode of registration not sure
  GenericTuyaLoginCountryCode tuyaCountryCode;

  /// App business can be: tuya, smart_life, jinvoo_smart
  GenericTuyaLoginBizType tuyaBizType;

  /// Region of the user, can be cn, eu, us
  GenericTuyaLoginRegion tuyaRegion;

  Option<CoreLoginFailure<dynamic>> get failureOption =>
      senderUniqueId.value.fold((f) => some(f), (_) => none());

  @override
  LoginEntityDtoAbstract toInfrastructure() {
    return GenericTuyaLoginDtos(
      senderUniqueId: senderUniqueId.getOrCrash(),
      loginVendor: loginVendor.getOrCrash(),
      userName: tuyaUserName.getOrCrash(),
      userPassword: tuyaUserPassword.getOrCrash(),
      countryCode: tuyaCountryCode.getOrCrash(),
      bizType: tuyaBizType.getOrCrash(),
      region: tuyaRegion.getOrCrash(),
    );
  }
}
