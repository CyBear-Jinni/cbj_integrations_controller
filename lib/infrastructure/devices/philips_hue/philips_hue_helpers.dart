import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_api/philips_hue_api_light.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_e26/philips_hue_e26_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_dimmable_light_device/generic_dimmable_light_value_objects.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:http/http.dart';
import 'package:hue_dart/src/core/bridge.dart';
import 'package:hue_dart/src/light/light.dart';
import 'package:hue_dart/src/light/light_state.dart';

class PhilipsHueHelpers {
  static Future<List<DeviceEntityAbstract>> addDiscoverdDevice({
    required String mDnsName,
    required String? port,
    required String ip,
    required CoreUniqueId? uniqueDeviceId,
  }) async {
    CoreUniqueId uniqueDeviceIdTemp;

    if (uniqueDeviceId != null) {
      uniqueDeviceIdTemp = uniqueDeviceId;
    } else {
      uniqueDeviceIdTemp = CoreUniqueId();
    }

    final client = Client();

    //create bridge
    final bridge = Bridge(client, ip);

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
          uniqueId: uniqueDeviceIdTemp,
          entityUniqueId: EntityUniqueId(light.uniqueId.toString()),
          cbjEntityName: CbjEntityName(deviceName),
          entityOriginalName: EntityOriginalName(deviceName),
          deviceOriginalName: DeviceOriginalName(deviceName),
          entityStateGRPC: EntityState(EntityStateGRPC.ack.toString()),
          senderDeviceOs: DeviceSenderDeviceOs('philips_hue'),
          senderDeviceModel: DeviceSenderDeviceModel(light.modelId),
          senderId: DeviceSenderId(),
          compUuid: DeviceCompUuid('55asdhd23gggg'),
          deviceMdns: DeviceMdns(mDnsName),
          deviceLastKnownIp: DeviceLastKnownIp(ip),
          stateMassage: DeviceStateMassage('Hello World'),
          powerConsumption: DevicePowerConsumption('0'),
          devicePort: DevicePort(port),
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
            ipAdress: ip,
          ),
          deviceUniqueId: DeviceUniqueId('0'),
          deviceHostName: DeviceHostName('0'),
          devicesMacAddress: DevicesMacAddress('0'),
          entityKey: EntityKey('0'),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          deviceCbjUniqueId: CoreUniqueId(),
        );
        tempDeviceEntities.add(philipsHueDE);
      } else {
        logger.w('Un supported Philips Hue light type');
      }
    }

    return tempDeviceEntities;
  }
}
