// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xiaomi_mi_vendor_credentials_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class XiaomiMiVendorCredentialsHiveModelAdapter
    extends TypeAdapter<XiaomiMiVendorCredentialsHiveModel> {
  @override
  final int typeId = 10;

  @override
  XiaomiMiVendorCredentialsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return XiaomiMiVendorCredentialsHiveModel()
      ..senderUniqueId = fields[0] as String?
      ..xiaomiMiAccountEmail = fields[1] as String
      ..xiaomiMiAccountPass = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, XiaomiMiVendorCredentialsHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.senderUniqueId)
      ..writeByte(1)
      ..write(obj.xiaomiMiAccountEmail)
      ..writeByte(2)
      ..write(obj.xiaomiMiAccountPass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is XiaomiMiVendorCredentialsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
