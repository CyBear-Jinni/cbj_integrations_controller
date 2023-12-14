import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_entity.dart';
import 'package:network_tools/network_tools.dart';

part 'package:cbj_integrations_controller/infrastructure/network_utilities.dart';

abstract class INetworkUtilities {
  static INetworkUtilities? _instance;

  static INetworkUtilities get instance {
    return _instance ??= _NetworkUtilities();
  }

  Future<GenericUnsupportedDE> activeHostToEntity(
    ActiveHost activeHost,
  );

  Future<GenericUnsupportedDE?> deviceFromPort(String address, int port);
}
