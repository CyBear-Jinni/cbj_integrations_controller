import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/ewelink/ewelink_helpers.dart';
import 'package:dart_ewelink_api/dart_ewelink_api.dart';

class EwelinkConnectorConjecture extends VendorConnectorConjectureService {
  factory EwelinkConnectorConjecture() {
    return _instance;
  }

  EwelinkConnectorConjecture._singletonContractor()
      : super(
          vendorsAndServices: VendorsAndServices.sonoffEweLink,
          uniqeMdnsList: ['_ewelink._tcp'],
        );

  static final EwelinkConnectorConjecture _instance =
      EwelinkConnectorConjecture._singletonContractor();

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
      icLogger.e('Entity is offline');
      return false;
    } catch (e) {
      icLogger.e('EweLink error: $e');
      return false;
    }
    return true;
  }

  Future<bool>? didRequestLogin;

  Future<void> waitUntilConnectionEstablished(int executed) async {
    if (executed > 20 || ewelink != null) {
      await Future.delayed(const Duration(seconds: 50));
      return;
    }
    await Future.delayed(const Duration(seconds: 20));
    return waitUntilConnectionEstablished(executed + 1);
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
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

    final HashMap<String, DeviceEntityBase> entityList = HashMap();
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
