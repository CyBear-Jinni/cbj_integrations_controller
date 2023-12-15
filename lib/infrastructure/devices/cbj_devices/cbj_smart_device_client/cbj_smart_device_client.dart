import 'dart:async';

import 'package:cbj_integrations_controller/domain/i_network_utilities.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/shared_variables.dart';
import 'package:grpc/grpc.dart';

class CbjSmartDeviceClient {
  CbjSmartDeviceClient() {
    // if (currentEnv == Env.prod) {
    //   smartDevicePort = 50054;
    // } else {
    smartDevicePort = 50054;
    // hubPort = 60054;
    // }
  }

  /// Port to connect to the cbj hub, will change according to the current
  /// running environment
  static int smartDevicePort = 50054;
  static ClientChannel? channel;
  static CbjSmartDeviceConnectionsClient? smartDeviceClient;

  static Future<List<CbjSmartDeviceInfo?>> getCbjSmartDeviceHostDevicesInfo(
    DeviceEntityAbstract entity,
  ) async {
    await channel?.terminate();

    channel = await _createCbjSmartDeviceClient(
      entity.deviceLastKnownIp.getOrCrash()!,
      smartDevicePort,
    );

    smartDeviceClient = CbjSmartDeviceConnectionsClient(channel!);

    try {
      final CbjCompSmartDeviceInfo response =
          await smartDeviceClient!.getCompInfo(CbjCommendStatus());
      final List<CbjSmartDeviceInfo> smartDevicesList =
          response.smartDevicesInComp;
      return smartDevicesList;
    } catch (e) {
      icLogger.e('Caught error while stream with cbj smart device\n$e');
      await channel?.shutdown();
    }
    return [];
  }

  static Future<ClientChannel> _createCbjSmartDeviceClient(
    String deviceIp,
    int hubPort,
  ) async {
    await channel?.shutdown();
    return ClientChannel(
      deviceIp,
      port: hubPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }

  // TODO: Change in the future that the smart device will publish itself using mdns
  static Future<GenericUnsupportedDE?> checkIfDeviceIsCbjSmartDevice(
    String? deviceIp,
  ) async {
    final String? subnet = await SharedVariables().getIps();

    if (subnet == null) {
      return null;
    }

    return INetworkUtilities.instance.deviceFromPort(subnet, smartDevicePort);
  }

  static Future<CbjCommendStatus?> suspendCbjSmartDeviceHostDevice(
    String address,
    String cbjDeviceId,
  ) async {
    await channel?.terminate();

    channel = await _createCbjSmartDeviceClient(address, smartDevicePort);

    smartDeviceClient = CbjSmartDeviceConnectionsClient(channel!);

    try {
      final CbjCommendStatus response = await smartDeviceClient!
          .suspendComputer(CbjSmartDeviceInfo(id: cbjDeviceId));

      return response;
    } catch (e) {
      icLogger.e('Caught error while suspending cbj smart device\n$e');
      await channel?.shutdown();
    }
    return null;
  }

  static Future<CbjCommendStatus?> shutDownCbjSmartDeviceHostDevice(
    String address,
    String cbjDeviceId,
  ) async {
    await channel?.terminate();

    channel = await _createCbjSmartDeviceClient(address, smartDevicePort);

    smartDeviceClient = CbjSmartDeviceConnectionsClient(channel!);

    try {
      final CbjCommendStatus response = await smartDeviceClient!
          .shutdownComputer(CbjSmartDeviceInfo(id: cbjDeviceId));

      return response;
    } catch (e) {
      icLogger.e('Caught error while shut down cbj smart device\n$e');
      await channel?.shutdown();
    }
    return null;
  }
}
