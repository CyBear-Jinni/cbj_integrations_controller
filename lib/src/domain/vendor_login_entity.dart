import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendor_login/vendor_login_entity_dtos.dart';

class VendorLoginEntity {
  VendorLoginEntity(
    this.vendor, {
    this.apiKey,
    this.authToken,
    this.email,
    this.password,
  });

  VendorsAndServices vendor;
  final String? apiKey;
  final String? authToken;
  final String? email;
  final String? password;

  VendorLoginEntityDtos toInfrastructure() {
    final Map<String, dynamic> credentials = {};

    if (apiKey != null) {
      credentials.addEntries([MapEntry('apiKey', apiKey)]);
    }
    if (authToken != null) {
      credentials.addEntries([MapEntry('authToken', authToken)]);
    }
    if (email != null) {
      credentials.addEntries([MapEntry('email', email)]);
    }
    if (password != null) {
      credentials.addEntries([MapEntry('password', email)]);
    }

    return VendorLoginEntityDtos(
      vendor: vendor.name,
      credentials: credentials,
    );
  }
}
