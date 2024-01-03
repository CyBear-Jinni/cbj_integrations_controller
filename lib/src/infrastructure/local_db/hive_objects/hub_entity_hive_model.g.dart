// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hub_entity_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HubEntityHiveModelAdapter extends TypeAdapter<HubEntityHiveModel> {
  @override
  final int typeId = 1;

  @override
  HubEntityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HubEntityHiveModel()
      ..hubNetworkBssid = fields[0] as String
      ..networkName = fields[1] as String
      ..lastKnownIp = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, HubEntityHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hubNetworkBssid)
      ..writeByte(1)
      ..write(obj.networkName)
      ..writeByte(2)
      ..write(obj.lastKnownIp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HubEntityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
