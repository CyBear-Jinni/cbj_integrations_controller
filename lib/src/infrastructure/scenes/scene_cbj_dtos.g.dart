// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene_cbj_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SceneCbjDtosImpl _$$SceneCbjDtosImplFromJson(Map<String, dynamic> json) =>
    _$SceneCbjDtosImpl(
      uniqueId: json['uniqueId'] as String,
      name: json['name'] as String,
      backgroundColor: json['backgroundColor'] as String,
      entityStateGRPC: json['entityStateGRPC'] as String?,
      senderDeviceOs: json['senderDeviceOs'] as String?,
      senderDeviceModel: json['senderDeviceModel'] as String?,
      senderId: json['senderId'] as String?,
      compUuid: json['compUuid'] as String?,
      stateMassage: json['stateMassage'] as String?,
      areaPurposeType: json['areaPurposeType'] as String,
      automationString: json['automationString'] as String?,
      nodeRedFlowId: json['nodeRedFlowId'] as String?,
      firstNodeId: json['firstNodeId'] as String?,
      iconCodePoint: json['iconCodePoint'] as String?,
      image: json['image'] as String?,
      lastDateOfExecute: json['lastDateOfExecute'] as String?,
    );

Map<String, dynamic> _$$SceneCbjDtosImplToJson(_$SceneCbjDtosImpl instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'name': instance.name,
      'backgroundColor': instance.backgroundColor,
      'entityStateGRPC': instance.entityStateGRPC,
      'senderDeviceOs': instance.senderDeviceOs,
      'senderDeviceModel': instance.senderDeviceModel,
      'senderId': instance.senderId,
      'compUuid': instance.compUuid,
      'stateMassage': instance.stateMassage,
      'areaPurposeType': instance.areaPurposeType,
      'automationString': instance.automationString,
      'nodeRedFlowId': instance.nodeRedFlowId,
      'firstNodeId': instance.firstNodeId,
      'iconCodePoint': instance.iconCodePoint,
      'image': instance.image,
      'lastDateOfExecute': instance.lastDateOfExecute,
    };
