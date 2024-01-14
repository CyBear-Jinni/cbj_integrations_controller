// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_action_object_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestActionObjectDtos _$RequestActionObjectDtosFromJson(
    Map<String, dynamic> json) {
  return _RequestActionObjectDtos.fromJson(json);
}

/// @nodoc
mixin _$RequestActionObjectDtos {
  HashMap<String, HashSet<String>> get uniqueIdByVendor =>
      throw _privateConstructorUsedError;
  String get property => throw _privateConstructorUsedError;
  String get actionType => throw _privateConstructorUsedError;
  HashMap<String, dynamic>? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestActionObjectDtosCopyWith<RequestActionObjectDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestActionObjectDtosCopyWith<$Res> {
  factory $RequestActionObjectDtosCopyWith(RequestActionObjectDtos value,
          $Res Function(RequestActionObjectDtos) then) =
      _$RequestActionObjectDtosCopyWithImpl<$Res, RequestActionObjectDtos>;
  @useResult
  $Res call(
      {HashMap<String, HashSet<String>> uniqueIdByVendor,
      String property,
      String actionType,
      HashMap<String, dynamic>? value});
}

/// @nodoc
class _$RequestActionObjectDtosCopyWithImpl<$Res,
        $Val extends RequestActionObjectDtos>
    implements $RequestActionObjectDtosCopyWith<$Res> {
  _$RequestActionObjectDtosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdByVendor = null,
    Object? property = null,
    Object? actionType = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      uniqueIdByVendor: null == uniqueIdByVendor
          ? _value.uniqueIdByVendor
          : uniqueIdByVendor // ignore: cast_nullable_to_non_nullable
              as HashMap<String, HashSet<String>>,
      property: null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as HashMap<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestActionObjectDtosImplCopyWith<$Res>
    implements $RequestActionObjectDtosCopyWith<$Res> {
  factory _$$RequestActionObjectDtosImplCopyWith(
          _$RequestActionObjectDtosImpl value,
          $Res Function(_$RequestActionObjectDtosImpl) then) =
      __$$RequestActionObjectDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HashMap<String, HashSet<String>> uniqueIdByVendor,
      String property,
      String actionType,
      HashMap<String, dynamic>? value});
}

/// @nodoc
class __$$RequestActionObjectDtosImplCopyWithImpl<$Res>
    extends _$RequestActionObjectDtosCopyWithImpl<$Res,
        _$RequestActionObjectDtosImpl>
    implements _$$RequestActionObjectDtosImplCopyWith<$Res> {
  __$$RequestActionObjectDtosImplCopyWithImpl(
      _$RequestActionObjectDtosImpl _value,
      $Res Function(_$RequestActionObjectDtosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdByVendor = null,
    Object? property = null,
    Object? actionType = null,
    Object? value = freezed,
  }) {
    return _then(_$RequestActionObjectDtosImpl(
      uniqueIdByVendor: null == uniqueIdByVendor
          ? _value.uniqueIdByVendor
          : uniqueIdByVendor // ignore: cast_nullable_to_non_nullable
              as HashMap<String, HashSet<String>>,
      property: null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as HashMap<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestActionObjectDtosImpl extends _RequestActionObjectDtos {
  _$RequestActionObjectDtosImpl(
      {required this.uniqueIdByVendor,
      required this.property,
      required this.actionType,
      this.value})
      : super._();

  factory _$RequestActionObjectDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestActionObjectDtosImplFromJson(json);

  @override
  final HashMap<String, HashSet<String>> uniqueIdByVendor;
  @override
  final String property;
  @override
  final String actionType;
  @override
  final HashMap<String, dynamic>? value;

  @override
  String toString() {
    return 'RequestActionObjectDtos(uniqueIdByVendor: $uniqueIdByVendor, property: $property, actionType: $actionType, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestActionObjectDtosImpl &&
            const DeepCollectionEquality()
                .equals(other.uniqueIdByVendor, uniqueIdByVendor) &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uniqueIdByVendor),
      property,
      actionType,
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestActionObjectDtosImplCopyWith<_$RequestActionObjectDtosImpl>
      get copyWith => __$$RequestActionObjectDtosImplCopyWithImpl<
          _$RequestActionObjectDtosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestActionObjectDtosImplToJson(
      this,
    );
  }
}

abstract class _RequestActionObjectDtos extends RequestActionObjectDtos {
  factory _RequestActionObjectDtos(
      {required final HashMap<String, HashSet<String>> uniqueIdByVendor,
      required final String property,
      required final String actionType,
      final HashMap<String, dynamic>? value}) = _$RequestActionObjectDtosImpl;
  _RequestActionObjectDtos._() : super._();

  factory _RequestActionObjectDtos.fromJson(Map<String, dynamic> json) =
      _$RequestActionObjectDtosImpl.fromJson;

  @override
  HashMap<String, HashSet<String>> get uniqueIdByVendor;
  @override
  String get property;
  @override
  String get actionType;
  @override
  HashMap<String, dynamic>? get value;
  @override
  @JsonKey(ignore: true)
  _$$RequestActionObjectDtosImplCopyWith<_$RequestActionObjectDtosImpl>
      get copyWith => throw _privateConstructorUsedError;
}
