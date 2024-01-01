import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_login_abstract/login_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_xiaomi_mi_login/generic_xiaomi_mi_login_dtos.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericXiaomiMi that exist inside a computer, the
/// implementations will be actual GenericXiaomiMi like blinds xiaomiMis and more
class GenericXiaomiMiLoginDE extends LoginEntityAbstract {
  /// All public field of GenericXiaomiMi entity
  GenericXiaomiMiLoginDE({
    required super.senderUniqueId,
    required this.xiaomiMiAccountEmail,
    required this.xiaomiMiAccountPass,
  }) : super(
          loginVendor: CoreLoginVendor(VendorsAndServices.xiaomiMi),
        );

  /// Empty instance of GenericXiaomiMiEntity
  factory GenericXiaomiMiLoginDE.empty() => GenericXiaomiMiLoginDE(
        senderUniqueId: CoreLoginSenderId.fromUniqueString(''),
        xiaomiMiAccountEmail: GenericXiaomiMiAccountEmail(''),
        xiaomiMiAccountPass: GenericXiaomiMiAccountPass(''),
      );

  /// XiaomiMi account email
  GenericXiaomiMiAccountEmail xiaomiMiAccountEmail;

  /// XiaomiMi account password
  GenericXiaomiMiAccountPass xiaomiMiAccountPass;

  Option<CoreLoginFailure<dynamic>> get failureOption =>
      senderUniqueId.value.fold((f) => some(f), (_) => none());

  //
  // /// Will return failure if any of the fields failed or return unit if fields
  // /// have legit values
  // Option<CoreFailure<dynamic>> get failureOption {
  //   return cbjEntityName!.value.fold((f) => some(f), (_) => none());
  //
  // return body.failureOrUnit
  //     .andThen(todos.failureOrUnit)
  //     .andThen(
  //       todos
  //           .getOrCrash()
  //           // Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
  //           .map((todoItem) => todoItem.failureOption)
  //           .filter((o) => o.isSome())
  //           // If we can't get the 0th element, the list is empty. In such a case, it's valid.
  //           .getOrElse(0, (_) => none())
  //           .fold(() => right(unit), (f) => left(f)),
  //     )
  //     .fold((f) => some(f), (_) => none());
  // }

  @override
  LoginEntityDtoAbstract toInfrastructure() {
    return GenericXiaomiMiLoginDtos(
      senderUniqueId: senderUniqueId.getOrCrash(),
      loginVendor: loginVendor.getOrCrash(),
      xiaomiMiAccountEmail: xiaomiMiAccountEmail.getOrCrash(),
      xiaomiMiAccountPass: xiaomiMiAccountPass.getOrCrash(),
    );
  }
}
