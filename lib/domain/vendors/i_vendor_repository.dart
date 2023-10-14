import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/tuya_login/generic_tuya_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/vendor_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:network_tools/network_tools.dart';

abstract class IVendorsRepository {
  Future<Either<VendorFailure, KtList<Vendor>>> getVendors();

  Future<Either<CoreLoginFailure, Unit>> loginWithEspHome(
    GenericEspHomeLoginDE login,
  );

  Future<Either<CoreLoginFailure, Unit>> loginWithXiaomiMi(
    GenericXiaomiMiLoginDE login,
  );

  Future<Either<CoreLoginFailure, Unit>> loginWithLifx(
    GenericLifxLoginDE login,
  );

  Future<Either<CoreLoginFailure, Unit>> loginWithTuya(
    GenericTuyaLoginDE login,
  );

  Future<Either<CoreLoginFailure, Unit>> loginWithEwelink(
    GenericEwelinkLoginDE login,
  );
}
