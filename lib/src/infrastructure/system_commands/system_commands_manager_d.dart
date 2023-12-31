import 'dart:io';

import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/shared_variables.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/bash_commands_d/bash_commands_for_raspberry_pi_d.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/bash_commands_d/common_bash_commands_d.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/batch_commands_d/common_batch_commands_d.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/phone_commands_d/common_batch_commands_d.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/system_commands_base_class_d.dart';
import 'package:multicast_dns/multicast_dns.dart';

class SystemCommandsManager {
  factory SystemCommandsManager() {
    return _instance;
  }

  SystemCommandsManager._singletonContractor() {
    if (Platform.isAndroid || Platform.isIOS) {
      icLogger.t('Mobile platform detected in SystemCommandsManager');
      systemCommandsBaseClassD = IPhoneCommandsD.instance;
    } else if (Platform.isLinux) {
      icLogger.t('Linux platform detected in SystemCommandsManager');
      systemCommandsBaseClassD = CommonBashCommandsD();
    } else if (Platform.isWindows) {
      icLogger.t('Windows platform detected in SystemCommandsManager');
      systemCommandsBaseClassD = CommonBatchCommandsD();
    } else if (Platform.isMacOS) {
      icLogger.w('Mac os is currently not supported in SystemCommandsManager');
      throw 'Mac os is currently not supported';
    } else {
      icLogger.e(
        '${Platform.operatingSystem} os is not supported in SystemCommandsManager',
      );
      throw '${Platform.operatingSystem} os is not supported';
    }
  }

  static final SystemCommandsManager _instance =
      SystemCommandsManager._singletonContractor();

  SystemCommandsBaseClassD? systemCommandsBaseClassD;

  Future<String> getCurrentUserName() {
    return systemCommandsBaseClassD!.getCurrentUserName();
  }

  Future<String> getLocalDbPath() {
    return systemCommandsBaseClassD!.getLocalDbPath(
      getCurrentUserName(),
    );
  }

  Future<String> getProjectFilesLocation() {
    return systemCommandsBaseClassD!.getProjectFilesLocation();
  }

  Future<String> getDeviceHostName() {
    return systemCommandsBaseClassD!.getDeviceHostName();
  }

  Future<String> getAllEtcReleaseFilesText() {
    return systemCommandsBaseClassD!.getAllEtcReleaseFilesText();
  }

  Future<String?> getFileContent(String fileFullPath) {
    return systemCommandsBaseClassD!.getFileContent(fileFullPath);
  }

  Future<String> getUuidOfCurrentDevice() {
    return systemCommandsBaseClassD!.getUuidOfCurrentDevice();
  }

  Future<String?> getDeviceConfiguration() {
    return systemCommandsBaseClassD!.getDeviceConfiguration();
  }

  Future<String?> getRaspberryPiDeviceVersion() {
    return BashCommandsForRaspberryPi.getRaspberryPiDeviceVersion();
  }

  Future<String?> getIpFromMdnsName(
    String mdnsName,
    String mdnsServiceType,
  ) async {
    try {
      final MDnsClient client = MDnsClient();
      await client.start();

      await for (final PtrResourceRecord _ in client.lookup<PtrResourceRecord>(
        ResourceRecordQuery.serverPointer(mdnsServiceType),
      )) {
        await for (final IPAddressResourceRecord ip
            in client.lookup<IPAddressResourceRecord>(
          ResourceRecordQuery.addressIPv4(mdnsName),
        )) {
          return ip.address.address;
        }
      }
      client.stop();
    } catch (e) {
      icLogger.e('Error mdns lookup $e');
    }
    return null;
  }

  Future<String?> getSnapLocationEnvironmentVariable() {
    return Future.value(SharedVariables().getSnapLocationEnvironmentVariable());
  }

  Future<String?> getSnapCommonEnvironmentVariable() {
    return Future.value(SharedVariables().getSnapCommonEnvironmentVariable());
  }

  Future<String?> getSnapUserCommonEnvironmentVariable() {
    return Future.value(
      SharedVariables().getSnapUserCommonEnvironmentVariable(),
    );
  }

  String getOs() {
    return Platform.operatingSystem;
  }

  String getOsVersion() {
    return Platform.operatingSystemVersion;
  }

  Future<String?> suspendComputer() async {
    return systemCommandsBaseClassD!.suspendComputer();
  }

  Future<String?> shutdownComputer() async {
    return systemCommandsBaseClassD!.shutdownComputer();
  }
}
