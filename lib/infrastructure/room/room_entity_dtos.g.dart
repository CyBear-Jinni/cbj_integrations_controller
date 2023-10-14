// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_entity_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomEntityDtosImpl _$$RoomEntityDtosImplFromJson(Map<String, dynamic> json) =>
    _$RoomEntityDtosImpl(
      uniqueId: json['uniqueId'] as String,
      cbjEntityName: json['cbjEntityName'] as String,
      background: json['background'] as String,
      roomTypes:
          (json['roomTypes'] as List<dynamic>).map((e) => e as String).toList(),
      roomDevicesId: (json['roomDevicesId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      roomScenesId: (json['roomScenesId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      roomRoutinesId: (json['roomRoutinesId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      roomBindingsId: (json['roomBindingsId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      roomMostUsedBy: (json['roomMostUsedBy'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      roomPermissions: (json['roomPermissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$RoomEntityDtosImplToJson(
        _$RoomEntityDtosImpl instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'cbjEntityName': instance.cbjEntityName,
      'background': instance.background,
      'roomTypes': instance.roomTypes,
      'roomDevicesId': instance.roomDevicesId,
      'roomScenesId': instance.roomScenesId,
      'roomRoutinesId': instance.roomRoutinesId,
      'roomBindingsId': instance.roomBindingsId,
      'roomMostUsedBy': instance.roomMostUsedBy,
      'roomPermissions': instance.roomPermissions,
    };
