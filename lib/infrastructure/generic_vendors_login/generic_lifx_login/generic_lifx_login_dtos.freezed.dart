// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_lifx_login_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericLifxLoginDtos _$GenericLifxLoginDtosFromJson(Map<String, dynamic> json) {
  return _GenericLifxLoginDtos.fromJson(json);
}

/// @nodoc
mixin _$GenericLifxLoginDtos {
// @JsonKey(ignore: true)
  String? get senderUniqueId => throw _privateConstructorUsedError;
  String? get loginVendor => throw _privateConstructorUsedError;
  String? get lifxApiKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericLifxLoginDtosCopyWith<GenericLifxLoginDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericLifxLoginDtosCopyWith<$Res> {
  factory $GenericLifxLoginDtosCopyWith(GenericLifxLoginDtos value,
          $Res Function(GenericLifxLoginDtos) then) =
      _$GenericLifxLoginDtosCopyWithImpl<$Res, GenericLifxLoginDtos>;
  @useResult
  $Res call({String? senderUniqueId, String? loginVendor, String? lifxApiKey});
}

/// @nodoc
class _$GenericLifxLoginDtosCopyWithImpl<$Res,
        $Val extends GenericLifxLoginDtos>
    implements $GenericLifxLoginDtosCopyWith<$Res> {
  _$GenericLifxLoginDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUniqueId = freezed,
    Object? loginVendor = freezed,
    Object? lifxApiKey = freezed,
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
      lifxApiKey: freezed == lifxApiKey
          ? _value.lifxApiKey
          : lifxApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericLifxLoginDtosImplCopyWith<$Res>
    implements $GenericLifxLoginDtosCopyWith<$Res> {
  factory _$$GenericLifxLoginDtosImplCopyWith(_$GenericLifxLoginDtosImpl value,
          $Res Function(_$GenericLifxLoginDtosImpl) then) =
      __$$GenericLifxLoginDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? senderUniqueId, String? loginVendor, String? lifxApiKey});
}

/// @nodoc
class __$$GenericLifxLoginDtosImplCopyWithImpl<$Res>
    extends _$GenericLifxLoginDtosCopyWithImpl<$Res, _$GenericLifxLoginDtosImpl>
    implements _$$GenericLifxLoginDtosImplCopyWith<$Res> {
  __$$GenericLifxLoginDtosImplCopyWithImpl(_$GenericLifxLoginDtosImpl _value,
      $Res Function(_$GenericLifxLoginDtosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUniqueId = freezed,
    Object? loginVendor = freezed,
    Object? lifxApiKey = freezed,
  }) {
    return _then(_$GenericLifxLoginDtosImpl(
      senderUniqueId: freezed == senderUniqueId
          ? _value.senderUniqueId
          : senderUniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      loginVendor: freezed == loginVendor
          ? _value.loginVendor
          : loginVendor // ignore: cast_nullable_to_non_nullable
              as String?,
      lifxApiKey: freezed == lifxApiKey
          ? _value.lifxApiKey
          : lifxApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericLifxLoginDtosImpl extends _GenericLifxLoginDtos {
  _$GenericLifxLoginDtosImpl(
      {required this.senderUniqueId,
      required this.loginVendor,
      required this.lifxApiKey})
      : super._();

  factory _$GenericLifxLoginDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericLifxLoginDtosImplFromJson(json);

// @JsonKey(ignore: true)
  @override
  final String? senderUniqueId;
  @override
  final String? loginVendor;
  @override
  final String? lifxApiKey;

  @override
  String toString() {
    return 'GenericLifxLoginDtos(senderUniqueId: $senderUniqueId, loginVendor: $loginVendor, lifxApiKey: $lifxApiKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericLifxLoginDtosImpl &&
            (identical(other.senderUniqueId, senderUniqueId) ||
                other.senderUniqueId == senderUniqueId) &&
            (identical(other.loginVendor, loginVendor) ||
                other.loginVendor == loginVendor) &&
            (identical(other.lifxApiKey, lifxApiKey) ||
                other.lifxApiKey == lifxApiKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, senderUniqueId, loginVendor, lifxApiKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericLifxLoginDtosImplCopyWith<_$GenericLifxLoginDtosImpl>
      get copyWith =>
          __$$GenericLifxLoginDtosImplCopyWithImpl<_$GenericLifxLoginDtosImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericLifxLoginDtosImplToJson(
      this,
    );
  }
}

abstract class _GenericLifxLoginDtos extends GenericLifxLoginDtos {
  factory _GenericLifxLoginDtos(
      {required final String? senderUniqueId,
      required final String? loginVendor,
      required final String? lifxApiKey}) = _$GenericLifxLoginDtosImpl;
  _GenericLifxLoginDtos._() : super._();

  factory _GenericLifxLoginDtos.fromJson(Map<String, dynamic> json) =
      _$GenericLifxLoginDtosImpl.fromJson;

  @override // @JsonKey(ignore: true)
  String? get senderUniqueId;
  @override
  String? get loginVendor;
  @override
  String? get lifxApiKey;
  @override
  @JsonKey(ignore: true)
  _$$GenericLifxLoginDtosImplCopyWith<_$GenericLifxLoginDtosImpl>
      get copyWith => throw _privateConstructorUsedError;
}
