// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VendorValueFailure<T> {
  VendorFailure<T> get f => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VendorFailure<T> f) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VendorFailure<T> f)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VendorFailure<T> f)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Auth<T> value) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Auth<T> value)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Auth<T> value)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VendorValueFailureCopyWith<T, VendorValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorValueFailureCopyWith<T, $Res> {
  factory $VendorValueFailureCopyWith(VendorValueFailure<T> value,
          $Res Function(VendorValueFailure<T>) then) =
      _$VendorValueFailureCopyWithImpl<T, $Res, VendorValueFailure<T>>;
  @useResult
  $Res call({VendorFailure<T> f});

  $VendorFailureCopyWith<T, $Res> get f;
}

/// @nodoc
class _$VendorValueFailureCopyWithImpl<T, $Res,
        $Val extends VendorValueFailure<T>>
    implements $VendorValueFailureCopyWith<T, $Res> {
  _$VendorValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = null,
  }) {
    return _then(_value.copyWith(
      f: null == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as VendorFailure<T>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VendorFailureCopyWith<T, $Res> get f {
    return $VendorFailureCopyWith<T, $Res>(_value.f, (value) {
      return _then(_value.copyWith(f: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthImplCopyWith<T, $Res>
    implements $VendorValueFailureCopyWith<T, $Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl<T> value, $Res Function(_$AuthImpl<T>) then) =
      __$$AuthImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({VendorFailure<T> f});

  @override
  $VendorFailureCopyWith<T, $Res> get f;
}

/// @nodoc
class __$$AuthImplCopyWithImpl<T, $Res>
    extends _$VendorValueFailureCopyWithImpl<T, $Res, _$AuthImpl<T>>
    implements _$$AuthImplCopyWith<T, $Res> {
  __$$AuthImplCopyWithImpl(
      _$AuthImpl<T> _value, $Res Function(_$AuthImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = null,
  }) {
    return _then(_$AuthImpl<T>(
      null == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as VendorFailure<T>,
    ));
  }
}

/// @nodoc

class _$AuthImpl<T> implements _Auth<T> {
  const _$AuthImpl(this.f);

  @override
  final VendorFailure<T> f;

  @override
  String toString() {
    return 'VendorValueFailure<$T>.auth(f: $f)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl<T> &&
            (identical(other.f, f) || other.f == f));
  }

  @override
  int get hashCode => Object.hash(runtimeType, f);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<T, _$AuthImpl<T>> get copyWith =>
      __$$AuthImplCopyWithImpl<T, _$AuthImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VendorFailure<T> f) auth,
  }) {
    return auth(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VendorFailure<T> f)? auth,
  }) {
    return auth?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VendorFailure<T> f)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Auth<T> value) auth,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Auth<T> value)? auth,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Auth<T> value)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _Auth<T> implements VendorValueFailure<T> {
  const factory _Auth(final VendorFailure<T> f) = _$AuthImpl<T>;

  @override
  VendorFailure<T> get f;
  @override
  @JsonKey(ignore: true)
  _$$AuthImplCopyWith<T, _$AuthImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VendorFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorFailureCopyWith<T, $Res> {
  factory $VendorFailureCopyWith(
          VendorFailure<T> value, $Res Function(VendorFailure<T>) then) =
      _$VendorFailureCopyWithImpl<T, $Res, VendorFailure<T>>;
}

/// @nodoc
class _$VendorFailureCopyWithImpl<T, $Res, $Val extends VendorFailure<T>>
    implements $VendorFailureCopyWith<T, $Res> {
  _$VendorFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<T, $Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl<T> value, $Res Function(_$EmptyImpl<T>) then) =
      __$$EmptyImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res, _$EmptyImpl<T>>
    implements _$$EmptyImplCopyWith<T, $Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl<T> _value, $Res Function(_$EmptyImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmptyImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EmptyImpl<T> implements _Empty<T> {
  const _$EmptyImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'VendorFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      __$$EmptyImplCopyWithImpl<T, _$EmptyImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements VendorFailure<T> {
  const factory _Empty({required final T failedValue}) = _$EmptyImpl<T>;

  T get failedValue;
  @JsonKey(ignore: true)
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<T, $Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl<T> value, $Res Function(_$UnexpectedImpl<T>) then) =
      __$$UnexpectedImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res, _$UnexpectedImpl<T>>
    implements _$$UnexpectedImplCopyWith<T, $Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl<T> _value, $Res Function(_$UnexpectedImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedImpl<T> implements _Unexpected<T> {
  const _$UnexpectedImpl();

  @override
  String toString() {
    return 'VendorFailure<$T>.unexpected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected<T> implements VendorFailure<T> {
  const factory _Unexpected() = _$UnexpectedImpl<T>;
}

/// @nodoc
abstract class _$$ValidateEmailNotEmptyImplCopyWith<T, $Res> {
  factory _$$ValidateEmailNotEmptyImplCopyWith(
          _$ValidateEmailNotEmptyImpl<T> value,
          $Res Function(_$ValidateEmailNotEmptyImpl<T>) then) =
      __$$ValidateEmailNotEmptyImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ValidateEmailNotEmptyImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res, _$ValidateEmailNotEmptyImpl<T>>
    implements _$$ValidateEmailNotEmptyImplCopyWith<T, $Res> {
  __$$ValidateEmailNotEmptyImplCopyWithImpl(
      _$ValidateEmailNotEmptyImpl<T> _value,
      $Res Function(_$ValidateEmailNotEmptyImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateEmailNotEmptyImpl<T> implements _ValidateEmailNotEmpty<T> {
  const _$ValidateEmailNotEmptyImpl();

  @override
  String toString() {
    return 'VendorFailure<$T>.validateEmailNotEmpty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateEmailNotEmptyImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return validateEmailNotEmpty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return validateEmailNotEmpty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (validateEmailNotEmpty != null) {
      return validateEmailNotEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return validateEmailNotEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return validateEmailNotEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (validateEmailNotEmpty != null) {
      return validateEmailNotEmpty(this);
    }
    return orElse();
  }
}

abstract class _ValidateEmailNotEmpty<T> implements VendorFailure<T> {
  const factory _ValidateEmailNotEmpty() = _$ValidateEmailNotEmptyImpl<T>;
}

/// @nodoc
abstract class _$$InsufficientPermissionImplCopyWith<T, $Res> {
  factory _$$InsufficientPermissionImplCopyWith(
          _$InsufficientPermissionImpl<T> value,
          $Res Function(_$InsufficientPermissionImpl<T>) then) =
      __$$InsufficientPermissionImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InsufficientPermissionImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res,
        _$InsufficientPermissionImpl<T>>
    implements _$$InsufficientPermissionImplCopyWith<T, $Res> {
  __$$InsufficientPermissionImplCopyWithImpl(
      _$InsufficientPermissionImpl<T> _value,
      $Res Function(_$InsufficientPermissionImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InsufficientPermissionImpl<T> implements _InsufficientPermission<T> {
  const _$InsufficientPermissionImpl();

  @override
  String toString() {
    return 'VendorFailure<$T>.insufficientPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsufficientPermissionImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return insufficientPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return insufficientPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return insufficientPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return insufficientPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission(this);
    }
    return orElse();
  }
}

abstract class _InsufficientPermission<T> implements VendorFailure<T> {
  const factory _InsufficientPermission() = _$InsufficientPermissionImpl<T>;
}

/// @nodoc
abstract class _$$wifiIsClosedImplCopyWith<T, $Res> {
  factory _$$wifiIsClosedImplCopyWith(_$wifiIsClosedImpl<T> value,
          $Res Function(_$wifiIsClosedImpl<T>) then) =
      __$$wifiIsClosedImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$wifiIsClosedImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res, _$wifiIsClosedImpl<T>>
    implements _$$wifiIsClosedImplCopyWith<T, $Res> {
  __$$wifiIsClosedImplCopyWithImpl(
      _$wifiIsClosedImpl<T> _value, $Res Function(_$wifiIsClosedImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$wifiIsClosedImpl<T> implements _wifiIsClosed<T> {
  const _$wifiIsClosedImpl();

  @override
  String toString() {
    return 'VendorFailure<$T>.wifiIsClosed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$wifiIsClosedImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return wifiIsClosed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return wifiIsClosed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (wifiIsClosed != null) {
      return wifiIsClosed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return wifiIsClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return wifiIsClosed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (wifiIsClosed != null) {
      return wifiIsClosed(this);
    }
    return orElse();
  }
}

abstract class _wifiIsClosed<T> implements VendorFailure<T> {
  const factory _wifiIsClosed() = _$wifiIsClosedImpl<T>;
}

/// @nodoc
abstract class _$$UnableToUpdateImplCopyWith<T, $Res> {
  factory _$$UnableToUpdateImplCopyWith(_$UnableToUpdateImpl<T> value,
          $Res Function(_$UnableToUpdateImpl<T>) then) =
      __$$UnableToUpdateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnableToUpdateImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res, _$UnableToUpdateImpl<T>>
    implements _$$UnableToUpdateImplCopyWith<T, $Res> {
  __$$UnableToUpdateImplCopyWithImpl(_$UnableToUpdateImpl<T> _value,
      $Res Function(_$UnableToUpdateImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnableToUpdateImpl<T> implements _UnableToUpdate<T> {
  const _$UnableToUpdateImpl();

  @override
  String toString() {
    return 'VendorFailure<$T>.unableToUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnableToUpdateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return unableToUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return unableToUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return unableToUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return unableToUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate(this);
    }
    return orElse();
  }
}

abstract class _UnableToUpdate<T> implements VendorFailure<T> {
  const factory _UnableToUpdate() = _$UnableToUpdateImpl<T>;
}

/// @nodoc
abstract class _$$VendorTypeDoesNotExistImplCopyWith<T, $Res> {
  factory _$$VendorTypeDoesNotExistImplCopyWith(
          _$VendorTypeDoesNotExistImpl<T> value,
          $Res Function(_$VendorTypeDoesNotExistImpl<T>) then) =
      __$$VendorTypeDoesNotExistImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$VendorTypeDoesNotExistImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res,
        _$VendorTypeDoesNotExistImpl<T>>
    implements _$$VendorTypeDoesNotExistImplCopyWith<T, $Res> {
  __$$VendorTypeDoesNotExistImplCopyWithImpl(
      _$VendorTypeDoesNotExistImpl<T> _value,
      $Res Function(_$VendorTypeDoesNotExistImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VendorTypeDoesNotExistImpl<T> implements _VendorTypeDoesNotExist<T> {
  const _$VendorTypeDoesNotExistImpl();

  @override
  String toString() {
    return 'VendorFailure<$T>.vendorTypeDoesNotExist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorTypeDoesNotExistImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return vendorTypeDoesNotExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return vendorTypeDoesNotExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (vendorTypeDoesNotExist != null) {
      return vendorTypeDoesNotExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return vendorTypeDoesNotExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return vendorTypeDoesNotExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (vendorTypeDoesNotExist != null) {
      return vendorTypeDoesNotExist(this);
    }
    return orElse();
  }
}

abstract class _VendorTypeDoesNotExist<T> implements VendorFailure<T> {
  const factory _VendorTypeDoesNotExist() = _$VendorTypeDoesNotExistImpl<T>;
}

/// @nodoc
abstract class _$$LoginTypeDoesNotExistImplCopyWith<T, $Res> {
  factory _$$LoginTypeDoesNotExistImplCopyWith(
          _$LoginTypeDoesNotExistImpl<T> value,
          $Res Function(_$LoginTypeDoesNotExistImpl<T>) then) =
      __$$LoginTypeDoesNotExistImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoginTypeDoesNotExistImplCopyWithImpl<T, $Res>
    extends _$VendorFailureCopyWithImpl<T, $Res, _$LoginTypeDoesNotExistImpl<T>>
    implements _$$LoginTypeDoesNotExistImplCopyWith<T, $Res> {
  __$$LoginTypeDoesNotExistImplCopyWithImpl(
      _$LoginTypeDoesNotExistImpl<T> _value,
      $Res Function(_$LoginTypeDoesNotExistImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginTypeDoesNotExistImpl<T> implements _LoginTypeDoesNotExist<T> {
  const _$LoginTypeDoesNotExistImpl();

  @override
  String toString() {
    return 'VendorFailure<$T>.loginTypeDoesNotExist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginTypeDoesNotExistImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) empty,
    required TResult Function() unexpected,
    required TResult Function() validateEmailNotEmpty,
    required TResult Function() insufficientPermission,
    required TResult Function() wifiIsClosed,
    required TResult Function() unableToUpdate,
    required TResult Function() vendorTypeDoesNotExist,
    required TResult Function() loginTypeDoesNotExist,
  }) {
    return loginTypeDoesNotExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? empty,
    TResult? Function()? unexpected,
    TResult? Function()? validateEmailNotEmpty,
    TResult? Function()? insufficientPermission,
    TResult? Function()? wifiIsClosed,
    TResult? Function()? unableToUpdate,
    TResult? Function()? vendorTypeDoesNotExist,
    TResult? Function()? loginTypeDoesNotExist,
  }) {
    return loginTypeDoesNotExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? empty,
    TResult Function()? unexpected,
    TResult Function()? validateEmailNotEmpty,
    TResult Function()? insufficientPermission,
    TResult Function()? wifiIsClosed,
    TResult Function()? unableToUpdate,
    TResult Function()? vendorTypeDoesNotExist,
    TResult Function()? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (loginTypeDoesNotExist != null) {
      return loginTypeDoesNotExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_ValidateEmailNotEmpty<T> value)
        validateEmailNotEmpty,
    required TResult Function(_InsufficientPermission<T> value)
        insufficientPermission,
    required TResult Function(_wifiIsClosed<T> value) wifiIsClosed,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
    required TResult Function(_VendorTypeDoesNotExist<T> value)
        vendorTypeDoesNotExist,
    required TResult Function(_LoginTypeDoesNotExist<T> value)
        loginTypeDoesNotExist,
  }) {
    return loginTypeDoesNotExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult? Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult? Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult? Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult? Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
  }) {
    return loginTypeDoesNotExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_ValidateEmailNotEmpty<T> value)? validateEmailNotEmpty,
    TResult Function(_InsufficientPermission<T> value)? insufficientPermission,
    TResult Function(_wifiIsClosed<T> value)? wifiIsClosed,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    TResult Function(_VendorTypeDoesNotExist<T> value)? vendorTypeDoesNotExist,
    TResult Function(_LoginTypeDoesNotExist<T> value)? loginTypeDoesNotExist,
    required TResult orElse(),
  }) {
    if (loginTypeDoesNotExist != null) {
      return loginTypeDoesNotExist(this);
    }
    return orElse();
  }
}

abstract class _LoginTypeDoesNotExist<T> implements VendorFailure<T> {
  const factory _LoginTypeDoesNotExist() = _$LoginTypeDoesNotExistImpl<T>;
}
