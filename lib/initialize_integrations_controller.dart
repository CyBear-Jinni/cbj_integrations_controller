import 'dart:io';

import 'package:cbj_integrations_controller/domain/local_db/i_local_devices_db_repository.dart';
import 'package:cbj_integrations_controller/domain/mqtt_server/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/domain/saved_devices/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/companies_connector_conjector.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/shared_variables.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/device_pin_manager.dart';
import 'package:cbj_integrations_controller/injection.dart';
import 'package:cbj_integrations_controller/utils.dart';

Future initializeIntegrationsController({
  required String? projectRootDirectoryPath,
  required String env,
}) async {
  configureInjection(env);

  try {
    if (projectRootDirectoryPath != null) {
      await SharedVariables.instance.asyncConstractor(projectRootDirectoryPath);
    } else {
      await SharedVariables.instance.asyncConstractor(Directory.current.path);
    }
  } catch (error) {
    logger.e('Path/argument 1 is not specified\n$error');
  }

  //  Setting device model and checking if configuration for this model exist
  await DevicePinListManager().setPhysicalDeviceType();

  await ILocalDbRepository.instance.initializeDb();

  logger.t('');
}

Future setupIntegrationsController() async {
  // Return all saved devices

  final Map<String, DeviceEntityAbstract> allDevices =
      await ISavedDevicesRepo.instance.getAllDevices();

  CompaniesConnectorConjector.addAllDevicesToItsRepos(allDevices);

  CompaniesConnectorConjector.searchAllMdnsDevicesAndSetThemUp();

  CompaniesConnectorConjector.searchPingableDevicesAndSetThemUpByHostName();

  CompaniesConnectorConjector.searchDevicesByBindingIntoSockets();

  CompaniesConnectorConjector.searchDevicesByMqttPath();

  CompaniesConnectorConjector.notImplementedDevicesSearch();
  await IMqttServerRepository.instance.asyncConstractor();
}
