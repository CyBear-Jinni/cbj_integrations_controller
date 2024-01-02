// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenes_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScenesHiveModelAdapter extends TypeAdapter<ScenesHiveModel> {
  @override
  final int typeId = 5;

  @override
  ScenesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScenesHiveModel()..scenesStringJson = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, ScenesHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.scenesStringJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScenesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
