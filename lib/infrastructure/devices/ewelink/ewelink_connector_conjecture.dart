import 'dart:async';

import 'package:cbj_integrations_controller/domain/saved_devices/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/ewelink/ewelink_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/ewelink/ewelink_switch/ewelink_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:dart_ewelink_api/dart_ewelink_api.dart';
import 'package:network_tools/network_tools.dart';

class EwelinkConnectorConjecture implements AbstractCompanyConnectorConjecture {
  factory EwelinkConnectorConjecture() {
    return _instance;
  }

  EwelinkConnectorConjecture._singletonContractor();

  static final EwelinkConnectorConjecture _instance =
      EwelinkConnectorConjecture._singletonContractor();

  static const List<String> mdnsTypes = ['_ewelink._tcp'];

  Ewelink? ewelink;

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  Future<bool> accountLogin(
    GenericEwelinkLoginDE loginDE,
  ) async {
    try {
      ewelink = Ewelink(
        email: loginDE.ewelinkAccountEmail.getOrCrash(),
        password: loginDE.ewelinkAccountPass.getOrCrash(),
      );

      await ewelink!.getCredentials();
      discoverNewDevices(activeHost: null);
    } on EwelinkInvalidAccessToken {
      logger.e('invalid access token');
      return false;
    } on EwelinkOfflineDeviceException {
      logger.e('device is offline');
      return false;
    } catch (e) {
      logger.e('EweLink error: $e');
      return false;
    }
    return true;
  }

  Future<bool>? didRequestLogin;
  Future<void> discoverNewDevices({
    required ActiveHost? activeHost,
  }) async {
    if (didRequestLogin != null) {
      return;
    }

    if (ewelink == null) {
      didRequestLogin = accountLogin(GenericEwelinkLoginDE.empty());
      if (!await didRequestLogin!) {
        didRequestLogin = null;
        logger.w(
            'eWeLink device got found but missing a email and password, please add '
            'it in the app');
        return;
      }
    }
    didRequestLogin = null;

    List<EwelinkDevice> devices;
    try {
      devices = await ewelink!.getDevices();
    } catch (e) {
      return;
    }

    for (final EwelinkDevice ewelinkDevice in devices) {
      // Getting device by id adds additional info in the result
      final EwelinkDevice ewelinkDeviceWithTag =
          await ewelink!.getDevice(deviceId: ewelinkDevice.deviceid);

      final List<DeviceEntityAbstract> entityList =
          EwelinkHelpers.addDiscoveredDevice(ewelinkDeviceWithTag);

      for (final DeviceEntityAbstract deviceEntityAbstract in entityList) {
        if (companyDevices[
                '${deviceEntityAbstract.deviceUniqueId.getOrCrash()}-${deviceEntityAbstract.entityUniqueId.getOrCrash()}'] !=
            null) {
          continue;
        }

        final DeviceEntityAbstract deviceToAdd =
            CompaniesConnectorConjecture().addDiscoveredDeviceToHub(
          deviceEntityAbstract,
        );

        final MapEntry<String, DeviceEntityAbstract> deviceAsEntry = MapEntry(
          '${deviceEntityAbstract.deviceUniqueId.getOrCrash()}-${deviceEntityAbstract.entityUniqueId.getOrCrash()}',
          deviceToAdd,
        );

        companyDevices.addEntries([deviceAsEntry]);

        logger.i(
          'New EweLink devices name:${deviceEntityAbstract.cbjEntityName.getOrCrash()}',
        );
      }
    }
    ISavedDevicesRepo.instance.saveAndActivateSmartDevicesToDb();
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract ewelinkDE,
  ) async {
    if (ewelink == null || companyDevices.isEmpty) {
      await waitUntilConnectionEstablished(0);
    }

    final DeviceEntityAbstract? device = companyDevices[
        '${ewelinkDE.deviceUniqueId.getOrCrash()}-${ewelinkDE.entityUniqueId.getOrCrash()}'];

    if (device is EwelinkSwitchEntity) {
      device.executeDeviceAction(newEntity: ewelinkDE);
    } else {
      logger.w('Ewelink device type does not exist');
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;
    if (ewelink == null || companyDevices.isEmpty) {
      await waitUntilConnectionEstablished(0);
    }
    if (deviceEntity is EwelinkSwitchEntity) {
      nonGenericDevice = EwelinkSwitchEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      logger.w('EweLink device could not get loaded from the server');
      return;
    }

    companyDevices.addEntries([
      MapEntry(
        '${nonGenericDevice.deviceUniqueId.getOrCrash()}-${nonGenericDevice.entityUniqueId.getOrCrash()}',
        nonGenericDevice,
      ),
    ]);
  }

  Future<void> waitUntilConnectionEstablished(int executed) async {
    if (executed > 20 || ewelink != null) {
      await Future.delayed(const Duration(seconds: 50));
      return;
    }
    await Future.delayed(const Duration(seconds: 20));
    return waitUntilConnectionEstablished(executed + 1);
  }
}
