// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DevicesHiveModelAdapter extends TypeAdapter<DevicesHiveModel> {
  @override
  final int typeId = 4;

  @override
  DevicesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DevicesHiveModel()..deviceStringJson = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, DevicesHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.deviceStringJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DevicesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
