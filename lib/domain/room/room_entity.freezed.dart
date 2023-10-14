// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomEntity {
  RoomUniqueId get uniqueId => throw _privateConstructorUsedError;
  set uniqueId(RoomUniqueId value) => throw _privateConstructorUsedError;
  RoomDefaultName get cbjEntityName => throw _privateConstructorUsedError;
  set cbjEntityName(RoomDefaultName value) =>
      throw _privateConstructorUsedError;
  RoomBackground get background => throw _privateConstructorUsedError;
  set background(RoomBackground value) => throw _privateConstructorUsedError;
  RoomTypes get roomTypes => throw _privateConstructorUsedError;
  set roomTypes(RoomTypes value) => throw _privateConstructorUsedError;
  RoomDevicesId get roomDevicesId => throw _privateConstructorUsedError;
  set roomDevicesId(RoomDevicesId value) => throw _privateConstructorUsedError;
  RoomScenesId get roomScenesId => throw _privateConstructorUsedError;
  set roomScenesId(RoomScenesId value) => throw _privateConstructorUsedError;
  RoomRoutinesId get roomRoutinesId => throw _privateConstructorUsedError;
  set roomRoutinesId(RoomRoutinesId value) =>
      throw _privateConstructorUsedError;
  RoomBindingsId get roomBindingsId => throw _privateConstructorUsedError;
  set roomBindingsId(RoomBindingsId value) =>
      throw _privateConstructorUsedError;

  /// Who is using this room
  RoomMostUsedBy get roomMostUsedBy => throw _privateConstructorUsedError;

  /// Who is using this room
  set roomMostUsedBy(RoomMostUsedBy value) =>
      throw _privateConstructorUsedError;

  /// Room permissions by users id
  RoomPermissions get roomPermissions => throw _privateConstructorUsedError;

  /// Room permissions by users id
  set roomPermissions(RoomPermissions value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomEntityCopyWith<RoomEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEntityCopyWith<$Res> {
  factory $RoomEntityCopyWith(
          RoomEntity value, $Res Function(RoomEntity) then) =
      _$RoomEntityCopyWithImpl<$Res, RoomEntity>;
  @useResult
  $Res call(
      {RoomUniqueId uniqueId,
      RoomDefaultName cbjEntityName,
      RoomBackground background,
      RoomTypes roomTypes,
      RoomDevicesId roomDevicesId,
      RoomScenesId roomScenesId,
      RoomRoutinesId roomRoutinesId,
      RoomBindingsId roomBindingsId,
      RoomMostUsedBy roomMostUsedBy,
      RoomPermissions roomPermissions});
}

/// @nodoc
class _$RoomEntityCopyWithImpl<$Res, $Val extends RoomEntity>
    implements $RoomEntityCopyWith<$Res> {
  _$RoomEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueId = null,
    Object? cbjEntityName = null,
    Object? background = null,
    Object? roomTypes = null,
    Object? roomDevicesId = null,
    Object? roomScenesId = null,
    Object? roomRoutinesId = null,
    Object? roomBindingsId = null,
    Object? roomMostUsedBy = null,
    Object? roomPermissions = null,
  }) {
    return _then(_value.copyWith(
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as RoomUniqueId,
      cbjEntityName: null == cbjEntityName
          ? _value.cbjEntityName
          : cbjEntityName // ignore: cast_nullable_to_non_nullable
              as RoomDefaultName,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as RoomBackground,
      roomTypes: null == roomTypes
          ? _value.roomTypes
          : roomTypes // ignore: cast_nullable_to_non_nullable
              as RoomTypes,
      roomDevicesId: null == roomDevicesId
          ? _value.roomDevicesId
          : roomDevicesId // ignore: cast_nullable_to_non_nullable
              as RoomDevicesId,
      roomScenesId: null == roomScenesId
          ? _value.roomScenesId
          : roomScenesId // ignore: cast_nullable_to_non_nullable
              as RoomScenesId,
      roomRoutinesId: null == roomRoutinesId
          ? _value.roomRoutinesId
          : roomRoutinesId // ignore: cast_nullable_to_non_nullable
              as RoomRoutinesId,
      roomBindingsId: null == roomBindingsId
          ? _value.roomBindingsId
          : roomBindingsId // ignore: cast_nullable_to_non_nullable
              as RoomBindingsId,
      roomMostUsedBy: null == roomMostUsedBy
          ? _value.roomMostUsedBy
          : roomMostUsedBy // ignore: cast_nullable_to_non_nullable
              as RoomMostUsedBy,
      roomPermissions: null == roomPermissions
          ? _value.roomPermissions
          : roomPermissions // ignore: cast_nullable_to_non_nullable
              as RoomPermissions,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomEntityImplCopyWith<$Res>
    implements $RoomEntityCopyWith<$Res> {
  factory _$$RoomEntityImplCopyWith(
          _$RoomEntityImpl value, $Res Function(_$RoomEntityImpl) then) =
      __$$RoomEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RoomUniqueId uniqueId,
      RoomDefaultName cbjEntityName,
      RoomBackground background,
      RoomTypes roomTypes,
      RoomDevicesId roomDevicesId,
      RoomScenesId roomScenesId,
      RoomRoutinesId roomRoutinesId,
      RoomBindingsId roomBindingsId,
      RoomMostUsedBy roomMostUsedBy,
      RoomPermissions roomPermissions});
}

/// @nodoc
class __$$RoomEntityImplCopyWithImpl<$Res>
    extends _$RoomEntityCopyWithImpl<$Res, _$RoomEntityImpl>
    implements _$$RoomEntityImplCopyWith<$Res> {
  __$$RoomEntityImplCopyWithImpl(
      _$RoomEntityImpl _value, $Res Function(_$RoomEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueId = null,
    Object? cbjEntityName = null,
    Object? background = null,
    Object? roomTypes = null,
    Object? roomDevicesId = null,
    Object? roomScenesId = null,
    Object? roomRoutinesId = null,
    Object? roomBindingsId = null,
    Object? roomMostUsedBy = null,
    Object? roomPermissions = null,
  }) {
    return _then(_$RoomEntityImpl(
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as RoomUniqueId,
      cbjEntityName: null == cbjEntityName
          ? _value.cbjEntityName
          : cbjEntityName // ignore: cast_nullable_to_non_nullable
              as RoomDefaultName,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as RoomBackground,
      roomTypes: null == roomTypes
          ? _value.roomTypes
          : roomTypes // ignore: cast_nullable_to_non_nullable
              as RoomTypes,
      roomDevicesId: null == roomDevicesId
          ? _value.roomDevicesId
          : roomDevicesId // ignore: cast_nullable_to_non_nullable
              as RoomDevicesId,
      roomScenesId: null == roomScenesId
          ? _value.roomScenesId
          : roomScenesId // ignore: cast_nullable_to_non_nullable
              as RoomScenesId,
      roomRoutinesId: null == roomRoutinesId
          ? _value.roomRoutinesId
          : roomRoutinesId // ignore: cast_nullable_to_non_nullable
              as RoomRoutinesId,
      roomBindingsId: null == roomBindingsId
          ? _value.roomBindingsId
          : roomBindingsId // ignore: cast_nullable_to_non_nullable
              as RoomBindingsId,
      roomMostUsedBy: null == roomMostUsedBy
          ? _value.roomMostUsedBy
          : roomMostUsedBy // ignore: cast_nullable_to_non_nullable
              as RoomMostUsedBy,
      roomPermissions: null == roomPermissions
          ? _value.roomPermissions
          : roomPermissions // ignore: cast_nullable_to_non_nullable
              as RoomPermissions,
    ));
  }
}

/// @nodoc

class _$RoomEntityImpl extends _RoomEntity {
  _$RoomEntityImpl(
      {required this.uniqueId,
      required this.cbjEntityName,
      required this.background,
      required this.roomTypes,
      required this.roomDevicesId,
      required this.roomScenesId,
      required this.roomRoutinesId,
      required this.roomBindingsId,
      required this.roomMostUsedBy,
      required this.roomPermissions})
      : super._();

  @override
  RoomUniqueId uniqueId;
  @override
  RoomDefaultName cbjEntityName;
  @override
  RoomBackground background;
  @override
  RoomTypes roomTypes;
  @override
  RoomDevicesId roomDevicesId;
  @override
  RoomScenesId roomScenesId;
  @override
  RoomRoutinesId roomRoutinesId;
  @override
  RoomBindingsId roomBindingsId;

  /// Who is using this room
  @override
  RoomMostUsedBy roomMostUsedBy;

  /// Room permissions by users id
  @override
  RoomPermissions roomPermissions;

  @override
  String toString() {
    return 'RoomEntity(uniqueId: $uniqueId, cbjEntityName: $cbjEntityName, background: $background, roomTypes: $roomTypes, roomDevicesId: $roomDevicesId, roomScenesId: $roomScenesId, roomRoutinesId: $roomRoutinesId, roomBindingsId: $roomBindingsId, roomMostUsedBy: $roomMostUsedBy, roomPermissions: $roomPermissions)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      __$$RoomEntityImplCopyWithImpl<_$RoomEntityImpl>(this, _$identity);
}

abstract class _RoomEntity extends RoomEntity {
  factory _RoomEntity(
      {required RoomUniqueId uniqueId,
      required RoomDefaultName cbjEntityName,
      required RoomBackground background,
      required RoomTypes roomTypes,
      required RoomDevicesId roomDevicesId,
      required RoomScenesId roomScenesId,
      required RoomRoutinesId roomRoutinesId,
      required RoomBindingsId roomBindingsId,
      required RoomMostUsedBy roomMostUsedBy,
      required RoomPermissions roomPermissions}) = _$RoomEntityImpl;
  _RoomEntity._() : super._();

  @override
  RoomUniqueId get uniqueId;
  set uniqueId(RoomUniqueId value);
  @override
  RoomDefaultName get cbjEntityName;
  set cbjEntityName(RoomDefaultName value);
  @override
  RoomBackground get background;
  set background(RoomBackground value);
  @override
  RoomTypes get roomTypes;
  set roomTypes(RoomTypes value);
  @override
  RoomDevicesId get roomDevicesId;
  set roomDevicesId(RoomDevicesId value);
  @override
  RoomScenesId get roomScenesId;
  set roomScenesId(RoomScenesId value);
  @override
  RoomRoutinesId get roomRoutinesId;
  set roomRoutinesId(RoomRoutinesId value);
  @override
  RoomBindingsId get roomBindingsId;
  set roomBindingsId(RoomBindingsId value);
  @override

  /// Who is using this room
  RoomMostUsedBy get roomMostUsedBy;

  /// Who is using this room
  set roomMostUsedBy(RoomMostUsedBy value);
  @override

  /// Room permissions by users id
  RoomPermissions get roomPermissions;

  /// Room permissions by users id
  set roomPermissions(RoomPermissions value);
  @override
  @JsonKey(ignore: true)
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
