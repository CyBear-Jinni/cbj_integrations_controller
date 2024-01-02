import 'dart:convert';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/domain/remote_pipes/remote_pipes_failures.dart';
import 'package:cbj_integrations_controller/src/infrastructure/remote_pipes/remote_pipes_dtos.dart';
import 'package:dartz/dartz.dart';

part 'package:cbj_integrations_controller/src/infrastructure/remote_pipes_repository.dart';

abstract class IRemotePipesRepository {
  static IRemotePipesRepository? _instance;

  static IRemotePipesRepository get instance {
    return _instance ??= _RemotePipesRepository();
  }

  Future<Either<RemotePipesFailures, Unit>> setRemotePipesDomainName(
    RemotePipesEntity remotePipesEntity,
  );
}
