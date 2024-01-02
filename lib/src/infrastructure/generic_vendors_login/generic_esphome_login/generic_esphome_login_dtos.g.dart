// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_esphome_login_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericEspHomeLoginDtosImpl _$$GenericEspHomeLoginDtosImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericEspHomeLoginDtosImpl(
      senderUniqueId: json['senderUniqueId'] as String?,
      loginVendor: json['loginVendor'] as String?,
      esphomeDevicePass: json['esphomeDevicePass'] as String?,
    );

Map<String, dynamic> _$$GenericEspHomeLoginDtosImplToJson(
        _$GenericEspHomeLoginDtosImpl instance) =>
    <String, dynamic>{
      'senderUniqueId': instance.senderUniqueId,
      'loginVendor': instance.loginVendor,
      'esphomeDevicePass': instance.esphomeDevicePass,
    };
