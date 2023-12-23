import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/vendors/wiz_login/generic_wiz_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class WizConnectorConjecture extends VendorConnectorConjectureService {
  factory WizConnectorConjecture() {
    return _instance;
  }

  WizConnectorConjecture._singletonContractor()
      : super(vendorsAndServices: VendorsAndServices.xiaomi);

  static final WizConnectorConjecture _instance =
      WizConnectorConjecture._singletonContractor();

  Future<String> accountLogin(GenericWizLoginDE genericWizLoginDE) async {
    // wizClient = WizClient(genericWizLoginDE.wizApiKey.getOrCrash());
    // _discoverNewDevices();
    return 'Success';
  }

  // @override
  // Future<HashMap<String, DeviceEntityBase>?> foundEntity(
  // DeviceEntityBase entity,
  // ) async {
  // icLogger.w('Wiz device got discovered but missing implementation');
  // final List<CoreUniqueId?> tempCoreUniqueId = [];
  //
  // for (final DeviceEntityBase savedDevice in companyDevices.values) {
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
  // final List<DeviceEntityBase> wizIpDevices =
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
  // for (final DeviceEntityBase entityAsDevice in wizIpDevices) {
  //   final DeviceEntityBase deviceToAdd =
  //       CompaniesConnectorConjecture().addDiscoveredDeviceToHub(entityAsDevice);
  //
  //   final MapEntry<String, DeviceEntityBase> deviceAsEntry =
  //       MapEntry(deviceToAdd.uniqueId.getOrCrash(), deviceToAdd);
  //
  //   companyDevices.addEntries([deviceAsEntry]);
  //
  //   logger.t(
  //     'New Wiz Ip device name:${entityAsDevice.cbjEntityName.getOrCrash()}',
  //   );
  // }
  // return null;
  // }

  // static WizClient? wizClient;

  // Future<void> _discoverNewDevices() async {
  // while (true) {
  // try {
  // final Iterable<WizBulb> lights =
  //     await wizClient!.listLights(const Selector());

  // for (final WizBulb wizDevice in lights) {
  //   CoreUniqueId? tempCoreUniqueId;
  //   bool deviceExist = false;
  //   for (final DeviceEntityBase savedDevice
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
  //     final DeviceEntityBase? addDevice =
  //         WizHelpers.addDiscoveredDevice(
  //       wizDevice: wizDevice,
  //       uniqueDeviceId: tempCoreUniqueId,
  //     );
  //
  //     if (addDevice == null) {
  //       continue;
  //     }
  //
  //     final DeviceEntityBase deviceToAdd =
  //         CompaniesConnectorConjecture().addDiscoveredDeviceToHub(addDevice);
  //
  //     final MapEntry<String, DeviceEntityBase> deviceAsEntry =
  //         MapEntry(deviceToAdd.uniqueId.getOrCrash(), deviceToAdd);
  //
  //     companyDevices.addEntries([deviceAsEntry]);
  //
  //     logger.i('New Wiz device got added');
  //   }
  // }
  // await Future.delayed(const Duration(minutes: 3));
  // } catch (e) {
  // icLogger.e('Error discover in Wiz\n$e');
  // await Future.delayed(const Duration(minutes: 1));
  // }
  // }
  // }

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async =>
      HashMap();
}
