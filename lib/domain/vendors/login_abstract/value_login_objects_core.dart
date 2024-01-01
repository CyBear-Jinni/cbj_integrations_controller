import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_failures.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/core_login_validators.dart';
import 'package:cbj_integrations_controller/domain/vendors/vendor_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectCoreLogin<T> {
  const ValueObjectCoreLogin();

  Either<CoreLoginFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [CoreLoginFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw VendorUnexpectedValueError(f), id);
  }

  Either<CoreLoginFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectCoreLogin<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class CoreLoginSenderId extends ValueObjectCoreLogin<String?> {
  factory CoreLoginSenderId() {
    return CoreLoginSenderId._(right(const Uuid().v1()));
  }

  factory CoreLoginSenderId.fromUniqueString(String? uniqueId) {
    return CoreLoginSenderId._(right(uniqueId));
  }

  const CoreLoginSenderId._(this.value);

  @override
  final Either<CoreLoginFailure<String?>, String?> value;
}

class CoreLoginVendor extends ValueObjectCoreLogin<String> {
  // factory CoreLoginVendor(String? input) {
  //   assert(input != null);
  //   return CoreLoginVendor._(
  //     validateLoginNotEmpty(input!),
  //   );
  // }

  factory CoreLoginVendor(VendorsAndServices? input) {
    assert(input != null);
    return CoreLoginVendor._(
      input!,
      validateLoginNotEmpty(input.name),
    );
  }

  const CoreLoginVendor._(this.vendor, this.value);

  final VendorsAndServices vendor;

  @override
  final Either<CoreLoginFailure<String>, String> value;
}
