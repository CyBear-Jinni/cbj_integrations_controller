import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_led/tasmota_ip_led_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_switch/tasmota_ip_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_light_device/generic_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_entity.dart';
import 'package:http/http.dart';

class TasmotaIpConnectorConjecture
    implements AbstractCompanyConnectorConjecture {
  factory TasmotaIpConnectorConjecture() {
    return _instance;
  }

  TasmotaIpConnectorConjecture._singletonContractor();

  static final TasmotaIpConnectorConjecture _instance =
      TasmotaIpConnectorConjecture._singletonContractor();

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  // This is how you can interact tasmota using network calls.
  // http://ip/cm?cmnd=SetOption19%200
  // http://ip/cm?cmnd=MqttHost%200

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundDevice(
    DeviceEntityAbstract entity,
  ) async {
    final List<CoreUniqueId?> tempCoreUniqueId = [];
    final String hostName = entity.deviceHostName.getOrCrash();

    for (final DeviceEntityAbstract savedDevice in companyDevices.values) {
      if ((savedDevice is TasmotaIpSwitchEntity) &&
          hostName == savedDevice.entityUniqueId.getOrCrash()) {
        return null;
      } else if (savedDevice is GenericLightDE &&
          hostName == savedDevice.entityUniqueId.getOrCrash()) {
        /// Device exist as generic and needs to get converted to non generic type for this vendor
        tempCoreUniqueId.add(savedDevice.uniqueId);
        break;
      } else if (hostName == savedDevice.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'Tasmota IP device type supported but implementation is missing here',
        );
      }
    }
    // TODO: Create list of CoreUniqueId and populate it with all the
    //  components saved devices that already exist
    final List<String> componentsInDevice =
        await getAllComponentsOfDevice(entity);

    final List<DeviceEntityAbstract> tasmotaIpDevices =
        await TasmotaIpHelpers.addDiscoveredDevice(
      entity: entity,
      uniqueDeviceIdList: tempCoreUniqueId,
      componentInDeviceNumberLabelList: componentsInDevice,
    );

    if (tasmotaIpDevices.isEmpty) {
      return null;
    }

    final HashMap<String, DeviceEntityAbstract> addedDevice = HashMap();

    for (final DeviceEntityAbstract entityAsDevice in tasmotaIpDevices) {
      final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
        entityAsDevice.deviceCbjUniqueId.getOrCrash(),
        entityAsDevice,
      );

      addedDevice.addEntries([deviceAsEntry]);
      companyDevices.addEntries([deviceAsEntry]);

      icLogger.t(
        'New Tasmota Ip device name:${entityAsDevice.cbjEntityName.getOrCrash()}',
      );
    }
    return addedDevice;
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract tasmotaIpDE,
  ) async {
    final DeviceEntityAbstract? device =
        companyDevices[tasmotaIpDE.entityUniqueId.getOrCrash()];

    if (device is TasmotaIpSwitchEntity) {
      device.executeDeviceAction(newEntity: tasmotaIpDE);
    } else {
      icLogger.w('TasmotaIp device type does not exist');
    }
  }

  /// Getting all of the components/gpio configuration of the device.
  /// Doc of all components: https://tasmota.github.io/docs/Components/#tasmota
  Future<List<String>> getAllComponentsOfDevice(
    DeviceEntityAbstract entity,
  ) async {
    final String? deviceIp = entity.devicesMacAddress.getOrCrash();
    const String getComponentsCommand = 'cm?cmnd=Gpio';

    Map<String, Map<String, String>>? responseJson;
    final List<String> componentTypeAndName = [];

    try {
      final Response response =
          await get(Uri.parse('http://$deviceIp/$getComponentsCommand'));
      final Map<String, dynamic> temp1ResponseJson =
          json.decode(response.body) as Map<String, dynamic>;

      final Map<String, Map<String, dynamic>> temp2ResponseJson =
          temp1ResponseJson.map(
        (key, value) => MapEntry(key, value as Map<String, dynamic>),
      );

      responseJson = temp2ResponseJson.map(
        (key, Map<String, dynamic> value) => MapEntry(
          key,
          value.map(
            (key, value) {
              final MapEntry<String, String> tempEntry =
                  MapEntry(key, value.toString());
              componentTypeAndName.add(key);
              return tempEntry;
            },
          ),
        ),
      );
    } catch (e) {
      icLogger.e(e);
    }
    if (responseJson == null || responseJson.isEmpty) {
      return [];
    }
    return componentTypeAndName;
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;

    if (deviceEntity is GenericLightDE) {
      nonGenericDevice = TasmotaIpLedEntity.fromGeneric(deviceEntity);
    } else if (deviceEntity is GenericSwitchDE) {
      nonGenericDevice = TasmotaIpSwitchEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Switcher device could not get loaded from the server');
      return;
    }

    companyDevices.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }
}
