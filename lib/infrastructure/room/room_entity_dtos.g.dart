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
          (json['roomTypes'] as List<dynamic>).map((e) => e as String).toSet(),
      roomDevicesId: (json['roomDevicesId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      roomScenesId: (json['roomScenesId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      roomRoutinesId: (json['roomRoutinesId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      roomBindingsId: (json['roomBindingsId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      roomMostUsedBy: (json['roomMostUsedBy'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      roomPermissions: (json['roomPermissions'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$$RoomEntityDtosImplToJson(
        _$RoomEntityDtosImpl instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'cbjEntityName': instance.cbjEntityName,
      'background': instance.background,
      'roomTypes': instance.roomTypes.toList(),
      'roomDevicesId': instance.roomDevicesId.toList(),
      'roomScenesId': instance.roomScenesId.toList(),
      'roomRoutinesId': instance.roomRoutinesId.toList(),
      'roomBindingsId': instance.roomBindingsId.toList(),
      'roomMostUsedBy': instance.roomMostUsedBy.toList(),
      'roomPermissions': instance.roomPermissions.toList(),
    };
