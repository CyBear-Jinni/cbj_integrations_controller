// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuya_vendor_credentials_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TuyaVendorCredentialsHiveModelAdapter
    extends TypeAdapter<TuyaVendorCredentialsHiveModel> {
  @override
  final int typeId = 2;

  @override
  TuyaVendorCredentialsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TuyaVendorCredentialsHiveModel()
      ..senderUniqueId = fields[0] as String?
      ..tuyaUserName = fields[1] as String
      ..tuyaUserPassword = fields[2] as String
      ..tuyaCountryCode = fields[3] as String
      ..tuyaBizType = fields[4] as String
      ..tuyaRegion = fields[5] as String
      ..loginVendor = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, TuyaVendorCredentialsHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.senderUniqueId)
      ..writeByte(1)
      ..write(obj.tuyaUserName)
      ..writeByte(2)
      ..write(obj.tuyaUserPassword)
      ..writeByte(3)
      ..write(obj.tuyaCountryCode)
      ..writeByte(4)
      ..write(obj.tuyaBizType)
      ..writeByte(5)
      ..write(obj.tuyaRegion)
      ..writeByte(6)
      ..write(obj.loginVendor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TuyaVendorCredentialsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
