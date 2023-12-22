// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_entity_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomEntityDtos _$RoomEntityDtosFromJson(Map<String, dynamic> json) {
  return _RoomEntityDtos.fromJson(json);
}

/// @nodoc
mixin _$RoomEntityDtos {
  String get uniqueId => throw _privateConstructorUsedError;
  String get cbjEntityName => throw _privateConstructorUsedError;
  String get background => throw _privateConstructorUsedError;
  Set<String> get roomTypes => throw _privateConstructorUsedError;
  Set<String> get roomDevicesId => throw _privateConstructorUsedError;
  Set<String> get roomScenesId => throw _privateConstructorUsedError;
  Set<String> get roomRoutinesId => throw _privateConstructorUsedError;
  Set<String> get roomBindingsId => throw _privateConstructorUsedError;

  /// Who is using this room
  Set<String> get roomMostUsedBy => throw _privateConstructorUsedError;

  /// Room permissions by users id
  Set<String> get roomPermissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomEntityDtosCopyWith<RoomEntityDtos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEntityDtosCopyWith<$Res> {
  factory $RoomEntityDtosCopyWith(
          RoomEntityDtos value, $Res Function(RoomEntityDtos) then) =
      _$RoomEntityDtosCopyWithImpl<$Res, RoomEntityDtos>;
  @useResult
  $Res call(
      {String uniqueId,
      String cbjEntityName,
      String background,
      Set<String> roomTypes,
      Set<String> roomDevicesId,
      Set<String> roomScenesId,
      Set<String> roomRoutinesId,
      Set<String> roomBindingsId,
      Set<String> roomMostUsedBy,
      Set<String> roomPermissions});
}

/// @nodoc
class _$RoomEntityDtosCopyWithImpl<$Res, $Val extends RoomEntityDtos>
    implements $RoomEntityDtosCopyWith<$Res> {
  _$RoomEntityDtosCopyWithImpl(this._value, this._then);

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
              as String,
      cbjEntityName: null == cbjEntityName
          ? _value.cbjEntityName
          : cbjEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
      roomTypes: null == roomTypes
          ? _value.roomTypes
          : roomTypes // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomDevicesId: null == roomDevicesId
          ? _value.roomDevicesId
          : roomDevicesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomScenesId: null == roomScenesId
          ? _value.roomScenesId
          : roomScenesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomRoutinesId: null == roomRoutinesId
          ? _value.roomRoutinesId
          : roomRoutinesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomBindingsId: null == roomBindingsId
          ? _value.roomBindingsId
          : roomBindingsId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomMostUsedBy: null == roomMostUsedBy
          ? _value.roomMostUsedBy
          : roomMostUsedBy // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomPermissions: null == roomPermissions
          ? _value.roomPermissions
          : roomPermissions // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomEntityDtosImplCopyWith<$Res>
    implements $RoomEntityDtosCopyWith<$Res> {
  factory _$$RoomEntityDtosImplCopyWith(_$RoomEntityDtosImpl value,
          $Res Function(_$RoomEntityDtosImpl) then) =
      __$$RoomEntityDtosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uniqueId,
      String cbjEntityName,
      String background,
      Set<String> roomTypes,
      Set<String> roomDevicesId,
      Set<String> roomScenesId,
      Set<String> roomRoutinesId,
      Set<String> roomBindingsId,
      Set<String> roomMostUsedBy,
      Set<String> roomPermissions});
}

