// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_login_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoreLoginValueFailure<T> {
  CoreLoginFailure<T> get f => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CoreLoginFailure<T> f) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CoreLoginFailure<T> f)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CoreLoginFailure<T> f)? auth,
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
  $CoreLoginValueFailureCopyWith<T, CoreLoginValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreLoginValueFailureCopyWith<T, $Res> {
  factory $CoreLoginValueFailureCopyWith(CoreLoginValueFailure<T> value,
          $Res Function(CoreLoginValueFailure<T>) then) =
      _$CoreLoginValueFailureCopyWithImpl<T, $Res, CoreLoginValueFailure<T>>;
  @useResult
  $Res call({CoreLoginFailure<T> f});

  $CoreLoginFailureCopyWith<T, $Res> get f;
}

/// @nodoc
class _$CoreLoginValueFailureCopyWithImpl<T, $Res,
        $Val extends CoreLoginValueFailure<T>>
    implements $CoreLoginValueFailureCopyWith<T, $Res> {
  _$CoreLoginValueFailureCopyWithImpl(this._value, this._then);

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
              as CoreLoginFailure<T>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoreLoginFailureCopyWith<T, $Res> get f {
    return $CoreLoginFailureCopyWith<T, $Res>(_value.f, (value) {
      return _then(_value.copyWith(f: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthImplCopyWith<T, $Res>
    implements $CoreLoginValueFailureCopyWith<T, $Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl<T> value, $Res Function(_$AuthImpl<T>) then) =
      __$$AuthImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({CoreLoginFailure<T> f});

  @override
  $CoreLoginFailureCopyWith<T, $Res> get f;
}

/// @nodoc
class __$$AuthImplCopyWithImpl<T, $Res>
    extends _$CoreLoginValueFailureCopyWithImpl<T, $Res, _$AuthImpl<T>>
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
              as CoreLoginFailure<T>,
    ));
  }
}

/// @nodoc

class _$AuthImpl<T> implements _Auth<T> {
  const _$AuthImpl(this.f);

  @override
  final CoreLoginFailure<T> f;

  @override
  String toString() {
    return 'CoreLoginValueFailure<$T>.auth(f: $f)';
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
    required TResult Function(CoreLoginFailure<T> f) auth,
  }) {
    return auth(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CoreLoginFailure<T> f)? auth,
  }) {
    return auth?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CoreLoginFailure<T> f)? auth,
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

abstract class _Auth<T> implements CoreLoginValueFailure<T> {
  const factory _Auth(final CoreLoginFailure<T> f) = _$AuthImpl<T>;

  @override
  CoreLoginFailure<T> get f;
  @override
  @JsonKey(ignore: true)
  _$$AuthImplCopyWith<T, _$AuthImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CoreLoginFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValueFailure, int max)
        exceedingLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String failedValue)? empty,
    TResult? Function(String failedValueFailure, int max)? exceedingLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValueFailure, int max)? exceedingLength,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceedingLength<T> value) exceedingLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_ExceedingLength<T> value)? exceedingLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceedingLength<T> value)? exceedingLength,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreLoginFailureCopyWith<T, $Res> {
  factory $CoreLoginFailureCopyWith(
          CoreLoginFailure<T> value, $Res Function(CoreLoginFailure<T>) then) =
      _$CoreLoginFailureCopyWithImpl<T, $Res, CoreLoginFailure<T>>;
}

