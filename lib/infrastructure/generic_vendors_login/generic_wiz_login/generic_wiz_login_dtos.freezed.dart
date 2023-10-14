// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_wiz_login_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericWizLoginDtos _$GenericWizLoginDtosFromJson(Map<String, dynamic> json) {
  return _GenericWizLoginDtos.fromJson(json);
}

/// @nodoc
mixin _$GenericWizLoginDtos {
// @JsonKey(ignore: true)
  String? get senderUniqueId => throw _privateConstructorUsedError;
  String? get loginVendor => throw _privateConstructorUsedError;
  String? get wizApiKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericWizLoginDtosCopyWith<GenericWizLoginDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericWizLoginDtosCopyWith<$Res> {
  factory $GenericWizLoginDtosCopyWith(
          GenericWizLoginDtos value, $Res Function(GenericWizLoginDtos) then) =
      _$GenericWizLoginDtosCopyWithImpl<$Res, GenericWizLoginDtos>;
  @useResult
  $Res call({String? senderUniqueId, String? loginVendor, String? wizApiKey});
}

/// @nodoc
class _$GenericWizLoginDtosCopyWithImpl<$Res, $Val extends GenericWizLoginDtos>
    implements $GenericWizLoginDtosCopyWith<$Res> {
  _$GenericWizLoginDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUniqueId = freezed,
    Object? loginVendor = freezed,
    Object? wizApiKey = freezed,
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
      wizApiKey: freezed == wizApiKey
          ? _value.wizApiKey
          : wizApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericWizLoginDtosImplCopyWith<$Res>
    implements $GenericWizLoginDtosCopyWith<$Res> {
  factory _$$GenericWizLoginDtosImplCopyWith(_$GenericWizLoginDtosImpl value,
          $Res Function(_$GenericWizLoginDtosImpl) then) =
      __$$GenericWizLoginDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? senderUniqueId, String? loginVendor, String? wizApiKey});
}

/// @nodoc
class __$$GenericWizLoginDtosImplCopyWithImpl<$Res>
    extends _$GenericWizLoginDtosCopyWithImpl<$Res, _$GenericWizLoginDtosImpl>
    implements _$$GenericWizLoginDtosImplCopyWith<$Res> {
  __$$GenericWizLoginDtosImplCopyWithImpl(_$GenericWizLoginDtosImpl _value,
      $Res Function(_$GenericWizLoginDtosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUniqueId = freezed,
    Object? loginVendor = freezed,
    Object? wizApiKey = freezed,
  }) {
    return _then(_$GenericWizLoginDtosImpl(
      senderUniqueId: freezed == senderUniqueId
          ? _value.senderUniqueId
          : senderUniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      loginVendor: freezed == loginVendor
          ? _value.loginVendor
          : loginVendor // ignore: cast_nullable_to_non_nullable
              as String?,
      wizApiKey: freezed == wizApiKey
          ? _value.wizApiKey
          : wizApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericWizLoginDtosImpl extends _GenericWizLoginDtos {
  _$GenericWizLoginDtosImpl(
      {required this.senderUniqueId,
      required this.loginVendor,
      required this.wizApiKey})
      : super._();

  factory _$GenericWizLoginDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericWizLoginDtosImplFromJson(json);

// @JsonKey(ignore: true)
  @override
  final String? senderUniqueId;
  @override
  final String? loginVendor;
  @override
  final String? wizApiKey;

  @override
  String toString() {
    return 'GenericWizLoginDtos(senderUniqueId: $senderUniqueId, loginVendor: $loginVendor, wizApiKey: $wizApiKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericWizLoginDtosImpl &&
            (identical(other.senderUniqueId, senderUniqueId) ||
                other.senderUniqueId == senderUniqueId) &&
            (identical(other.loginVendor, loginVendor) ||
                other.loginVendor == loginVendor) &&
            (identical(other.wizApiKey, wizApiKey) ||
                other.wizApiKey == wizApiKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, senderUniqueId, loginVendor, wizApiKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericWizLoginDtosImplCopyWith<_$GenericWizLoginDtosImpl> get copyWith =>
      __$$GenericWizLoginDtosImplCopyWithImpl<_$GenericWizLoginDtosImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericWizLoginDtosImplToJson(
      this,
    );
  }
}

abstract class _GenericWizLoginDtos extends GenericWizLoginDtos {
  factory _GenericWizLoginDtos(
      {required final String? senderUniqueId,
      required final String? loginVendor,
      required final String? wizApiKey}) = _$GenericWizLoginDtosImpl;
  _GenericWizLoginDtos._() : super._();

  factory _GenericWizLoginDtos.fromJson(Map<String, dynamic> json) =
      _$GenericWizLoginDtosImpl.fromJson;

  @override // @JsonKey(ignore: true)
  String? get senderUniqueId;
  @override
  String? get loginVendor;
  @override
  String? get wizApiKey;
  @override
  @JsonKey(ignore: true)
  _$$GenericWizLoginDtosImplCopyWith<_$GenericWizLoginDtosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
