import 'package:cbj_integrations_controller/domain/vendors/esphome_login/generic_esphome_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/lifx_login/generic_lifx_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/domain/vendors/vendor_data.dart';
import 'package:cbj_integrations_controller/domain/vendors/vendor_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/vendor_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';
import 'package:cbj_integrations_controller/infrastructure/vendors/vendor_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

part 'package:cbj_integrations_controller/infrastructure/vendors/vendors_repository.dart';

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
