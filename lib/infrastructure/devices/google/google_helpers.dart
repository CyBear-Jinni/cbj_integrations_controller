import 'dart:collection';

import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/google/chrome_cast/chrome_cast_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_tv_entity/generic_smart_tv_value_objects.dart';

class GoogleHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    final String deviceCbjUniqueId =
        entity.deviceMdns.getOrCrash() ?? CoreUniqueId().getOrCrash();

    final ChromeCastEntity googleDE = ChromeCastEntity(
      uniqueId: entity.uniqueId,
      entityUniqueId: EntityUniqueId(entity.deviceMdns.getOrCrash()),
      cbjEntityName: entity.cbjEntityName,
      entityOriginalName: entity.entityOriginalName,
      deviceOriginalName: entity.deviceOriginalName,
      entityStateGRPC: entity.entityStateGRPC,
      senderDeviceOs: entity.senderDeviceOs,
      deviceVendor: entity.deviceVendor,
      deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
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
      deviceCbjUniqueId: CoreUniqueId.fromUniqueString(deviceCbjUniqueId),
      smartTvSwitchState: GenericSmartTvSwitchState(
        EntityActions.actionNotSupported.toString(),
      ),
    );

    return HashMap()
      ..addEntries([
        MapEntry(deviceCbjUniqueId, googleDE),
      ]);
  }
}
