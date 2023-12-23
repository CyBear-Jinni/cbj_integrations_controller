// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VendorData {
  VendorName get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VendorDataCopyWith<VendorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorDataCopyWith<$Res> {
  factory $VendorDataCopyWith(
          VendorData value, $Res Function(VendorData) then) =
      _$VendorDataCopyWithImpl<$Res, VendorData>;
  @useResult
  $Res call({VendorName name, String? image});
}

/// @nodoc
class _$VendorDataCopyWithImpl<$Res, $Val extends VendorData>
    implements $VendorDataCopyWith<$Res> {
  _$VendorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as VendorName,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorDataImplCopyWith<$Res>
    implements $VendorDataCopyWith<$Res> {
  factory _$$VendorDataImplCopyWith(
          _$VendorDataImpl value, $Res Function(_$VendorDataImpl) then) =
      __$$VendorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VendorName name, String? image});
}

/// @nodoc
class __$$VendorDataImplCopyWithImpl<$Res>
    extends _$VendorDataCopyWithImpl<$Res, _$VendorDataImpl>
    implements _$$VendorDataImplCopyWith<$Res> {
  __$$VendorDataImplCopyWithImpl(
      _$VendorDataImpl _value, $Res Function(_$VendorDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_$VendorDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as VendorName,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VendorDataImpl extends _VendorData {
  const _$VendorDataImpl({required this.name, this.image}) : super._();

  @override
  final VendorName name;
  @override
  final String? image;

  @override
  String toString() {
    return 'VendorData(name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorDataImplCopyWith<_$VendorDataImpl> get copyWith =>
      __$$VendorDataImplCopyWithImpl<_$VendorDataImpl>(this, _$identity);
}

abstract class _VendorData extends VendorData {
  const factory _VendorData(
      {required final VendorName name, final String? image}) = _$VendorDataImpl;
  const _VendorData._() : super._();

  @override
  VendorName get name;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$VendorDataImplCopyWith<_$VendorDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
