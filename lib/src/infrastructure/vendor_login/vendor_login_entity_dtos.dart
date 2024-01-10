import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/src/domain/vendor_login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_login_entity_dtos.freezed.dart';
part 'vendor_login_entity_dtos.g.dart';

@freezed
abstract class VendorLoginEntityDtos implements _$VendorLoginEntityDtos {
  factory VendorLoginEntityDtos({
    // @JsonKey(ignore: true)
    required String vendor,
    required Map<String, dynamic> credentials,
  }) = _VendorLoginEntityDtos;

  VendorLoginEntityDtos._();

  factory VendorLoginEntityDtos.fromDomain(VendorLoginEntity loginEntity) {
    final Map<String, dynamic> credentials = {};

    if (loginEntity.apiKey != null) {
      credentials.addEntries([MapEntry('apiKey', loginEntity.apiKey)]);
    }
    if (loginEntity.authToken != null) {
      credentials.addEntries([MapEntry('authToken', loginEntity.authToken)]);
    }
    if (loginEntity.email != null) {
      credentials.addEntries([MapEntry('email', loginEntity.email)]);
    }
    if (loginEntity.password != null) {
      credentials.addEntries([MapEntry('password', loginEntity.email)]);
    }

    return VendorLoginEntityDtos(
      vendor: loginEntity.vendor.name,
      credentials: credentials,
    );
  }

  factory VendorLoginEntityDtos.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$VendorLoginEntityDtosFromJson(json);

  final String loginDtoClassInstance = (VendorLoginEntityDtos).toString();

  VendorLoginEntity toDomain() {
    return VendorLoginEntity(
      EntityUtils.stringToDeviceVendor(vendor),
      apiKey: credentials['apiKey'] as String?,
      authToken: credentials['authToken'] as String?,
      email: credentials['email'] as String?,
      password: credentials['password'] as String?,
    );
  }
}