/// @nodoc
class _$CoreLoginFailureCopyWithImpl<T, $Res, $Val extends CoreLoginFailure<T>>
    implements $CoreLoginFailureCopyWith<T, $Res> {
  _$CoreLoginFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<T, $Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl<T> value, $Res Function(_$UnexpectedImpl<T>) then) =
      __$$UnexpectedImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<T, $Res>
    extends _$CoreLoginFailureCopyWithImpl<T, $Res, _$UnexpectedImpl<T>>
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
    return 'CoreLoginFailure<$T>.unexpected()';
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
    required TResult Function() unexpected,
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValueFailure, int max)
        exceedingLength,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String failedValue)? empty,
    TResult? Function(String failedValueFailure, int max)? exceedingLength,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValueFailure, int max)? exceedingLength,
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
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceedingLength<T> value) exceedingLength,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_ExceedingLength<T> value)? exceedingLength,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceedingLength<T> value)? exceedingLength,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected<T> implements CoreLoginFailure<T> {
  const factory _Unexpected() = _$UnexpectedImpl<T>;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<T, $Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl<T> value, $Res Function(_$EmptyImpl<T>) then) =
      __$$EmptyImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<T, $Res>
    extends _$CoreLoginFailureCopyWithImpl<T, $Res, _$EmptyImpl<T>>
    implements _$$EmptyImplCopyWith<T, $Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl<T> _value, $Res Function(_$EmptyImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$EmptyImpl<T>(
      failedValue: null == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyImpl<T> implements _Empty<T> {
  const _$EmptyImpl({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'CoreLoginFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyImpl<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      __$$EmptyImplCopyWithImpl<T, _$EmptyImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValueFailure, int max)
        exceedingLength,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String failedValue)? empty,
    TResult? Function(String failedValueFailure, int max)? exceedingLength,
  }) {
    return empty?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValueFailure, int max)? exceedingLength,
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
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceedingLength<T> value) exceedingLength,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_ExceedingLength<T> value)? exceedingLength,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceedingLength<T> value)? exceedingLength,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements CoreLoginFailure<T> {
  const factory _Empty({required final String failedValue}) = _$EmptyImpl<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$EmptyImplCopyWith<T, _$EmptyImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExceedingLengthImplCopyWith<T, $Res> {
  factory _$$ExceedingLengthImplCopyWith(_$ExceedingLengthImpl<T> value,
          $Res Function(_$ExceedingLengthImpl<T>) then) =
      __$$ExceedingLengthImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValueFailure, int max});
}

/// @nodoc
class __$$ExceedingLengthImplCopyWithImpl<T, $Res>
    extends _$CoreLoginFailureCopyWithImpl<T, $Res, _$ExceedingLengthImpl<T>>
    implements _$$ExceedingLengthImplCopyWith<T, $Res> {
  __$$ExceedingLengthImplCopyWithImpl(_$ExceedingLengthImpl<T> _value,
      $Res Function(_$ExceedingLengthImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValueFailure = null,
    Object? max = null,
  }) {
    return _then(_$ExceedingLengthImpl<T>(
      failedValueFailure: null == failedValueFailure
          ? _value.failedValueFailure
          : failedValueFailure // ignore: cast_nullable_to_non_nullable
              as String,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExceedingLengthImpl<T> implements _ExceedingLength<T> {
  const _$ExceedingLengthImpl(
      {required this.failedValueFailure, required this.max});

  @override
  final String failedValueFailure;
  @override
  final int max;

  @override
  String toString() {
    return 'CoreLoginFailure<$T>.exceedingLength(failedValueFailure: $failedValueFailure, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceedingLengthImpl<T> &&
            (identical(other.failedValueFailure, failedValueFailure) ||
                other.failedValueFailure == failedValueFailure) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValueFailure, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceedingLengthImplCopyWith<T, _$ExceedingLengthImpl<T>> get copyWith =>
      __$$ExceedingLengthImplCopyWithImpl<T, _$ExceedingLengthImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String failedValue) empty,
    required TResult Function(String failedValueFailure, int max)
        exceedingLength,
  }) {
    return exceedingLength(failedValueFailure, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String failedValue)? empty,
    TResult? Function(String failedValueFailure, int max)? exceedingLength,
  }) {
    return exceedingLength?.call(failedValueFailure, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String failedValue)? empty,
    TResult Function(String failedValueFailure, int max)? exceedingLength,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(failedValueFailure, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceedingLength<T> value) exceedingLength,
  }) {
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_ExceedingLength<T> value)? exceedingLength,
  }) {
    return exceedingLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceedingLength<T> value)? exceedingLength,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class _ExceedingLength<T> implements CoreLoginFailure<T> {
  const factory _ExceedingLength(
      {required final String failedValueFailure,
      required final int max}) = _$ExceedingLengthImpl<T>;

  String get failedValueFailure;
  int get max;
  @JsonKey(ignore: true)
  _$$ExceedingLengthImplCopyWith<T, _$ExceedingLengthImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
