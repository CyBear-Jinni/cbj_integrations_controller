// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_ewelink_login_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericEwelinkLoginDtos _$GenericEwelinkLoginDtosFromJson(
    Map<String, dynamic> json) {
  return _GenericEwelinkLoginDtos.fromJson(json);
}

/// @nodoc
mixin _$GenericEwelinkLoginDtos {
// @JsonKey(ignore: true)
  String? get senderUniqueId => throw _privateConstructorUsedError;
  String? get loginVendor => throw _privateConstructorUsedError;
  String? get ewelinkAccountEmail => throw _privateConstructorUsedError;
  String? get ewelinkAccountPass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericEwelinkLoginDtosCopyWith<GenericEwelinkLoginDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericEwelinkLoginDtosCopyWith<$Res> {
  factory $GenericEwelinkLoginDtosCopyWith(GenericEwelinkLoginDtos value,
          $Res Function(GenericEwelinkLoginDtos) then) =
      _$GenericEwelinkLoginDtosCopyWithImpl<$Res, GenericEwelinkLoginDtos>;
  @useResult
  $Res call(
      {String? senderUniqueId,
      String? loginVendor,
      String? ewelinkAccountEmail,
      String? ewelinkAccountPass});
}

/// @nodoc
class _$GenericEwelinkLoginDtosCopyWithImpl<$Res,
        $Val extends GenericEwelinkLoginDtos>
    implements $GenericEwelinkLoginDtosCopyWith<$Res> {
  _$GenericEwelinkLoginDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUniqueId = freezed,
    Object? loginVendor = freezed,
    Object? ewelinkAccountEmail = freezed,
    Object? ewelinkAccountPass = freezed,
  }) {
    return _then(_value.copyWith(
      senderUniqueId: freezed == senderUniqueId
          ? _value.senderUniqueId
          : senderUniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      loginVendor: freezed == loginVendor
          ? _value.loginVendor
          : loginVendor // ignore: cast_nullable_to_non_nullable
              as String?,
      ewelinkAccountEmail: freezed == ewelinkAccountEmail
          ? _value.ewelinkAccountEmail
          : ewelinkAccountEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ewelinkAccountPass: freezed == ewelinkAccountPass
          ? _value.ewelinkAccountPass
          : ewelinkAccountPass // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericEwelinkLoginDtosImplCopyWith<$Res>
    implements $GenericEwelinkLoginDtosCopyWith<$Res> {
  factory _$$GenericEwelinkLoginDtosImplCopyWith(
          _$GenericEwelinkLoginDtosImpl value,
          $Res Function(_$GenericEwelinkLoginDtosImpl) then) =
      __$$GenericEwelinkLoginDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? senderUniqueId,
      String? loginVendor,
      String? ewelinkAccountEmail,
      String? ewelinkAccountPass});
}

/// @nodoc
class __$$GenericEwelinkLoginDtosImplCopyWithImpl<$Res>
    extends _$GenericEwelinkLoginDtosCopyWithImpl<$Res,
        _$GenericEwelinkLoginDtosImpl>
    implements _$$GenericEwelinkLoginDtosImplCopyWith<$Res> {
  __$$GenericEwelinkLoginDtosImplCopyWithImpl(
      _$GenericEwelinkLoginDtosImpl _value,
      $Res Function(_$GenericEwelinkLoginDtosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUniqueId = freezed,
    Object? loginVendor = freezed,
    Object? ewelinkAccountEmail = freezed,
    Object? ewelinkAccountPass = freezed,
  }) {
    return _then(_$GenericEwelinkLoginDtosImpl(
      senderUniqueId: freezed == senderUniqueId
          ? _value.senderUniqueId
          : senderUniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      loginVendor: freezed == loginVendor
          ? _value.loginVendor
          : loginVendor // ignore: cast_nullable_to_non_nullable
              as String?,
      ewelinkAccountEmail: freezed == ewelinkAccountEmail
          ? _value.ewelinkAccountEmail
          : ewelinkAccountEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ewelinkAccountPass: freezed == ewelinkAccountPass
          ? _value.ewelinkAccountPass
          : ewelinkAccountPass // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericEwelinkLoginDtosImpl extends _GenericEwelinkLoginDtos {
  _$GenericEwelinkLoginDtosImpl(
      {required this.senderUniqueId,
      required this.loginVendor,
      required this.ewelinkAccountEmail,
      required this.ewelinkAccountPass})
      : super._();

  factory _$GenericEwelinkLoginDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericEwelinkLoginDtosImplFromJson(json);

// @JsonKey(ignore: true)
  @override
  final String? senderUniqueId;
  @override
  final String? loginVendor;
  @override
  final String? ewelinkAccountEmail;
  @override
  final String? ewelinkAccountPass;

  @override
  String toString() {
    return 'GenericEwelinkLoginDtos(senderUniqueId: $senderUniqueId, loginVendor: $loginVendor, ewelinkAccountEmail: $ewelinkAccountEmail, ewelinkAccountPass: $ewelinkAccountPass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericEwelinkLoginDtosImpl &&
            (identical(other.senderUniqueId, senderUniqueId) ||
                other.senderUniqueId == senderUniqueId) &&
            (identical(other.loginVendor, loginVendor) ||
                other.loginVendor == loginVendor) &&
            (identical(other.ewelinkAccountEmail, ewelinkAccountEmail) ||
                other.ewelinkAccountEmail == ewelinkAccountEmail) &&
            (identical(other.ewelinkAccountPass, ewelinkAccountPass) ||
                other.ewelinkAccountPass == ewelinkAccountPass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, senderUniqueId, loginVendor,
      ewelinkAccountEmail, ewelinkAccountPass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericEwelinkLoginDtosImplCopyWith<_$GenericEwelinkLoginDtosImpl>
      get copyWith => __$$GenericEwelinkLoginDtosImplCopyWithImpl<
          _$GenericEwelinkLoginDtosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericEwelinkLoginDtosImplToJson(
      this,
    );
  }
}

abstract class _GenericEwelinkLoginDtos extends GenericEwelinkLoginDtos {
  factory _GenericEwelinkLoginDtos(
          {required final String? senderUniqueId,
          required final String? loginVendor,
          required final String? ewelinkAccountEmail,
          required final String? ewelinkAccountPass}) =
      _$GenericEwelinkLoginDtosImpl;
  _GenericEwelinkLoginDtos._() : super._();

  factory _GenericEwelinkLoginDtos.fromJson(Map<String, dynamic> json) =
      _$GenericEwelinkLoginDtosImpl.fromJson;

  @override // @JsonKey(ignore: true)
  String? get senderUniqueId;
  @override
  String? get loginVendor;
  @override
  String? get ewelinkAccountEmail;
  @override
  String? get ewelinkAccountPass;
  @override
  @JsonKey(ignore: true)
  _$$GenericEwelinkLoginDtosImplCopyWith<_$GenericEwelinkLoginDtosImpl>
      get copyWith => throw _privateConstructorUsedError;
}
