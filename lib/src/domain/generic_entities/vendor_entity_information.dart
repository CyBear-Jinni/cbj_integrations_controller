import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';

/// Moving here values that need to be sheard with the app as well as the vendor connector conjecture.
class VendorEntityInformation {
  VendorEntityInformation(
    this.vendorsAndServices, {
    required this.displayName,
    required this.imageUrl,
    required this.loginType,
    this.urlToLoginCredantials,
  });

  final VendorsAndServices vendorsAndServices;
  final String displayName;
  final String imageUrl;
  final String? urlToLoginCredantials;
  final VendorLoginTypes loginType;
}
