import 'dart:convert';

import 'package:cbj_integrations_controller/domain/local_db/i_local_devices_db_repository.dart';
import 'package:cbj_integrations_controller/domain/remote_pipes/i_remote_pipes_repository.dart';
import 'package:cbj_integrations_controller/domain/remote_pipes/remote_pipes_entity.dart';
import 'package:cbj_integrations_controller/domain/remote_pipes/remote_pipes_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';
import 'package:cbj_integrations_controller/infrastructure/remote_pipes/remote_pipes_dtos.dart';
import 'package:dartz/dartz.dart';

class RemotePipesRepository implements IRemotePipesRepository {
  @override
  Future<Either<RemotePipesFailures, Unit>> setRemotePipesDomainName(
    RemotePipesEntity remotePipesEntity,
  ) async {
    try {
      final RemotePipesDtos remotePipesDtos =
          remotePipesEntity.toInfrastructure();
      final String remotePipesDtosAsJson = jsonEncode(remotePipesDtos.toJson());

      final ClientStatusRequests clientStatusRequests = ClientStatusRequests(
        allRemoteCommands: remotePipesDtosAsJson,
        sendingType: SendingType.remotePipesInformation,
      );

      AppRequestsToHub.appRequestsToHubStreamController
          .add(clientStatusRequests);

      ILocalDbRepository.instance
          .saveRemotePipes(remotePipesDomainName: remotePipesDtos.domainName);

      return right(unit);
    } catch (e) {
      return left(const RemotePipesFailures.unexpected());
    }
  }
}
