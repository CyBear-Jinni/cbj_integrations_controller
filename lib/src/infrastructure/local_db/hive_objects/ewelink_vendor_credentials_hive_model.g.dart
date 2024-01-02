// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewelink_vendor_credentials_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EwelinkVendorCredentialsHiveModelAdapter
    extends TypeAdapter<EwelinkVendorCredentialsHiveModel> {
  @override
  final int typeId = 11;

  @override
  EwelinkVendorCredentialsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EwelinkVendorCredentialsHiveModel()
      ..senderUniqueId = fields[0] as String?
      ..ewelinkAccountEmail = fields[1] as String
      ..ewelinkAccountPass = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, EwelinkVendorCredentialsHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.senderUniqueId)
      ..writeByte(1)
      ..write(obj.ewelinkAccountEmail)
      ..writeByte(2)
      ..write(obj.ewelinkAccountPass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EwelinkVendorCredentialsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
