// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_blinds_device_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericBlindsDeviceDtosImpl _$$GenericBlindsDeviceDtosImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericBlindsDeviceDtosImpl(
      id: json['id'] as String,
      entityUniqueId: json['entityUniqueId'] as String,
      cbjEntityName: json['cbjEntityName'] as String?,
      entityOriginalName: json['entityOriginalName'] as String?,
      deviceOriginalName: json['deviceOriginalName'] as String?,
      entityStateGRPC: json['entityStateGRPC'] as String?,
      senderDeviceOs: json['senderDeviceOs'] as String?,
      senderDeviceModel: json['senderDeviceModel'] as String?,
      senderId: json['senderId'] as String?,
      blindsSwitchState: json['blindsSwitchState'] as String?,
      entityTypes: json['entityTypes'] as String?,
      compUuid: json['compUuid'] as String?,
      deviceVendor: json['deviceVendor'] as String?,
      powerConsumption: json['powerConsumption'] as String?,
      deviceUniqueId: json['deviceUniqueId'] as String?,
      devicePort: json['devicePort'] as String?,
      deviceLastKnownIp: json['deviceLastKnownIp'] as String?,
      deviceHostName: json['deviceHostName'] as String?,
      deviceMdns: json['deviceMdns'] as String?,
      devicesMacAddress: json['devicesMacAddress'] as String?,
      entityKey: json['entityKey'] as String?,
      requestTimeStamp: json['requestTimeStamp'] as String?,
      lastResponseFromDeviceTimeStamp:
          json['lastResponseFromDeviceTimeStamp'] as String?,
      deviceCbjUniqueId: json['deviceCbjUniqueId'] as String?,
      deviceDtoClass: json['deviceDtoClass'] as String?,
      stateMassage: json['stateMassage'] as String?,
    );

Map<String, dynamic> _$$GenericBlindsDeviceDtosImplToJson(
        _$GenericBlindsDeviceDtosImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entityUniqueId': instance.entityUniqueId,
      'cbjEntityName': instance.cbjEntityName,
      'entityOriginalName': instance.entityOriginalName,
      'deviceOriginalName': instance.deviceOriginalName,
      'entityStateGRPC': instance.entityStateGRPC,
      'senderDeviceOs': instance.senderDeviceOs,
      'senderDeviceModel': instance.senderDeviceModel,
      'senderId': instance.senderId,
      'blindsSwitchState': instance.blindsSwitchState,
      'entityTypes': instance.entityTypes,
      'compUuid': instance.compUuid,
      'deviceVendor': instance.deviceVendor,
      'powerConsumption': instance.powerConsumption,
      'deviceUniqueId': instance.deviceUniqueId,
      'devicePort': instance.devicePort,
      'deviceLastKnownIp': instance.deviceLastKnownIp,
      'deviceHostName': instance.deviceHostName,
      'deviceMdns': instance.deviceMdns,
      'devicesMacAddress': instance.devicesMacAddress,
      'entityKey': instance.entityKey,
      'requestTimeStamp': instance.requestTimeStamp,
      'lastResponseFromDeviceTimeStamp':
          instance.lastResponseFromDeviceTimeStamp,
      'deviceCbjUniqueId': instance.deviceCbjUniqueId,
      'deviceDtoClass': instance.deviceDtoClass,
      'stateMassage': instance.stateMassage,
    };