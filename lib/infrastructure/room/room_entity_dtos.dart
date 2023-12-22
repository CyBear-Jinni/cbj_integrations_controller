import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/domain/room/value_objects_room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_entity_dtos.freezed.dart';
part 'room_entity_dtos.g.dart';

@freezed
abstract class RoomEntityDtos implements _$RoomEntityDtos {
  factory RoomEntityDtos({
    required String uniqueId,
    required String cbjEntityName,
    required String background,
    required Set<String> roomTypes,
    required Set<String> roomDevicesId,
    required Set<String> roomScenesId,
    required Set<String> roomRoutinesId,
    required Set<String> roomBindingsId,

    /// Who is using this room
    required Set<String> roomMostUsedBy,

    /// Room permissions by users id
    required Set<String> roomPermissions,

    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _RoomEntityDtos;

  RoomEntityDtos._();

  factory RoomEntityDtos.fromDomain(RoomEntity roomEntityDE) {
    return RoomEntityDtos(
      uniqueId: roomEntityDE.uniqueId.getOrCrash(),
      cbjEntityName: roomEntityDE.cbjEntityName.getOrCrash(),
      background: roomEntityDE.background.getOrCrash(),
      roomTypes: roomEntityDE.roomTypes.getOrCrash(),
      roomDevicesId: roomEntityDE.roomDevicesId.getOrCrash(),
      roomScenesId: roomEntityDE.roomScenesId.getOrCrash(),
      roomRoutinesId: roomEntityDE.roomRoutinesId.getOrCrash(),
      roomBindingsId: roomEntityDE.roomBindingsId.getOrCrash(),
      roomMostUsedBy: roomEntityDE.roomMostUsedBy.getOrCrash(),
      roomPermissions: roomEntityDE.roomPermissions.getOrCrash(),
    );
  }

  factory RoomEntityDtos.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityDtosFromJson(json);

  RoomEntity toDomain() {
    return RoomEntity(
      uniqueId: RoomUniqueId.fromUniqueString(uniqueId),
      cbjEntityName: RoomDefaultName(cbjEntityName),
      background: RoomBackground(background),
      roomTypes: RoomTypes(roomTypes),
      roomDevicesId: RoomDevicesId(roomDevicesId),
      roomScenesId: RoomScenesId(roomScenesId),
      roomRoutinesId: RoomRoutinesId(roomRoutinesId),
      roomBindingsId: RoomBindingsId(roomBindingsId),
      roomMostUsedBy: RoomMostUsedBy(roomMostUsedBy),
      roomPermissions: RoomPermissions(roomPermissions),
    );
  }

  final String deviceDtoClassInstance = (RoomEntityDtos).toString();
}
