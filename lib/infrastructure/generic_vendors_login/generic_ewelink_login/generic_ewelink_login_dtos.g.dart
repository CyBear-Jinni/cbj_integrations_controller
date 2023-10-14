// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_ewelink_login_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericEwelinkLoginDtosImpl _$$GenericEwelinkLoginDtosImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericEwelinkLoginDtosImpl(
      senderUniqueId: json['senderUniqueId'] as String?,
      loginVendor: json['loginVendor'] as String?,
      ewelinkAccountEmail: json['ewelinkAccountEmail'] as String?,
      ewelinkAccountPass: json['ewelinkAccountPass'] as String?,
    );

Map<String, dynamic> _$$GenericEwelinkLoginDtosImplToJson(
        _$GenericEwelinkLoginDtosImpl instance) =>
    <String, dynamic>{
      'senderUniqueId': instance.senderUniqueId,
      'loginVendor': instance.loginVendor,
      'ewelinkAccountEmail': instance.ewelinkAccountEmail,
      'ewelinkAccountPass': instance.ewelinkAccountPass,
    };
