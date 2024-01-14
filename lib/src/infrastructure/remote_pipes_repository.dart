part of 'package:cbj_integrations_controller/src/domain/remote_pipes/i_remote_pipes_repository.dart';

class _RemotePipesRepository implements IRemotePipesRepository {
  @override
  Future<Either<RemotePipesFailures, Unit>> setRemotePipesDomainName(
    RemotePipesEntity remotePipesEntity,
  ) async {
    try {
      final RemotePipesDtos remotePipesDtos =
          remotePipesEntity.toInfrastructure();
      // final String remotePipesDtosAsJson = jsonEncode(remotePipesDtos.toJson());

      // final ClientStatusRequests clientStatusRequests = ClientStatusRequests(
      //   allRemoteCommands: remotePipesDtosAsJson,
      //   sendingType: SendingType.remotePipesInformation.name,
      // );

      // AppRequestsToHub.appRequestsToHubStreamController
      //     .add(clientStatusRequests);

      IDbRepository.instance
          .saveRemotePipes(remotePipesDomainName: remotePipesDtos.domainName);

      return right(unit);
    } catch (e) {
      return left(const RemotePipesFailures.unexpected());
    }
  }
}
