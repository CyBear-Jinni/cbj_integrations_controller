// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routines_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoutinesHiveModelAdapter extends TypeAdapter<RoutinesHiveModel> {
  @override
  final int typeId = 6;

  @override
  RoutinesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoutinesHiveModel()..routinesStringJson = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, RoutinesHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.routinesStringJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoutinesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
