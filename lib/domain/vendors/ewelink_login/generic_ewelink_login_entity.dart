import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_ewelink_login/generic_ewelink_login_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_login_abstract/login_entity_dto_abstract.dart';
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
          loginVendor: CoreLoginVendor(VendorsAndServices.sonoffEweLink.name),
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
    return GenericEwelinkLoginDtos(
      senderUniqueId: senderUniqueId.getOrCrash(),
      loginVendor: loginVendor.getOrCrash(),
      ewelinkAccountEmail: ewelinkAccountEmail.getOrCrash(),
      ewelinkAccountPass: ewelinkAccountPass.getOrCrash(),
    );
  }
}
