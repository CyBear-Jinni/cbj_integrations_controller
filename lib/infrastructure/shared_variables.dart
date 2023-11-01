import 'dart:io';

import 'package:cbj_integrations_controller/utils.dart';

class SharedVariables {
  SharedVariables(String? projectRootDirectoryPath) {
    _projectRootDirectoryPath = projectRootDirectoryPath;
    logger.i('PATH: $_projectRootDirectoryPath');
    SharedVariables.instance = this;
  }

  static late SharedVariables instance;

  Future<void> asyncConstractor(String projectRootDirectoryPath) async {
    _projectRootDirectoryPath = projectRootDirectoryPath;
    logger.t('PATH: $_projectRootDirectoryPath');
  }

  ///  Save the location of all the files that were created during the snapcraft
  static String? _projectRootDirectoryPath;

  static String? getProjectRootDirectoryPath() => _projectRootDirectoryPath;

  /// Getting snap location environment variable value of $SNAP
  static String? getSnapLocationEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/snap/cbj-hub/current';
  }

  /// Getting snap common environment variable value of SNAP_COMMON
  static String? getSnapCommonEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/var/snap/cbj-hub/common';
  }

  /// Getting snap user common environment variable, value of $SNAP_USER_COMMON
  static String? getSnapUserCommonEnvironmentVariable() {
    if (!_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/root/snap/cbj-hub/common';
  }

  ///  Get Ip info
  Future<String?> getIps() async {
    for (final NetworkInterface interface in await NetworkInterface.list()) {
//      print('== Interface: ${interface.name} ==');
      for (final InternetAddress address in interface.addresses) {
//        print(
//            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
        return address.address;
      }
    }
    return null;
  }
}
