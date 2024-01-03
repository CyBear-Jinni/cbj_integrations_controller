import 'package:cbj_integrations_controller/integrations_controller.dart';

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
