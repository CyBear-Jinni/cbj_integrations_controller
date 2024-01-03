import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_printer_entity/generic_printer_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/hp/hp_printer/hp_printer_entity.dart';

class HpHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    final String deviceCbjUniqueId = entity.entityUniqueId.getOrCrash();

    final HpPrinterEntity lgDE = HpPrinterEntity(
      uniqueId: entity.uniqueId,
      entityUniqueId: entity.entityUniqueId,
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
      printerSwitchState: GenericPrinterSwitchState(
        EntityActions.actionNotSupported.toString(),
      ),
    );

    return HashMap()
      ..addEntries([
        MapEntry(deviceCbjUniqueId, lgDE),
      ]);
  }
}
