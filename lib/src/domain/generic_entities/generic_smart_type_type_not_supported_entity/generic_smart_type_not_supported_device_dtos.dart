import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_smart_type_not_supported_entity/generic_smart_type_not_supported_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_smart_type_not_supported_device_dtos.freezed.dart';
part 'generic_smart_type_not_supported_device_dtos.g.dart';

@freezed
abstract class GenericSmartTypeNotSupportedDeviceDtos
    implements _$GenericSmartTypeNotSupportedDeviceDtos, DeviceEntityDtoBase {
  factory GenericSmartTypeNotSupportedDeviceDtos({
    // @JsonKey(ignore: true)
    required String id,
    required String entityUniqueId,
    required String? cbjEntityName,
    required String entityOriginalName,
    required String? deviceOriginalName,
    required String? entityStateGRPC,
    required String? senderDeviceOs,
    required String? senderDeviceModel,
    required String? senderId,
    required String? entityTypes,
    required String? compUuid,
    required String cbjDeviceVendor,
    required String? deviceVendor,
    required String? deviceNetworkLastUpdate,
    required String? powerConsumption,
    required String? deviceUniqueId,
    required String? devicePort,
    required String? deviceLastKnownIp,
    required String? deviceHostName,
    required String? deviceMdns,
    required String? devicesMacAddress,
    required String? srvResourceRecord,
    required String? srvTarget,
    required String? ptrResourceRecord,
    required String? mdnsServiceType,
    required String? entityKey,
    required String? requestTimeStamp,
    required String? lastResponseFromDeviceTimeStamp,
    required String? entitiyCbjUniqueId,
    String? deviceDtoClass,
    String? stateMassage,

    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _GenericSmartTypeNotSupportedDeviceDtos;

  GenericSmartTypeNotSupportedDeviceDtos._();

  factory GenericSmartTypeNotSupportedDeviceDtos.fromDomain(
    GenericSmartTypeNotSupportedDE deviceDe,
  ) {
    return GenericSmartTypeNotSupportedDeviceDtos(
      deviceDtoClass: (GenericSmartTypeNotSupportedDeviceDtos).toString(),
      id: deviceDe.uniqueId.getOrCrash(),
      entityUniqueId: deviceDe.entityUniqueId.getOrCrash(),
      cbjEntityName: deviceDe.cbjEntityName.getOrCrash(),
      entityOriginalName: deviceDe.entityOriginalName.getOrCrash(),
      deviceOriginalName: deviceDe.deviceOriginalName.getOrCrash(),
      entityStateGRPC: deviceDe.entityStateGRPC.getOrCrash(),
      stateMassage: deviceDe.stateMassage.getOrCrash(),
      senderDeviceOs: deviceDe.senderDeviceOs.getOrCrash(),
      senderDeviceModel: deviceDe.senderDeviceModel.getOrCrash(),
      senderId: deviceDe.senderId.getOrCrash(),
      entityTypes: deviceDe.entityTypes.getOrCrash(),
      compUuid: deviceDe.compUuid.getOrCrash(),
      cbjDeviceVendor: deviceDe.cbjDeviceVendor.getOrCrash(),
      deviceVendor: deviceDe.deviceVendor.getOrCrash(),
      deviceNetworkLastUpdate: deviceDe.deviceNetworkLastUpdate.getOrCrash(),
      powerConsumption: deviceDe.powerConsumption.getOrCrash(),
      deviceUniqueId: deviceDe.deviceUniqueId.getOrCrash(),
      devicePort: deviceDe.devicePort.getOrCrash(),
      deviceLastKnownIp: deviceDe.deviceLastKnownIp.getOrCrash(),
      deviceHostName: deviceDe.deviceHostName.getOrCrash(),
      deviceMdns: deviceDe.deviceMdns.getOrCrash(),
      devicesMacAddress: deviceDe.devicesMacAddress.getOrCrash(),
      srvResourceRecord: deviceDe.srvResourceRecord.getOrCrash(),
      mdnsServiceType: deviceDe.mdnsServiceType.getOrCrash(),
      ptrResourceRecord: deviceDe.ptrResourceRecord.getOrCrash(),
      srvTarget: deviceDe.srvTarget.getOrCrash(),
      entityKey: deviceDe.entityKey.getOrCrash(),
      requestTimeStamp: deviceDe.requestTimeStamp.getOrCrash(),
      lastResponseFromDeviceTimeStamp:
          deviceDe.lastResponseFromDeviceTimeStamp.getOrCrash(),
      entitiyCbjUniqueId: deviceDe.entitiyCbjUniqueId.getOrCrash(),
    );
  }

  factory GenericSmartTypeNotSupportedDeviceDtos.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GenericSmartTypeNotSupportedDeviceDtosFromJson(json);

  @override
  final String deviceDtoClassInstance =
      (GenericSmartTypeNotSupportedDeviceDtos).toString();

  @override
  DeviceEntityBase toDomain() {
    return GenericSmartTypeNotSupportedDE(
      uniqueId: CoreUniqueId.fromUniqueString(id),
      entityUniqueId: EntityUniqueId(entityUniqueId),
      cbjEntityName: CbjEntityName(value: cbjEntityName),
      entityOriginalName: EntityOriginalName(entityOriginalName),
      deviceOriginalName: DeviceOriginalName(value: deviceOriginalName),
      entityStateGRPC: EntityState(
        entityStateGRPC == null
            ? EntityStateGRPC.undefined
            : EntityStateGRPCExtension.fromString(entityStateGRPC!),
      ),
      stateMassage: DeviceStateMassage(value: stateMassage),
      senderDeviceOs: DeviceSenderDeviceOs(senderDeviceOs),
      senderDeviceModel: DeviceSenderDeviceModel(senderDeviceModel),
      senderId: DeviceSenderId.fromUniqueString(senderId),
      cbjDeviceVendor: CbjDeviceVendor(
        VendorsAndServicesExtension.fromString(cbjDeviceVendor),
      ),
      deviceVendor: DeviceVendor(value: deviceVendor),
      deviceNetworkLastUpdate:
          DeviceNetworkLastUpdate(value: deviceNetworkLastUpdate),
      compUuid: DeviceCompUuid(compUuid),
      powerConsumption: DevicePowerConsumption(powerConsumption),
      deviceUniqueId: DeviceUniqueId(deviceUniqueId),
      devicePort: DevicePort(value: devicePort),
      deviceLastKnownIp: DeviceLastKnownIp(value: deviceLastKnownIp),
      deviceHostName: DeviceHostName(value: deviceHostName),
      deviceMdns: DeviceMdns(value: deviceMdns),
      srvResourceRecord: DeviceSrvResourceRecord(input: srvResourceRecord),
      srvTarget: DeviceSrvTarget(input: srvTarget),
      ptrResourceRecord: DevicePtrResourceRecord(input: ptrResourceRecord),
      mdnsServiceType: DevicemdnsServiceType(input: mdnsServiceType),
      devicesMacAddress: DevicesMacAddress(value: devicesMacAddress),
      entityKey: EntityKey(entityKey),
      requestTimeStamp: RequestTimeStamp(requestTimeStamp),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp(lastResponseFromDeviceTimeStamp),
      entitiyCbjUniqueId: CoreUniqueId.fromUniqueString(entitiyCbjUniqueId!),
    );
  }
}
