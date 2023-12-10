import 'dart:async';
import 'dart:convert';

import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/i_saved_rooms_repo.dart';
import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/domain/room/value_objects_room.dart';
import 'package:cbj_integrations_controller/infrastructure/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

class Connector {
  factory Connector() {
    return _instance;
  }

  Connector._singletonConstructor();

  static final Connector _instance = Connector._singletonConstructor();

  Future<void> fromMqtt(MapEntry<String, dynamic> entityForMqtt) async {
    if (entityForMqtt.value is DeviceEntityAbstract) {
      /// Data will probably arrive to the function
      /// updateAllDevicesReposWithDeviceChanges where we listen to request from
      /// the mqtt with this path
      await IMqttServerRepository.instance
          .publishDeviceEntity(entityForMqtt.value as DeviceEntityAbstract);
    } else if (entityForMqtt.value is RoomEntity) {
      // TODO: Create MQTT support for rooms
      icLogger.w('Please create MQTT support for Room Entity');
    } else {
      icLogger.w('Entity type to send to MQTT is not supported');
    }
  }

  Future<void> startConnector() async {
    final ISavedDevicesRepo savedDevicesRepo = ISavedDevicesRepo.instance;

    final Map<String, DeviceEntityAbstract> allDevices =
        await savedDevicesRepo.getAllDevicesAfterInitialize();

    for (final String deviceId in allDevices.keys) {
      fromMqtt(
        allDevices.entries.firstWhere(
          (MapEntry<String, DeviceEntityAbstract> a) => a.key == deviceId,
        ),
      );
    }

    IMqttServerRepository.instance.allHubDevicesSubscriptions();

    IMqttServerRepository.instance.sendToApp();
  }

  Future<void> updateDevicesFromMqttDeviceChange(
    MapEntry<String, Map<String, dynamic>> deviceChangeFromMqtt,
  ) async {
    final ISavedDevicesRepo savedDevicesRepo = ISavedDevicesRepo.instance;

    final Map<String, DeviceEntityAbstract> allDevices =
        savedDevicesRepo.getAllDevices();

    final Map<String, dynamic> devicePropertyAndValues =
        deviceChangeFromMqtt.value;

    // String? deviceStateValue;

    for (final DeviceEntityAbstract d in allDevices.values) {
      if (d.getDeviceId() == deviceChangeFromMqtt.key) {
        final Map<String, dynamic> deviceAsJson = d.toInfrastructure().toJson();

        for (final String property in devicePropertyAndValues.keys) {
          // final String pt =
          MqttPublishPayload.bytesToStringAsString(
            (devicePropertyAndValues[property] as MqttPublishMessage)
                .payload
                .message,
          ).replaceAll('\n', '');

          final valueMessage =
              (devicePropertyAndValues[property] as MqttPublishMessage)
                  .payload
                  .message;
          final String propertyValueString =
              utf8.decode(valueMessage, allowMalformed: true);

          if (propertyValueString.contains('value')) {
            final Map<String, dynamic> propertyValueJson =
                jsonDecode(propertyValueString) as Map<String, dynamic>;
            deviceAsJson[property] = propertyValueJson['value'];
          } else {
            deviceAsJson[property] = propertyValueString;
          }
          final DeviceEntityAbstract savedDeviceWithSameIdAsMqtt =
              DeviceEntityDtoAbstract.fromJson(deviceAsJson).toDomain();

          CompaniesConnectorConjecture().updateAllDevicesReposWithDeviceChanges(
            savedDeviceWithSameIdAsMqtt,
          );
          savedDevicesRepo.addOrUpdateFromMqtt(savedDeviceWithSameIdAsMqtt);

          if (property == 'entityStateGRPC' &&
              propertyValueString == EntityStateGRPC.ack.toString()) {
            final Map<String, RoomEntity> rooms =
                ISavedRoomsRepo.instance.getAllRooms();

            HubRequestsToApp.streamRequestsToApp.sink
                .add(savedDeviceWithSameIdAsMqtt.toInfrastructure());
            final RoomEntity? discoverRoom =
                rooms[RoomUniqueId.discoveredRoomId().getOrCrash()];
            if (discoverRoom == null) {
              continue;
            }

            if (discoverRoom.roomDevicesId
                .getOrCrash()
                .contains(savedDeviceWithSameIdAsMqtt.uniqueId.getOrCrash())) {
              HubRequestsToApp.streamRequestsToApp.sink.add(
                rooms[RoomUniqueId.discoveredRoomId().getOrCrash()]!
                    .toInfrastructure(),
              );
            }
          }
          return;
        }
      }
    }
  }
}
