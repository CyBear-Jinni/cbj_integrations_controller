// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeHiveModelAdapter extends TypeAdapter<HomeHiveModel> {
  @override
  final int typeId = 8;

  @override
  HomeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeHiveModel()
      ..areaUniqueId = fields[0] as String
      ..areaDefaultName = fields[1] as String
      ..areaDevicesId = (fields[2] as List).cast<String>()
      ..areaScenesId = (fields[3] as List).cast<String>()
      ..areaRoutinesId = (fields[4] as List).cast<String>()
      ..areaBindingsId = (fields[5] as List).cast<String>()
      ..areaMostUsedBy = (fields[6] as List).cast<String>()
      ..areaPermissions = (fields[7] as List).cast<String>()
      ..areaTypes = (fields[8] as List).cast<String>()
      ..areaBackground = fields[9] as String;
  }

  @override
  void write(BinaryWriter writer, HomeHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.areaUniqueId)
      ..writeByte(1)
      ..write(obj.areaDefaultName)
      ..writeByte(2)
      ..write(obj.areaDevicesId)
      ..writeByte(3)
      ..write(obj.areaScenesId)
      ..writeByte(4)
      ..write(obj.areaRoutinesId)
      ..writeByte(5)
      ..write(obj.areaBindingsId)
      ..writeByte(6)
      ..write(obj.areaMostUsedBy)
      ..writeByte(7)
      ..write(obj.areaPermissions)
      ..writeByte(8)
      ..write(obj.areaTypes)
      ..writeByte(9)
      ..write(obj.areaBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
