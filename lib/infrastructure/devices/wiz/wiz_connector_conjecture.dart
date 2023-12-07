import 'dart:async';

import 'package:cbj_integrations_controller/domain/vendors/wiz_login/generic_wiz_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/wiz/wiz_white/wiz_white_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/abstract_company_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/utils.dart';
import 'package:network_tools/network_tools.dart';

class WizConnectorConjecture implements AbstractCompanyConnectorConjecture {
  factory WizConnectorConjecture() {
    return _instance;
  }

  WizConnectorConjecture._singletonContractor();

  static final WizConnectorConjecture _instance =
      WizConnectorConjecture._singletonContractor();

  Future<String> accountLogin(GenericWizLoginDE genericWizLoginDE) async {
    // wizClient = WizClient(genericWizLoginDE.wizApiKey.getOrCrash());
    _discoverNewDevices();
    return 'Success';
  }

  @override
  Map<String, DeviceEntityAbstract> companyDevices = {};

  Future<List<DeviceEntityAbstract>> addNewDeviceByHostInfo({
    required ActiveHost activeHost,
  }) async {
    logger.w('Wiz device got discovered but missing implementation');
    // final List<CoreUniqueId?> tempCoreUniqueId = [];
    //
    // for (final DeviceEntityAbstract savedDevice in companyDevices.values) {
    //   if ((savedDevice is WizWhiteEntity) &&
    //       await activeHost.hostName ==
    //           savedDevice.entityUniqueId.getOrCrash()) {
    //     return;
    //   } else if (await activeHost.hostName ==
    //       savedDevice.entityUniqueId.getOrCrash()) {
    //     logger.w(
    //       'Wiz IP device type supported but implementation is missing here',
    //     );
    //   }
    // }
    // // TODO: Create list of CoreUniqueId and populate it with all the
    // //  components saved devices that already exist
    // final List<String> componentsInDevice =
    //     await getAllComponentsOfDevice(activeHost);
    //
    // final List<DeviceEntityAbstract> wizIpDevices =
    //     await WizIpHelpers.addDiscoveredDevice(
    //   activeHost: activeHost,
    //   uniqueDeviceIdList: tempCoreUniqueId,
    //   componentInDeviceNumberLabelList: componentsInDevice,
    // );
    //
    // if (wizIpDevices.isEmpty) {
    //   return;
    // }
    //
    // for (final DeviceEntityAbstract entityAsDevice in wizIpDevices) {
    //   final DeviceEntityAbstract deviceToAdd =
    //       CompaniesConnectorConjecture().addDiscoveredDeviceToHub(entityAsDevice);
    //
    //   final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
    //       MapEntry(deviceToAdd.uniqueId.getOrCrash(), deviceToAdd);
    //
    //   companyDevices.addEntries([deviceAsEntry]);
    //
    //   logger.t(
    //     'New Wiz Ip device name:${entityAsDevice.cbjEntityName.getOrCrash()}',
    //   );
    // }
    return [];
  }

  // static WizClient? wizClient;

  Future<void> _discoverNewDevices() async {
    while (true) {
      try {
        // final Iterable<WizBulb> lights =
        //     await wizClient!.listLights(const Selector());

        // for (final WizBulb wizDevice in lights) {
        //   CoreUniqueId? tempCoreUniqueId;
        //   bool deviceExist = false;
        //   for (final DeviceEntityAbstract savedDevice
        //       in companyDevices.values) {
        //     if (savedDevice is WizWhiteEntity &&
        //         wizDevice.id == savedDevice.entityUniqueId.getOrCrash()) {
        //       deviceExist = true;
        //       break;
        //     } else if (savedDevice is GenericLightDE &&
        //         wizDevice.id == savedDevice.entityUniqueId.getOrCrash()) {
        //       tempCoreUniqueId = savedDevice.uniqueId;
        //       break;
        //     } else if (wizDevice.id ==
        //         savedDevice.entityUniqueId.getOrCrash()) {
        //       logger.w(
        //         'Wiz device type supported but implementation is missing here',
        //       );
        //       break;
        //     }
        //   }
        //   if (!deviceExist) {
        //     final DeviceEntityAbstract? addDevice =
        //         WizHelpers.addDiscoveredDevice(
        //       wizDevice: wizDevice,
        //       uniqueDeviceId: tempCoreUniqueId,
        //     );
        //
        //     if (addDevice == null) {
        //       continue;
        //     }
        //
        //     final DeviceEntityAbstract deviceToAdd =
        //         CompaniesConnectorConjecture().addDiscoveredDeviceToHub(addDevice);
        //
        //     final MapEntry<String, DeviceEntityAbstract> deviceAsEntry =
        //         MapEntry(deviceToAdd.uniqueId.getOrCrash(), deviceToAdd);
        //
        //     companyDevices.addEntries([deviceAsEntry]);
        //
        //     logger.i('New Wiz device got added');
        //   }
        // }
        await Future.delayed(const Duration(minutes: 3));
      } catch (e) {
        logger.e('Error discover in Wiz\n$e');
        await Future.delayed(const Duration(minutes: 1));
      }
    }
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract wizDE,
  ) async {
    final DeviceEntityAbstract? device =
        companyDevices[wizDE.entityUniqueId.getOrCrash()];

    if (device is WizWhiteEntity) {
      device.executeDeviceAction(newEntity: wizDE);
    } else {
      logger.w('Wiz device type does not exist');
    }
  }

  @override
  Future<void> setUpDeviceFromDb(DeviceEntityAbstract deviceEntity) async {}
}
