// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_db_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalDbEntity {
  LocalDbUniqueId? get id => throw _privateConstructorUsedError;
  LocalDbEmail? get email => throw _privateConstructorUsedError;
  LocalDbName? get name => throw _privateConstructorUsedError;
  LocalDbPass? get pass => throw _privateConstructorUsedError;
  LocalDbFirstName? get firstName => throw _privateConstructorUsedError;
  LocalDbLastName? get lastName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalDbEntityCopyWith<LocalDbEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalDbEntityCopyWith<$Res> {
  factory $LocalDbEntityCopyWith(
          LocalDbEntity value, $Res Function(LocalDbEntity) then) =
      _$LocalDbEntityCopyWithImpl<$Res, LocalDbEntity>;
  @useResult
  $Res call(
      {LocalDbUniqueId? id,
      LocalDbEmail? email,
      LocalDbName? name,
      LocalDbPass? pass,
      LocalDbFirstName? firstName,
      LocalDbLastName? lastName});
}

/// @nodoc
class _$LocalDbEntityCopyWithImpl<$Res, $Val extends LocalDbEntity>
    implements $LocalDbEntityCopyWith<$Res> {
  _$LocalDbEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? pass = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as LocalDbUniqueId?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as LocalDbEmail?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalDbName?,
      pass: freezed == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as LocalDbPass?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as LocalDbFirstName?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as LocalDbLastName?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalDbEntityImplCopyWith<$Res>
    implements $LocalDbEntityCopyWith<$Res> {
  factory _$$LocalDbEntityImplCopyWith(
          _$LocalDbEntityImpl value, $Res Function(_$LocalDbEntityImpl) then) =
      __$$LocalDbEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocalDbUniqueId? id,
      LocalDbEmail? email,
      LocalDbName? name,
      LocalDbPass? pass,
      LocalDbFirstName? firstName,
      LocalDbLastName? lastName});
}

/// @nodoc
class __$$LocalDbEntityImplCopyWithImpl<$Res>
    extends _$LocalDbEntityCopyWithImpl<$Res, _$LocalDbEntityImpl>
    implements _$$LocalDbEntityImplCopyWith<$Res> {
  __$$LocalDbEntityImplCopyWithImpl(
      _$LocalDbEntityImpl _value, $Res Function(_$LocalDbEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? pass = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$LocalDbEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as LocalDbUniqueId?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as LocalDbEmail?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalDbName?,
      pass: freezed == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as LocalDbPass?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as LocalDbFirstName?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as LocalDbLastName?,
    ));
  }
}

/// @nodoc

class _$LocalDbEntityImpl extends _LocalDbEntity {
  const _$LocalDbEntityImpl(
      {required this.id,
      required this.email,
      required this.name,
      this.pass,
      this.firstName,
      this.lastName})
      : super._();

  @override
  final LocalDbUniqueId? id;
  @override
  final LocalDbEmail? email;
  @override
  final LocalDbName? name;
  @override
  final LocalDbPass? pass;
  @override
  final LocalDbFirstName? firstName;
  @override
  final LocalDbLastName? lastName;

  @override
  String toString() {
    return 'LocalDbEntity(id: $id, email: $email, name: $name, pass: $pass, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalDbEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, pass, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalDbEntityImplCopyWith<_$LocalDbEntityImpl> get copyWith =>
      __$$LocalDbEntityImplCopyWithImpl<_$LocalDbEntityImpl>(this, _$identity);
}

abstract class _LocalDbEntity extends LocalDbEntity {
  const factory _LocalDbEntity(
      {required final LocalDbUniqueId? id,
      required final LocalDbEmail? email,
      required final LocalDbName? name,
      final LocalDbPass? pass,
      final LocalDbFirstName? firstName,
      final LocalDbLastName? lastName}) = _$LocalDbEntityImpl;
  const _LocalDbEntity._() : super._();

  @override
  LocalDbUniqueId? get id;
  @override
  LocalDbEmail? get email;
  @override
  LocalDbName? get name;
  @override
  LocalDbPass? get pass;
  @override
  LocalDbFirstName? get firstName;
  @override
  LocalDbLastName? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$LocalDbEntityImplCopyWith<_$LocalDbEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
