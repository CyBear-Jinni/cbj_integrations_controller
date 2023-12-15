import 'package:cbj_integrations_controller/domain/vendors/login_abstract/login_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_esphome_login/generic_esphome_login_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_ewelink_login/generic_ewelink_login_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_lifx_login/generic_lifx_login_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_vendors_login/generic_xiaomi_mi_login/generic_xiaomi_mi_login_dtos.dart';

class LoginEntityDtoAbstract {
  LoginEntityDtoAbstract();

  factory LoginEntityDtoAbstract.fromDomain() {
    icLogger.t('LoginEntityDtoAbstract.fromDomain');
    return LoginEntityDtoAbstract();
  }

  factory LoginEntityDtoAbstract.fromJson(Map<String, dynamic> json) {
    LoginEntityDtoAbstract loginEntityDtoAbstract = LoginEntityDtoAbstract();
    final String jsonLoginDtoClass = json['loginVendor'].toString();

    if (jsonLoginDtoClass == VendorsAndServices.lifx.toString()) {
      loginEntityDtoAbstract = GenericLifxLoginDtos.fromJson(json);
    } else if (jsonLoginDtoClass == VendorsAndServices.espHome.toString()) {
      loginEntityDtoAbstract = GenericEspHomeLoginDtos.fromJson(json);
    } else if (jsonLoginDtoClass == VendorsAndServices.xiaomiMi.toString()) {
      loginEntityDtoAbstract = GenericXiaomiMiLoginDtos.fromJson(json);
    } else if (jsonLoginDtoClass ==
        VendorsAndServices.sonoffEweLink.toString()) {
      loginEntityDtoAbstract = GenericEwelinkLoginDtos.fromJson(json);
    } else {
      throw 'DtoClassTypeDoesNotExist';
    }
    return loginEntityDtoAbstract;
  }

  final String loginDtoClassInstance = (LoginEntityDtoAbstract).toString();

  Map<String, dynamic> toJson() {
    icLogger.t('LoginEntityDtoAbstract to Json');
    return {};
  }

  LoginEntityAbstract toDomain() {
    icLogger.t('ToDomain');
    return LoginEntityEmpty();
  }
}
