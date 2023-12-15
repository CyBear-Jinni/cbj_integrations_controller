import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/vendors/wiz_login/generic_wiz_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/wiz/wiz_white/wiz_white_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/abstract_vendor_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';

class WizConnectorConjecture extends AbstractVendorConnectorConjecture {
  factory WizConnectorConjecture() {
    return _instance;
  }

  WizConnectorConjecture._singletonContractor();

  static final WizConnectorConjecture _instance =
      WizConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.wiz;

  Future<String> accountLogin(GenericWizLoginDE genericWizLoginDE) async {
    // wizClient = WizClient(genericWizLoginDE.wizApiKey.getOrCrash());
    _discoverNewDevices();
    return 'Success';
  }

  @override
  Future<HashMap<String, DeviceEntityAbstract>?> foundEntity(
    DeviceEntityAbstract entity,
  ) async {
    icLogger.w('Wiz device got discovered but missing implementation');
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
    return null;
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
        icLogger.e('Error discover in Wiz\n$e');
        await Future.delayed(const Duration(minutes: 1));
      }
    }
  }

  @override
  Future<void> manageHubRequestsForDevice(
    DeviceEntityAbstract wizDE,
  ) async {
    final DeviceEntityAbstract? device =
        vendorEntities[wizDE.entityUniqueId.getOrCrash()];

    if (device is WizWhiteEntity) {
      device.executeDeviceAction(newEntity: wizDE);
    } else {
      icLogger.w('Wiz device type does not exist');
    }
  }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityAbstract deviceEntity) async {}
}
