// import 'dart:async';
// import 'dart:convert';

// import 'package:cbj_integrations_controller/domain/core/request_types.dart';
// import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
// import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
// import 'package:cbj_integrations_controller/domain/i_saved_areas_repo.dart';
// import 'package:cbj_integrations_controller/domain/area/area_entity.dart';
// import 'package:cbj_integrations_controller/domain/area/value_objects_area.dart';
// import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
// import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
// import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_dto_base.dart';
// import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';
// import 'package:mqtt_client/mqtt_client.dart';

// class Connector {
//   factory Connector() {
//     return _instance;
//   }

//   Connector._singletonConstructor();

//   static final Connector _instance = Connector._singletonConstructor();

//   Future<void> fromMqtt(MapEntry<String, dynamic> entityForMqtt) async {
//     if (entityForMqtt.value is DeviceEntityBase) {
//       /// Data will probably arrive to the function
//       /// updateAllDevicesReposWithDeviceChanges where we listen to request from
//       /// the mqtt with this path
//       await IMqttServerRepository.instance
//           .publishDeviceEntity(entityForMqtt.value as DeviceEntityBase);
//     } else if (entityForMqtt.value is AreaEntity) {
//       // TODO: Create MQTT support for areas
//       icLogger.w('Please create MQTT support for Area Entity');
//     } else {
//       icLogger.w('Entity type to send to MQTT is not supported');
//     }
//   }

//   Future<void> startConnector() async {
//     // final ISavedDevicesRepo savedDevicesRepo = ISavedDevicesRepo.instance;

//     // final Map<String, DeviceEntityBase> allDevices =
//     //     await savedDevicesRepo.getAllDevicesAfterInitialize();

//     // for (final String deviceId in allDevices.keys) {
//     //   fromMqtt(
//     //     allDevices.entries.firstWhere(
//     //       (MapEntry<String, DeviceEntityBase> a) => a.key == deviceId,
//     //     ),
//     //   );
//     // }

//     IMqttServerRepository.instance.allHubDevicesSubscriptions();

//     IMqttServerRepository.instance.sendToApp();
//   }

//   Future<void> updateDevicesFromMqttDeviceChange(
//     MapEntry<String, Map<String, dynamic>> deviceChangeFromMqtt,
//   ) async {
//     // final ISavedDevicesRepo savedDevicesRepo = ISavedDevicesRepo.instance;

//     final Map<String, DeviceEntityBase> allDevices =
//         savedDevicesRepo.getAllDevices();

//     final Map<String, dynamic> devicePropertyAndValues =
//         deviceChangeFromMqtt.value;

//     // String? deviceStateValue;

//     for (final DeviceEntityBase d in allDevices.values) {
//       if (d.getCbjDeviceId == deviceChangeFromMqtt.key) {
//         final Map<String, dynamic> deviceAsJson = d.toInfrastructure().toJson();

//         for (final String property in devicePropertyAndValues.keys) {
//           // final String pt =
//           MqttPublishPayload.bytesToStringAsString(
//             (devicePropertyAndValues[property] as MqttPublishMessage)
//                 .payload
//                 .message,
//           ).replaceAll('\n', '');

//           final valueMessage =
//               (devicePropertyAndValues[property] as MqttPublishMessage)
//                   .payload
//                   .message;
//           final String propertyValueString =
//               utf8.decode(valueMessage, allowMalformed: true);

//           if (propertyValueString.contains('value')) {
//             final Map<String, dynamic> propertyValueJson =
//                 jsonDecode(propertyValueString) as Map<String, dynamic>;
//             deviceAsJson[property] = propertyValueJson['value'];
//           } else {
//             deviceAsJson[property] = propertyValueString;
//           }
//           final DeviceEntityBase savedDeviceWithSameIdAsMqtt =
//               DeviceEntityDtoBase.fromJson(deviceAsJson).toDomain();

//           savedDevicesRepo.addOrUpdateFromMqtt(savedDeviceWithSameIdAsMqtt);

//           if (property == 'entityStateGRPC' &&
//               propertyValueString == EntityStateGRPC.ack.toString()) {
//             final Map<String, AreaEntity> areas =
//                 ISavedAreasRepo.instance.getAllAreas();

//             HubRequestsToApp.streamRequestsToApp.sink
//                 .add(savedDeviceWithSameIdAsMqtt.toInfrastructure());
//             final AreaEntity? discoverArea =
//                 areas[AreaUniqueId.discovered().getOrCrash()];
//             if (discoverArea == null) {
//               continue;
//             }

//             if (discoverArea.areaDevicesId
//                 .getOrCrash()
//                 .contains(savedDeviceWithSameIdAsMqtt.uniqueId.getOrCrash())) {
//               HubRequestsToApp.streamRequestsToApp.sink.add(
//                 areas[AreaUniqueId.discovered().getOrCrash()]!
//                     .toInfrastructure(),
//               );
//             }
//           }
//           return;
//         }
//       }
//     }
//   }
// }
