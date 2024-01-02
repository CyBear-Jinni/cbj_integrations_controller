import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';

abstract class IAppCommunicationRepository {
  static late IAppCommunicationRepository instance;

  Future<void> getFromApp({
    required Stream<ClientStatusRequests> request,
    required String requestUrl,
    required bool isRemotePipes,
  });

  Future<void> startRemotePipesConnection(String remotePipesDomain);

  Future<void> startRemotePipesWhenThereIsConnectionToWww(
    String remotePipesDomain,
  );

  Future<void> sendAllAreasFromHubRequestsStream();
  Future<void> sendAllDevicesFromHubRequestsStream();
  Future<void> sendAllScenesFromHubRequestsStream();
}
