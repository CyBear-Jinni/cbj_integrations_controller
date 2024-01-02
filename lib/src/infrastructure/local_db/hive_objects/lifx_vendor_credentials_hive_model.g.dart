// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifx_vendor_credentials_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LifxVendorCredentialsHiveModelAdapter
    extends TypeAdapter<LifxVendorCredentialsHiveModel> {
  @override
  final int typeId = 8;

  @override
  LifxVendorCredentialsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LifxVendorCredentialsHiveModel()
      ..senderUniqueId = fields[0] as String?
      ..lifxApiKey = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, LifxVendorCredentialsHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.senderUniqueId)
      ..writeByte(1)
      ..write(obj.lifxApiKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LifxVendorCredentialsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
