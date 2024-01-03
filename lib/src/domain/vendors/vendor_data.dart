import 'package:cbj_integrations_controller/src/domain/vendors/vendor_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_data.freezed.dart';

@freezed
class VendorData with _$VendorData {
  const factory VendorData({
    required VendorName name,
    String? image,
  }) = _VendorData;

  const VendorData._();
}
