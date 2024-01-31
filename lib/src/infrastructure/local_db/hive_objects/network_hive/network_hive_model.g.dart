// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkHiveModelAdapter extends TypeAdapter<NetworkHiveModel> {
  @override
  final int typeId = 8;

  @override
  NetworkHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetworkHiveModel()
      ..networks = (fields[0] as List).cast<NetworkObject>();
  }

  @override
  void write(BinaryWriter writer, NetworkHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.networks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
