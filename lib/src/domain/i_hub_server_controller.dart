import 'package:cbj_integrations_controller/integrations_controller.dart';

abstract class IHubServerController {
  static late IHubServerController instance;

  Future getFromApp({
    required Stream<ClientStatusRequests> request,
    required String requestUrl,
    required bool isRemotePipes,
  });

  Future startRemotePipesConnection(String remotePipesDomain);

  Future startRemotePipesWhenThereIsConnectionToWww(
    String remotePipesDomain,
  );

  Future sendAllAreasFromHubRequestsStream();
  Future sendAllEntitiesFromHubRequestsStream();
  Future sendAllScenesFromHubRequestsStream();

  Future sendAllEntities();
  Future sendAllAreas();
  Future sendAllScenes();
}
