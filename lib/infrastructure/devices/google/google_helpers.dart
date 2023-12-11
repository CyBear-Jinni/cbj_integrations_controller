import 'package:cbj_integrations_controller/infrastructure/devices/google/chrome_cast/chrome_cast_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv/generic_smart_tv_value_objects.dart';

class GoogleHelpers {
  static List<DeviceEntityAbstract> addDiscoveredDevice(
    GenericUnsupportedDE entity,
  ) {
    final ChromeCastEntity googleDE = ChromeCastEntity(
      uniqueId: entity.uniqueId,
      entityUniqueId: EntityUniqueId(entity.deviceMdns.getOrCrash()),
      cbjEntityName: entity.cbjEntityName,
      entityOriginalName: entity.entityOriginalName,
      deviceOriginalName: entity.deviceOriginalName,
      entityStateGRPC: entity.entityStateGRPC,
      senderDeviceOs: entity.senderDeviceOs,
      senderDeviceModel: entity.senderDeviceModel,
      senderId: entity.senderId,
      compUuid: entity.compUuid,
      deviceMdns: entity.deviceMdns,
      srvResourceRecord: entity.srvResourceRecord,
      ptrResourceRecord: entity.ptrResourceRecord,
      deviceLastKnownIp: entity.deviceLastKnownIp,
      stateMassage: entity.stateMassage,
      powerConsumption: entity.powerConsumption,
      devicePort: entity.devicePort,
      deviceUniqueId: entity.deviceUniqueId,
      deviceHostName: entity.deviceHostName,
      devicesMacAddress: entity.devicesMacAddress,
      entityKey: entity.entityKey,
      requestTimeStamp: entity.requestTimeStamp,
      lastResponseFromDeviceTimeStamp: entity.lastResponseFromDeviceTimeStamp,
      deviceCbjUniqueId: CoreUniqueId.fromUniqueString(
        entity.deviceMdns.getOrCrash() ?? CoreUniqueId().getOrCrash(),
      ),
      smartTvSwitchState: GenericSmartTvSwitchState(
        EntityActions.actionNotSupported.toString(),
      ),
    );

    return [googleDE];
  }
}
