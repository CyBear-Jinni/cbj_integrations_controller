// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_switch_device_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericSwitchDeviceDtosImpl _$$GenericSwitchDeviceDtosImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericSwitchDeviceDtosImpl(
      id: json['id'] as String,
      entityUniqueId: json['entityUniqueId'] as String,
      cbjEntityName: json['cbjEntityName'] as String?,
      entityOriginalName: json['entityOriginalName'] as String,
      deviceOriginalName: json['deviceOriginalName'] as String?,
      entityStateGRPC: json['entityStateGRPC'] as String?,
      senderDeviceOs: json['senderDeviceOs'] as String?,
      senderDeviceModel: json['senderDeviceModel'] as String?,
      senderId: json['senderId'] as String?,
      switchState: json['switchState'] as String?,
      entityTypes: json['entityTypes'] as String?,
      compUuid: json['compUuid'] as String?,
      cbjDeviceVendor: json['cbjDeviceVendor'] as String?,
      deviceVendor: json['deviceVendor'] as String?,
      deviceNetworkLastUpdate: json['deviceNetworkLastUpdate'] as String?,
      powerConsumption: json['powerConsumption'] as String?,
      deviceUniqueId: json['deviceUniqueId'] as String?,
      devicePort: json['devicePort'] as String?,
      deviceLastKnownIp: json['deviceLastKnownIp'] as String?,
      deviceHostName: json['deviceHostName'] as String?,
      deviceMdns: json['deviceMdns'] as String?,
      srvResourceRecord: json['srvResourceRecord'] as String?,
      ptrResourceRecord: json['ptrResourceRecord'] as String?,
      devicesMacAddress: json['devicesMacAddress'] as String?,
      entityKey: json['entityKey'] as String?,
      requestTimeStamp: json['requestTimeStamp'] as String?,
      lastResponseFromDeviceTimeStamp:
          json['lastResponseFromDeviceTimeStamp'] as String?,
      deviceCbjUniqueId: json['deviceCbjUniqueId'] as String?,
      deviceDtoClass: json['deviceDtoClass'] as String?,
      stateMassage: json['stateMassage'] as String?,
    );

Map<String, dynamic> _$$GenericSwitchDeviceDtosImplToJson(
        _$GenericSwitchDeviceDtosImpl instance) =>
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
      'switchState': instance.switchState,
      'entityTypes': instance.entityTypes,
      'compUuid': instance.compUuid,
      'cbjDeviceVendor': instance.cbjDeviceVendor,
      'deviceVendor': instance.deviceVendor,
      'deviceNetworkLastUpdate': instance.deviceNetworkLastUpdate,
      'powerConsumption': instance.powerConsumption,
      'deviceUniqueId': instance.deviceUniqueId,
      'devicePort': instance.devicePort,
      'deviceLastKnownIp': instance.deviceLastKnownIp,
      'deviceHostName': instance.deviceHostName,
      'deviceMdns': instance.deviceMdns,
      'srvResourceRecord': instance.srvResourceRecord,
      'ptrResourceRecord': instance.ptrResourceRecord,
      'devicesMacAddress': instance.devicesMacAddress,
      'entityKey': instance.entityKey,
      'requestTimeStamp': instance.requestTimeStamp,
      'lastResponseFromDeviceTimeStamp':
          instance.lastResponseFromDeviceTimeStamp,
      'deviceCbjUniqueId': instance.deviceCbjUniqueId,
      'deviceDtoClass': instance.deviceDtoClass,
      'stateMassage': instance.stateMassage,
    };
