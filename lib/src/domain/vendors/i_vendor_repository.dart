import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/vendor_failures.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/vendor_value_objects.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendors/vendor_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

part 'package:cbj_integrations_controller/src/infrastructure/vendors/vendors_repository.dart';

abstract class IVendorsRepository {
  static IVendorsRepository? _instance;

  static IVendorsRepository get instance {
    return _instance ??= _VendorsRepository();
  }

  Future<Either<VendorFailure, KtList<VendorData>>> getVendors();

  Future<Either<CoreLoginFailure, Unit>> loginWithEspHome(
    GenericEspHomeLoginDE login,
  );

  Future<Either<CoreLoginFailure, Unit>> loginWithXiaomiMi(
    GenericXiaomiMiLoginDE login,
  );

  Future<Either<CoreLoginFailure, Unit>> loginWithLifx(
    GenericLifxLoginDE login,
  );

  Future<Either<CoreLoginFailure, Unit>> loginWithEwelink(
    GenericEwelinkLoginDE login,
  );
}
