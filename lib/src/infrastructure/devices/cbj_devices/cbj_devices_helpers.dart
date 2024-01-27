import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_security_camera_entity/generic_security_camera_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/cbj_devices/cbj_smart_device/cbj_smart_camera_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/cbj_devices/cbj_smart_device/cbj_smart_device_entity.dart';

class CbjDevicesHelpers {
  static List<DeviceEntityBase> addDiscoveredDevice({
    required List<CbjSmartDeviceInfo?> componentsInDevice,
    required String deviceAddress,
  }) {
    final List<DeviceEntityBase> componentsAsSmartDevices = [];

    for (final CbjSmartDeviceInfo? smartDeviceInfo in componentsInDevice) {
      if (smartDeviceInfo == null) {
        continue;
      }
      DeviceEntityBase entityAbstract;

      final CbjDeviceTypes deviceType =
          smartDeviceInfo.deviceTypesActions.deviceType;
      final String deviceId = smartDeviceInfo.id;
      final String cbjEntityName = smartDeviceInfo.defaultName;
      // final String deviceState = smartDeviceInfo.state;
      final String deviceStateMassage = smartDeviceInfo.stateMassage.isEmpty
          ? 'ok'
          : smartDeviceInfo.stateMassage;
      final CbjDeviceStateGRPC deviceStateGrpc =
          smartDeviceInfo.deviceTypesActions.deviceStateGRPC;

      final String deviceOs = smartDeviceInfo.senderDeviceOs;
      final String deviceModel = smartDeviceInfo.senderDeviceModel;
      final String deviceSenderId = smartDeviceInfo.senderId;
      final String deviceCompUuid = smartDeviceInfo.compSpecs.compUuid;

      if (deviceType == CbjDeviceTypes.smartComputer) {
        entityAbstract = CbjSmartComputerEntity(
          uniqueId: CoreUniqueId(),
          entityUniqueId: EntityUniqueId(deviceId),
          cbjEntityName: CbjEntityName(cbjEntityName),
          entityStateGRPC: EntityState(EntityStateGRPC.ack),
          stateMassage: DeviceStateMassage(deviceStateMassage),
          senderDeviceOs: DeviceSenderDeviceOs(deviceOs),
          deviceVendor: DeviceVendor(null),
          deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
          senderDeviceModel: DeviceSenderDeviceModel(deviceModel),
          senderId: DeviceSenderId.fromUniqueString(deviceSenderId),
          compUuid: DeviceCompUuid(deviceCompUuid),
          smartComputerSuspendState: GenericSmartComputerSuspendState(
            EntityActions.itIsFalse.toString(),
          ),
          smartComputerShutDownState: GenericSmartComputerShutdownState(
            EntityActions.itIsFalse.toString(),
          ),
          entityOriginalName: EntityOriginalName(''),
          deviceOriginalName: DeviceOriginalName(''),
          powerConsumption: DevicePowerConsumption('0'),
          deviceUniqueId: DeviceUniqueId('0'),
          devicePort: DevicePort('0'),
          deviceLastKnownIp: DeviceLastKnownIp(deviceAddress),
          deviceHostName: DeviceHostName('0'),
          deviceMdns: DeviceMdns('0'),
          srvResourceRecord: DeviceSrvResourceRecord(),
          mdnsServiceType: DevicemdnsServiceType(),
          ptrResourceRecord: DevicePtrResourceRecord(),
          srvTarget: DeviceSrvTarget(),
          devicesMacAddress: DevicesMacAddress('0'),
          entityKey: EntityKey('0'),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          deviceCbjUniqueId: CoreUniqueId.fromUniqueString(deviceId),
        );
      } else if (deviceType == CbjDeviceTypes.smart_camera) {
        entityAbstract = CbjSecurityCameraEntity(
          uniqueId: CoreUniqueId(),
          entityUniqueId: EntityUniqueId(deviceId),
          cbjEntityName: CbjEntityName(cbjEntityName),
          entityStateGRPC: EntityState(
            EntityStateGRPCExtension.fromString(deviceStateGrpc.name),
          ),
          stateMassage: DeviceStateMassage(deviceStateMassage),
          senderDeviceOs: DeviceSenderDeviceOs(deviceOs),
          deviceVendor: DeviceVendor(null),
          deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
          senderDeviceModel: DeviceSenderDeviceModel(deviceModel),
          senderId: DeviceSenderId.fromUniqueString(deviceSenderId),
          compUuid: DeviceCompUuid(deviceCompUuid),
          securityCameraSuspendState: GenericSecurityCameraSuspendState(
            EntityActions.itIsFalse.toString(),
          ),
          entityOriginalName: EntityOriginalName('entityOriginalName'),
          deviceOriginalName: DeviceOriginalName(''),
          powerConsumption: DevicePowerConsumption('0'),
          deviceUniqueId: DeviceUniqueId('0'),
          devicePort: DevicePort('0'),
          deviceLastKnownIp: DeviceLastKnownIp(deviceAddress),
          deviceHostName: DeviceHostName('0'),
          deviceMdns: DeviceMdns('0'),
          srvResourceRecord: DeviceSrvResourceRecord(),
          mdnsServiceType: DevicemdnsServiceType(),
          ptrResourceRecord: DevicePtrResourceRecord(),
          srvTarget: DeviceSrvTarget(),
          devicesMacAddress: DevicesMacAddress('0'),
          entityKey: EntityKey('0'),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          deviceCbjUniqueId: CoreUniqueId.fromUniqueString(deviceId),
        );
      } else {
        icLogger.w('Cbj Smart Device type is not supported ${deviceType.name}');
        continue;
      }

      componentsAsSmartDevices.add(entityAbstract);
    }

    return componentsAsSmartDevices;
  }
}
