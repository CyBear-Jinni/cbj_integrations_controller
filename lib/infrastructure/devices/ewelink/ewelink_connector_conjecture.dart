import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/ewelink/ewelink_helpers.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/ewelink/ewelink_switch/ewelink_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:dart_ewelink_api/dart_ewelink_api.dart';

class EwelinkConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory EwelinkConnectorConjecture() {
    return _instance;
  }

  EwelinkConnectorConjecture._singletonContractor();

  static final EwelinkConnectorConjecture _instance =
      EwelinkConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.sonoffEweLink;

  @override
  final List<String> mdnsVendorUniqueTypes = ['_ewelink._tcp'];

  Ewelink? ewelink;

  Future<bool> accountLogin(
    GenericEwelinkLoginDE loginDE,
  ) async {
    try {
      final String email = loginDE.ewelinkAccountEmail.getOrCrash();
      final String password = loginDE.ewelinkAccountPass.getOrCrash();
      if (email.isEmpty || password.isEmpty) {
        return false;
      }

      ewelink = Ewelink(
        email: email,
        password: password,
      );

      await ewelink!.getCredentials();
      // foundDevice(null);
    } on EwelinkInvalidAccessToken {
      icLogger.e('invalid access token');
      return false;
    } on EwelinkOfflineDeviceException {
      icLogger.e('device is offline');
      return false;
    } catch (e) {
      icLogger.e('EweLink error: $e');
      return false;
    }
    return true;
  }

  Future<bool>? didRequestLogin;

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract ewelinkDE,
  ) async {
    if (ewelink == null || vendorEntities.isEmpty) {
      await waitUntilConnectionEstablished(0);
    }

    final DeviceEntityAbstract? device = vendorEntities[
        '${ewelinkDE.deviceUniqueId.getOrCrash()}-${ewelinkDE.entityUniqueId.getOrCrash()}'];

    if (device is EwelinkSwitchEntity) {
      device.executeDeviceAction(newEntity: ewelinkDE);
    } else {
      icLogger.w('Ewelink device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {
    DeviceEntityAbstract? nonGenericDevice;
    if (ewelink == null || vendorEntities.isEmpty) {
      await waitUntilConnectionEstablished(0);
    }
    if (deviceEntity is EwelinkSwitchEntity) {
      nonGenericDevice = EwelinkSwitchEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('EweLink device could not get loaded from the server');
      return;
    }

    vendorEntities.addEntries([
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

  @override
  Future<HashMap<String, DeviceEntityAbstract>> convertToVendorDevice(
    DeviceEntityAbstract entity,
  ) async {
    if (ewelink == null) {
      didRequestLogin = accountLogin(GenericEwelinkLoginDE.empty());
      if (!await didRequestLogin!) {
        didRequestLogin = null;
        icLogger.w(
            'eWeLink device got found but missing a email and password, please add '
            'it in the app');
        return HashMap();
      }
    }
    didRequestLogin = null;

    List<EwelinkDevice> devices;
    try {
      devices = await ewelink!.getDevices();
    } catch (e) {
      return HashMap();
    }

    final HashMap<String, DeviceEntityAbstract> entityList = HashMap();
    for (final EwelinkDevice ewelinkDevice in devices) {
      // Getting device by id adds additional info in the result
      final EwelinkDevice ewelinkDeviceWithTag =
          await ewelink!.getDevice(deviceId: ewelinkDevice.deviceid);

      entityList
          .addAll(EwelinkHelpers.addDiscoveredDevice(ewelinkDeviceWithTag));
    }
    return entityList;
  }
}