/// @nodoc
class __$$RoomEntityDtosImplCopyWithImpl<$Res>
    extends _$RoomEntityDtosCopyWithImpl<$Res, _$RoomEntityDtosImpl>
    implements _$$RoomEntityDtosImplCopyWith<$Res> {
  __$$RoomEntityDtosImplCopyWithImpl(
      _$RoomEntityDtosImpl _value, $Res Function(_$RoomEntityDtosImpl) _then)
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
    return _then(_$RoomEntityDtosImpl(
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      cbjEntityName: null == cbjEntityName
          ? _value.cbjEntityName
          : cbjEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
      roomTypes: null == roomTypes
          ? _value._roomTypes
          : roomTypes // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomDevicesId: null == roomDevicesId
          ? _value._roomDevicesId
          : roomDevicesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomScenesId: null == roomScenesId
          ? _value._roomScenesId
          : roomScenesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomRoutinesId: null == roomRoutinesId
          ? _value._roomRoutinesId
          : roomRoutinesId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomBindingsId: null == roomBindingsId
          ? _value._roomBindingsId
          : roomBindingsId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomMostUsedBy: null == roomMostUsedBy
          ? _value._roomMostUsedBy
          : roomMostUsedBy // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      roomPermissions: null == roomPermissions
          ? _value._roomPermissions
          : roomPermissions // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomEntityDtosImpl extends _RoomEntityDtos {
  _$RoomEntityDtosImpl(
      {required this.uniqueId,
      required this.cbjEntityName,
      required this.background,
      required final Set<String> roomTypes,
      required final Set<String> roomDevicesId,
      required final Set<String> roomScenesId,
      required final Set<String> roomRoutinesId,
      required final Set<String> roomBindingsId,
      required final Set<String> roomMostUsedBy,
      required final Set<String> roomPermissions})
      : _roomTypes = roomTypes,
        _roomDevicesId = roomDevicesId,
        _roomScenesId = roomScenesId,
        _roomRoutinesId = roomRoutinesId,
        _roomBindingsId = roomBindingsId,
        _roomMostUsedBy = roomMostUsedBy,
        _roomPermissions = roomPermissions,
        super._();

  factory _$RoomEntityDtosImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomEntityDtosImplFromJson(json);

  @override
  final String uniqueId;
  @override
  final String cbjEntityName;
  @override
  final String background;
  final Set<String> _roomTypes;
  @override
  Set<String> get roomTypes {
    if (_roomTypes is EqualUnmodifiableSetView) return _roomTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_roomTypes);
  }

  final Set<String> _roomDevicesId;
  @override
  Set<String> get roomDevicesId {
    if (_roomDevicesId is EqualUnmodifiableSetView) return _roomDevicesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_roomDevicesId);
  }

  final Set<String> _roomScenesId;
  @override
  Set<String> get roomScenesId {
    if (_roomScenesId is EqualUnmodifiableSetView) return _roomScenesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_roomScenesId);
  }

  final Set<String> _roomRoutinesId;
  @override
  Set<String> get roomRoutinesId {
    if (_roomRoutinesId is EqualUnmodifiableSetView) return _roomRoutinesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_roomRoutinesId);
  }

  final Set<String> _roomBindingsId;
  @override
  Set<String> get roomBindingsId {
    if (_roomBindingsId is EqualUnmodifiableSetView) return _roomBindingsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_roomBindingsId);
  }

  /// Who is using this room
  final Set<String> _roomMostUsedBy;

  /// Who is using this room
  @override
  Set<String> get roomMostUsedBy {
    if (_roomMostUsedBy is EqualUnmodifiableSetView) return _roomMostUsedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_roomMostUsedBy);
  }

  /// Room permissions by users id
  final Set<String> _roomPermissions;

  /// Room permissions by users id
  @override
  Set<String> get roomPermissions {
    if (_roomPermissions is EqualUnmodifiableSetView) return _roomPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_roomPermissions);
  }

  @override
  String toString() {
    return 'RoomEntityDtos(uniqueId: $uniqueId, cbjEntityName: $cbjEntityName, background: $background, roomTypes: $roomTypes, roomDevicesId: $roomDevicesId, roomScenesId: $roomScenesId, roomRoutinesId: $roomRoutinesId, roomBindingsId: $roomBindingsId, roomMostUsedBy: $roomMostUsedBy, roomPermissions: $roomPermissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomEntityDtosImpl &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.cbjEntityName, cbjEntityName) ||
                other.cbjEntityName == cbjEntityName) &&
            (identical(other.background, background) ||
                other.background == background) &&
            const DeepCollectionEquality()
                .equals(other._roomTypes, _roomTypes) &&
            const DeepCollectionEquality()
                .equals(other._roomDevicesId, _roomDevicesId) &&
            const DeepCollectionEquality()
                .equals(other._roomScenesId, _roomScenesId) &&
            const DeepCollectionEquality()
                .equals(other._roomRoutinesId, _roomRoutinesId) &&
            const DeepCollectionEquality()
                .equals(other._roomBindingsId, _roomBindingsId) &&
            const DeepCollectionEquality()
                .equals(other._roomMostUsedBy, _roomMostUsedBy) &&
            const DeepCollectionEquality()
                .equals(other._roomPermissions, _roomPermissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uniqueId,
      cbjEntityName,
      background,
      const DeepCollectionEquality().hash(_roomTypes),
      const DeepCollectionEquality().hash(_roomDevicesId),
      const DeepCollectionEquality().hash(_roomScenesId),
      const DeepCollectionEquality().hash(_roomRoutinesId),
      const DeepCollectionEquality().hash(_roomBindingsId),
      const DeepCollectionEquality().hash(_roomMostUsedBy),
      const DeepCollectionEquality().hash(_roomPermissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomEntityDtosImplCopyWith<_$RoomEntityDtosImpl> get copyWith =>
      __$$RoomEntityDtosImplCopyWithImpl<_$RoomEntityDtosImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomEntityDtosImplToJson(
      this,
    );
  }
}

abstract class _RoomEntityDtos extends RoomEntityDtos {
  factory _RoomEntityDtos(
      {required final String uniqueId,
      required final String cbjEntityName,
      required final String background,
      required final Set<String> roomTypes,
      required final Set<String> roomDevicesId,
      required final Set<String> roomScenesId,
      required final Set<String> roomRoutinesId,
      required final Set<String> roomBindingsId,
      required final Set<String> roomMostUsedBy,
      required final Set<String> roomPermissions}) = _$RoomEntityDtosImpl;
  _RoomEntityDtos._() : super._();

  factory _RoomEntityDtos.fromJson(Map<String, dynamic> json) =
      _$RoomEntityDtosImpl.fromJson;

  @override
  String get uniqueId;
  @override
  String get cbjEntityName;
  @override
  String get background;
  @override
  Set<String> get roomTypes;
  @override
  Set<String> get roomDevicesId;
  @override
  Set<String> get roomScenesId;
  @override
  Set<String> get roomRoutinesId;
  @override
  Set<String> get roomBindingsId;
  @override

  /// Who is using this room
  Set<String> get roomMostUsedBy;
  @override

  /// Room permissions by users id
  Set<String> get roomPermissions;
  @override
  @JsonKey(ignore: true)
  _$$RoomEntityDtosImplCopyWith<_$RoomEntityDtosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
