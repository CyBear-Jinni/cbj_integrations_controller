import 'dart:io';

import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/domain/i_saved_devices_repo.dart';
import 'package:cbj_integrations_controller/domain/local_db/i_local_devices_db_repository.dart';
import 'package:cbj_integrations_controller/infrastructure/core/injection.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/companies_connector_conjecture.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/shared_variables.dart';
import 'package:cbj_integrations_controller/infrastructure/system_commands/device_pin_manager.dart';

Future initializeIntegrationsController({
  required String? projectRootDirectoryPath,
  required String env,
}) async {
  configureInjection(env);

  try {
    if (projectRootDirectoryPath != null) {
      await SharedVariables().asyncConstructor(projectRootDirectoryPath);
    } else {
      await SharedVariables().asyncConstructor(Directory.current.path);
    }
  } catch (error) {
    icLogger.e('Path/argument 1 is not specified\n$error');
  }

  //  Setting device model and checking if configuration for this model exist
  await DevicePinListManager().setPhysicalDeviceType();

  await ICbjIntegrationsControllerDbRepository.instance
      .initializeDb(isFlutter: false);

  icLogger.t('');
}

Future setupIntegrationsController() async {
  // Return all saved devices

  final Map<String, DeviceEntityAbstract> allDevices =
      await ISavedDevicesRepo.instance.getAllDevicesAfterInitialize();

  CompaniesConnectorConjecture().addAllDevicesToItsRepos(allDevices);

  CompaniesConnectorConjecture().searchAllMdnsDevicesAndSetThemUp();

  CompaniesConnectorConjecture().searchPingableDevicesAndSetThemUpByHostName();

  CompaniesConnectorConjecture().searchDevicesByBindingIntoSockets();

  CompaniesConnectorConjecture().searchDevicesByMqttPath();

  CompaniesConnectorConjecture().notImplementedDevicesSearch();
  await IMqttServerRepository.instance.asyncConstructor();
}
