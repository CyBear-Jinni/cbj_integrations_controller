// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_tuya_login_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericTuyaLoginDtosImpl _$$GenericTuyaLoginDtosImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericTuyaLoginDtosImpl(
      senderUniqueId: json['senderUniqueId'] as String?,
      loginVendor: json['loginVendor'] as String?,
      userName: json['userName'] as String?,
      userPassword: json['userPassword'] as String?,
      countryCode: json['countryCode'] as String?,
      bizType: json['bizType'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$$GenericTuyaLoginDtosImplToJson(
        _$GenericTuyaLoginDtosImpl instance) =>
    <String, dynamic>{
      'senderUniqueId': instance.senderUniqueId,
      'loginVendor': instance.loginVendor,
      'userName': instance.userName,
      'userPassword': instance.userPassword,
      'countryCode': instance.countryCode,
      'bizType': instance.bizType,
      'region': instance.region,
    };
