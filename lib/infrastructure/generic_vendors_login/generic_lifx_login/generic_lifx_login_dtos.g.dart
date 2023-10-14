// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_lifx_login_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericLifxLoginDtosImpl _$$GenericLifxLoginDtosImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericLifxLoginDtosImpl(
      senderUniqueId: json['senderUniqueId'] as String?,
      loginVendor: json['loginVendor'] as String?,
      lifxApiKey: json['lifxApiKey'] as String?,
    );

Map<String, dynamic> _$$GenericLifxLoginDtosImplToJson(
        _$GenericLifxLoginDtosImpl instance) =>
    <String, dynamic>{
      'senderUniqueId': instance.senderUniqueId,
      'loginVendor': instance.loginVendor,
      'lifxApiKey': instance.lifxApiKey,
    };
