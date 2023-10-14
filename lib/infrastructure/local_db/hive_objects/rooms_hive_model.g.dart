// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomsHiveModelAdapter extends TypeAdapter<RoomsHiveModel> {
  @override
  final int typeId = 3;

  @override
  RoomsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomsHiveModel()
      ..roomUniqueId = fields[0] as String
      ..roomDefaultName = fields[1] as String
      ..roomDevicesId = (fields[2] as List).cast<String>()
      ..roomScenesId = (fields[3] as List).cast<String>()
      ..roomRoutinesId = (fields[4] as List).cast<String>()
      ..roomBindingsId = (fields[5] as List).cast<String>()
      ..roomMostUsedBy = (fields[6] as List).cast<String>()
      ..roomPermissions = (fields[7] as List).cast<String>()
      ..roomTypes = (fields[8] as List).cast<String>()
      ..roomBackground = fields[9] as String;
  }

  @override
  void write(BinaryWriter writer, RoomsHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.roomUniqueId)
      ..writeByte(1)
      ..write(obj.roomDefaultName)
      ..writeByte(2)
      ..write(obj.roomDevicesId)
      ..writeByte(3)
      ..write(obj.roomScenesId)
      ..writeByte(4)
      ..write(obj.roomRoutinesId)
      ..writeByte(5)
      ..write(obj.roomBindingsId)
      ..writeByte(6)
      ..write(obj.roomMostUsedBy)
      ..writeByte(7)
      ..write(obj.roomPermissions)
      ..writeByte(8)
      ..write(obj.roomTypes)
      ..writeByte(9)
      ..write(obj.roomBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
