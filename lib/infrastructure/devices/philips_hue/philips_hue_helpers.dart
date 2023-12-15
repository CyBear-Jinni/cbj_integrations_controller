import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_api/philips_hue_api_light.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_e26/philips_hue_e26_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_value_objects.dart';
import 'package:http/http.dart';
import 'package:hue_dart/hue_dart.dart';

class PhilipsHueHelpers {
  static Future<List<DeviceEntityAbstract>> addDiscoveredDevice(
    DeviceEntityAbstract entity,
  ) async {
    final client = Client();

    //create bridge
    final bridge = Bridge(client, entity.deviceLastKnownIp.getOrCrash()!);

    /// TODO: save user phillips hub generated user name for cbj
    final String userNameForPhilipsHueHub =
        await bridge.brideLoopToAwaitPushlinkForUserId();
    bridge.username = userNameForPhilipsHueHub;

    final List<Light> lights = await bridge.lights();

    final List<DeviceEntityAbstract> tempDeviceEntities = [];

    for (final Light light in lights) {
      final LightState? lightState = light.state;

      if (light.type != null && light.type == 'Dimmable light') {
        final String deviceName = (light.name != null && light.name != '')
            ? light.name!
            : 'PhilipsHue test 2';
        final PhilipsHueE26Entity philipsHueDE = PhilipsHueE26Entity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(light.uniqueId.toString()),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: EntityOriginalName(deviceName),
          deviceOriginalName: DeviceOriginalName(deviceName),
          entityStateGRPC: entity.entityStateGRPC,
          senderDeviceOs: entity.senderDeviceOs,
          deviceVendor: entity.deviceVendor,
          deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
          senderDeviceModel: DeviceSenderDeviceModel(light.modelId),
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
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          deviceCbjUniqueId:
              CoreUniqueId.fromUniqueString(light.uniqueId.toString()),
          lightSwitchState: GenericDimmableLightSwitchState(
            lightState != null && lightState.on != null && lightState.on == true
                ? EntityActions.on.toString()
                : EntityActions.off.toString(),
          ),
          lightBrightness: GenericDimmableLightBrightness(
            (lightState?.brightness ?? 0).toString(),
          ),
          philipsHueApiLight: PhilipsHueApiLight(
            username: userNameForPhilipsHueHub,
            ipAdress: entity.deviceLastKnownIp.getOrCrash()!,
          ),
        );
        tempDeviceEntities.add(philipsHueDE);
      } else {
        icLogger.w('Un supported Philips Hue light type');
      }
    }

    return tempDeviceEntities;
  }
}
