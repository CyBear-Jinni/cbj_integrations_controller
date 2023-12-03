import 'dart:convert';

import 'package:cbj_integrations_controller/domain/local_db/i_local_devices_db_repository.dart';
import 'package:cbj_integrations_controller/domain/remote_pipes/remote_pipes_entity.dart';
import 'package:cbj_integrations_controller/domain/remote_pipes/remote_pipes_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';
import 'package:cbj_integrations_controller/infrastructure/remote_pipes/remote_pipes_dtos.dart';
import 'package:dartz/dartz.dart';

part 'package:cbj_integrations_controller/infrastructure/remote_pipes/remote_pipes_repository.dart';

abstract class IRemotePipesRepository {
  static IRemotePipesRepository? _instance;

  static IRemotePipesRepository get instance {
    return _instance ??= _RemotePipesRepository();
  }

  Future<Either<RemotePipesFailures, Unit>> setRemotePipesDomainName(
    RemotePipesEntity remotePipesEntity,
  );
}
