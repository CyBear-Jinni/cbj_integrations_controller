import 'package:cbj_integrations_controller/domain/core/value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_connector_conjector.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_light/esphome_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_switch/esphome_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_light_device/generic_light_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_value_objects.dart';
import 'package:nodered/nodered.dart';

class EspHomeHelpers {
  /// Will create new espHome device node in NodeRed if does not exist.
  /// If already exits it will check if this is the correct one for the given
  /// device and if so will just return the existing one node id
  static Future<String> createDeviceNodeOrReturnExistingOne({
    required String mDnsName,
    required String devicePassword,
    String? espHomeNodeDeviceId,
  }) async {
    if (espHomeNodeDeviceId == null) {
      /// Try to find entity that already got added that contains the same
      /// mDNS (multiple entities can exist on the device)
      for (final DeviceEntityAbstract deviceE
          in EspHomeConnectorConjector().getAllCompanyDevices.values) {
        if (deviceE.deviceMdns.getOrCrash() == mDnsName) {
          return deviceE.deviceCbjUniqueId.getOrCrash();
        }
      }
    }
    final String tempEspHomeNodeDeviceId =
        espHomeNodeDeviceId ?? UniqueId().getOrCrash();

    // final EspHomeNodeRedApi espHomeNodeRedApi = EspHomeNodeRedApi(
    //   repository: getIt<INodeRedRepository>(),
    //   nodeRedApiBaseTopic:
    //       IMqttServerRepository.instance.getNodeRedApiBaseTopic(),
    //   nodeRedDevicesTopic:
    //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName(),
    //   nodeRedMqttBrokerNodeName: 'Cbj NodeRed plugs Api Broker',
    // );
    //
    // await espHomeNodeRedApi.setNewGlobalEspHomeDeviceNode(
    //   deviceMdnsName: mDnsName,
    //   password: devicePassword,
    //   espHomeDeviceId: tempEspHomeNodeDeviceId,
    // );
    await Future.delayed(const Duration(milliseconds: 800));

    return tempEspHomeNodeDeviceId;
  }

  static Future<List<EspHomeDeviceEntityObject>> retrieveOnlyNewEntities({
    required String mDnsName,
    required String devicePassword,
    String? espHomeDeviceNodeId,
  }) async {
    /// 1. Add ESPHome Device node to node red if not given one
    final String espHomeDeviceNodeIdResult = espHomeDeviceNodeId ??
        await createDeviceNodeOrReturnExistingOne(
          devicePassword: devicePassword,
          mDnsName: mDnsName,
        );

    /// 2. Get all entities of this device
    final List<EspHomeDeviceEntityObject> allEntities =
        await EspHomeNodeRedServerApiCalls.getEspHomeDeviceEntities(
      espHomeDeviceNodeIdResult,
    );

    /// 3. Compere device entities with already added entities to retrieve
    ///  only the new once
    final List<EspHomeDeviceEntityObject> tempAllEntities = [];

    for (final EspHomeDeviceEntityObject entity in allEntities) {
      if (!EspHomeConnectorConjector()
          .getAllCompanyDevices
          .containsKey(entity.config['uniqueId'])) {
        tempAllEntities.add(entity);
      }
    }
    return tempAllEntities;
  }

