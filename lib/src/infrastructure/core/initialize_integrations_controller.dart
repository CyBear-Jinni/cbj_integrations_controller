import 'dart:io';

import 'package:cbj_integrations_controller/src/domain/local_db/i_local_db_repository.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/injection.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/shared_variables.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/device_pin_manager.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';

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

  await IDbRepository.instance.initializeDb(isFlutter: false);

  icLogger.t('');
}

Future setupIntegrationsController() async {
  VendorsConnectorConjecture();
}
