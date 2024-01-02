// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_pipes_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemotePipesHiveModelAdapter extends TypeAdapter<RemotePipesHiveModel> {
  @override
  final int typeId = 0;

  @override
  RemotePipesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RemotePipesHiveModel()..domainName = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, RemotePipesHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.domainName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemotePipesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
