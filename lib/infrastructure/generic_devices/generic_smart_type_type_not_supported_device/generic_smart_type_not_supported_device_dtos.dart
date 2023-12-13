import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_type_not_supported_device/generic_smart_type_not_supported_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_smart_type_not_supported_device_dtos.freezed.dart';
part 'generic_smart_type_not_supported_device_dtos.g.dart';

@freezed
abstract class GenericSmartTypeNotSupportedDeviceDtos
    implements
        _$GenericSmartTypeNotSupportedDeviceDtos,
        DeviceEntityDtoAbstract {
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
    required String? cbjDeviceVendor,
    required String? deviceVendor,
    required String? deviceNetworkLastUpdate,
    required String? powerConsumption,
    required String? deviceUniqueId,
    required String? devicePort,
    required String? deviceLastKnownIp,
    required String? deviceHostName,
    required String? deviceMdns,
    required String? devicesMacAddress,
    required String? entityKey,
    required String? requestTimeStamp,
    required String? lastResponseFromDeviceTimeStamp,
    required String? deviceCbjUniqueId,
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
      entityKey: deviceDe.entityKey.getOrCrash(),
      requestTimeStamp: deviceDe.requestTimeStamp.getOrCrash(),
      lastResponseFromDeviceTimeStamp:
          deviceDe.lastResponseFromDeviceTimeStamp.getOrCrash(),
      deviceCbjUniqueId: deviceDe.deviceCbjUniqueId.getOrCrash(),
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
  DeviceEntityAbstract toDomain() {
    return GenericSmartTypeNotSupportedDE(
      uniqueId: CoreUniqueId.fromUniqueString(id),
      entityUniqueId: EntityUniqueId(entityUniqueId),
      cbjEntityName: CbjEntityName(cbjEntityName),
      entityOriginalName: EntityOriginalName(entityOriginalName),
      deviceOriginalName: DeviceOriginalName(deviceOriginalName),
      entityStateGRPC: EntityState(entityStateGRPC),
      stateMassage: DeviceStateMassage(stateMassage),
      senderDeviceOs: DeviceSenderDeviceOs(senderDeviceOs),
      senderDeviceModel: DeviceSenderDeviceModel(senderDeviceModel),
      senderId: DeviceSenderId.fromUniqueString(senderId),
      cbjDeviceVendor: CbjDeviceVendor(cbjDeviceVendor),
      deviceVendor: DeviceVendor(deviceVendor),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(deviceNetworkLastUpdate),
      compUuid: DeviceCompUuid(compUuid),
      powerConsumption: DevicePowerConsumption(powerConsumption),
      deviceUniqueId: DeviceUniqueId(deviceUniqueId),
      devicePort: DevicePort(devicePort),
      deviceLastKnownIp: DeviceLastKnownIp(deviceLastKnownIp),
      deviceHostName: DeviceHostName(deviceHostName),
      deviceMdns: DeviceMdns(deviceMdns),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress(devicesMacAddress),
      entityKey: EntityKey(entityKey),
      requestTimeStamp: RequestTimeStamp(requestTimeStamp),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp(lastResponseFromDeviceTimeStamp),
      deviceCbjUniqueId: CoreUniqueId.fromUniqueString(deviceCbjUniqueId!),
    );
  }
}
