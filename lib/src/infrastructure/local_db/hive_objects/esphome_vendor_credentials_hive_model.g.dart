// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esphome_vendor_credentials_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EspHomeVendorCredentialsHiveModelAdapter
    extends TypeAdapter<EspHomeVendorCredentialsHiveModel> {
  @override
  final int typeId = 9;

  @override
  EspHomeVendorCredentialsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EspHomeVendorCredentialsHiveModel()
      ..senderUniqueId = fields[0] as String?
      ..espHomeDevicePass = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, EspHomeVendorCredentialsHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.senderUniqueId)
      ..writeByte(1)
      ..write(obj.espHomeDevicePass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EspHomeVendorCredentialsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