  static Future<List<DeviceEntityAbstract>> addDiscoverdEntities({
    required String address,
    required String mDnsName,
    required String devicePassword,
    String port = '6053',
  }) async {
    final String espHomeDeviceNodeId =
        await createDeviceNodeOrReturnExistingOne(
      devicePassword: devicePassword,
      mDnsName: mDnsName,
    );

    /// Make sure we add only new entities
    final List<EspHomeDeviceEntityObject> entitiesList =
        await retrieveOnlyNewEntities(
      mDnsName: mDnsName,
      devicePassword: devicePassword,
      espHomeDeviceNodeId: espHomeDeviceNodeId,
    );

    if (entitiesList.isEmpty) {
      return [];
    }

    final List<DeviceEntityAbstract> deviceEntityList = [];

    // final EspHomeNodeRedApi espHomeNodeRedApi = EspHomeNodeRedApi(
    //   repository: getIt<NodeRedRepository>(),
    //   nodeRedApiBaseTopic:
    //       IMqttServerRepository.instance.getNodeRedApiBaseTopic(),
    //   nodeRedDevicesTopic:
    //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName(),
    //   nodeRedMqttBrokerNodeName: 'Cbj NodeRed plugs Api Broker',
    // );

    for (final EspHomeDeviceEntityObject espHomeDeviceEntityObject
        in entitiesList) {
      // final String flowId = UniqueId().getOrCrash();

      final String deviceKey = espHomeDeviceEntityObject.key.toString();

      // await espHomeNodeRedApi.setNewStateNodes(
      //   espHomeDeviceId: espHomeDeviceNodeId,
      //   flowId: flowId,
      //   entityId: deviceKey,
      // );

      if (espHomeDeviceEntityObject.type == 'Light') {
        // TODO: Add support for more light types, I think the type is stored in supportedColorModList
        // final List supportedColorModList = espHomeDeviceEntityObject
        //     .config['supportedColorModesList'] as List<dynamic>;
        // if (supportedColorModList.first == 1) {}

        deviceEntityList.add(
          EspHomeLightEntity(
            uniqueId: CoreUniqueId(),
            entityUniqueId: EntityUniqueId(
              espHomeDeviceEntityObject.config['uniqueId'] as String,
            ),
            cbjEntityName: CbjEntityName(espHomeDeviceEntityObject.name),
            entityOriginalName:
                EntityOriginalName(espHomeDeviceEntityObject.name),
            deviceOriginalName:
                DeviceOriginalName(espHomeDeviceEntityObject.name),
            entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
            stateMassage: DeviceStateMassage('Test'),
            senderDeviceOs: DeviceSenderDeviceOs('EspHome'),
            senderDeviceModel: DeviceSenderDeviceModel('Probably esp8266'),
            senderId: DeviceSenderId.fromUniqueString('Test'),
            compUuid: DeviceCompUuid('test'),
            powerConsumption: DevicePowerConsumption('0'),
            lightSwitchState: GenericLightSwitchState('on'),
            deviceMdns: DeviceMdns(mDnsName),
            devicePort: DevicePort(port),
            entityKey: EntityKey(deviceKey),
            deviceLastKnownIp: DeviceLastKnownIp(address),
            deviceUniqueId: DeviceUniqueId(espHomeDeviceNodeId),
            deviceHostName: DeviceHostName('0'),
            devicesMacAddress: DevicesMacAddress('0'),
            requestTimeStamp: RequestTimeStamp('0'),
            lastResponseFromDeviceTimeStamp:
                LastResponseFromDeviceTimeStamp('0'),
            deviceCbjUniqueId:
                CoreUniqueId.fromUniqueString(espHomeDeviceNodeId),
          ),
        );
      } else if (espHomeDeviceEntityObject.type == 'Switch' ||
          espHomeDeviceEntityObject.type == 'Fan' ||
          espHomeDeviceEntityObject.type == 'Siren') {
        deviceEntityList.add(
          EspHomeSwitchEntity(
            uniqueId: CoreUniqueId(),
            entityUniqueId: EntityUniqueId(
              espHomeDeviceEntityObject.config['uniqueId'] as String,
            ),
            cbjEntityName: CbjEntityName(espHomeDeviceEntityObject.name),
            entityOriginalName:
                EntityOriginalName(espHomeDeviceEntityObject.name),
            deviceOriginalName:
                DeviceOriginalName(espHomeDeviceEntityObject.name),
            entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
            stateMassage: DeviceStateMassage('Test'),
            senderDeviceOs: DeviceSenderDeviceOs('EspHome'),
            senderDeviceModel: DeviceSenderDeviceModel('Probably esp8266'),
            senderId: DeviceSenderId.fromUniqueString('Test'),
            compUuid: DeviceCompUuid('test'),
            powerConsumption: DevicePowerConsumption('0'),
            deviceMdns: DeviceMdns(mDnsName),
            devicePort: DevicePort(port),
            entityKey: EntityKey(deviceKey),
            deviceLastKnownIp: DeviceLastKnownIp(address),
            switchState: GenericSwitchSwitchState('on'),
            deviceUniqueId: DeviceUniqueId('0'),
            deviceHostName: DeviceHostName('0'),
            devicesMacAddress: DevicesMacAddress('0'),
            requestTimeStamp: RequestTimeStamp('0'),
            lastResponseFromDeviceTimeStamp:
                LastResponseFromDeviceTimeStamp('0'),
            deviceCbjUniqueId:
                CoreUniqueId.fromUniqueString(espHomeDeviceNodeId),
          ),
        );
      }
    }

    return deviceEntityList;
  }
}
