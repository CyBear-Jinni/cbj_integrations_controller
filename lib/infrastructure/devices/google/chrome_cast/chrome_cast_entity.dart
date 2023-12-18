import 'dart:async';

import 'package:cast/cast.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_tv_entity/generic_smart_tv_entity.dart';
import 'package:dartz/dartz.dart';

class ChromeCastEntity extends GenericSmartTvDE {
  ChromeCastEntity({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.stateMassage,
    required super.senderDeviceOs,
    required super.senderDeviceModel,
    required super.senderId,
    required super.compUuid,
    required super.entityStateGRPC,
    required super.powerConsumption,
    required super.deviceUniqueId,
    required super.devicePort,
    required super.deviceLastKnownIp,
    required super.deviceHostName,
    required super.deviceMdns,
    required super.srvResourceRecord,
    required super.ptrResourceRecord,
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.deviceCbjUniqueId,
    required super.smartTvSwitchState,
    super.openUrl,
    super.pausePlayState,
    super.skip,
    super.volume,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.google),
        ) {
    final int? port = int.tryParse(devicePort.getOrCrash() ?? '');
    final deviceLastKnownIp = this.deviceLastKnownIp.getOrCrash();
    if (port == null || deviceLastKnownIp == null) {
      return;
    }
    castDevice = CastDevice(
      serviceName: 'serviceName',
      name: 'name',
      host: deviceLastKnownIp,
      port: port,
    );
  }

  factory ChromeCastEntity.fromGeneric(GenericSmartTvDE genericDevice) {
    return ChromeCastEntity(
      uniqueId: genericDevice.uniqueId,
      entityUniqueId: genericDevice.entityUniqueId,
      cbjEntityName: genericDevice.cbjEntityName,
      entityOriginalName: genericDevice.entityOriginalName,
      deviceOriginalName: genericDevice.deviceOriginalName,
      deviceVendor: genericDevice.deviceVendor,
      deviceNetworkLastUpdate: genericDevice.deviceNetworkLastUpdate,
      stateMassage: genericDevice.stateMassage,
      senderDeviceOs: genericDevice.senderDeviceOs,
      senderDeviceModel: genericDevice.senderDeviceModel,
      senderId: genericDevice.senderId,
      compUuid: genericDevice.compUuid,
      entityStateGRPC: genericDevice.entityStateGRPC,
      powerConsumption: genericDevice.powerConsumption,
      deviceUniqueId: genericDevice.deviceUniqueId,
      devicePort: genericDevice.devicePort,
      deviceLastKnownIp: genericDevice.deviceLastKnownIp,
      deviceHostName: genericDevice.deviceHostName,
      deviceMdns: genericDevice.deviceMdns,
      srvResourceRecord: genericDevice.srvResourceRecord,
      ptrResourceRecord: genericDevice.ptrResourceRecord,
      devicesMacAddress: genericDevice.devicesMacAddress,
      entityKey: genericDevice.entityKey,
      requestTimeStamp: genericDevice.requestTimeStamp,
      lastResponseFromDeviceTimeStamp:
          genericDevice.lastResponseFromDeviceTimeStamp,
      deviceCbjUniqueId: genericDevice.deviceCbjUniqueId,
      smartTvSwitchState: genericDevice.smartTvSwitchState,
    );
  }

  // late ChromecastNodeRedApi chromecastNodeRedApi;
  CastDevice? castDevice;
  CastSession? session;
  bool sessionIsClosing = false;

  @override
  Future<Either<CoreFailure<dynamic>, Unit>> executeAction({
    required EntityProperties property,
    required EntityActions action,
    dynamic value,
  }) async {
    super.executeAction(property: property, action: action);
    final bool canBePreform =
        isPropertyAndActionCanBePreform(property: property, action: action);
    if (!canBePreform) {
      return const Left(CoreFailure.unexpected());
    }
    if (action == EntityActions.on) {
      return turnOnSmartTv();
    } else if (action == EntityActions.off) {
      return turnOffSmartTv();
    } else if (action == EntityActions.open) {
      if (value is! String) {
        return const Left(CoreFailure.unexpected());
      }
      return sendUrlToDevice(value);
    } else if (action == EntityActions.pausePlay) {
      return togglePausePlay();
    } else if (action == EntityActions.pause) {
      return togglePause();
    } else if (action == EntityActions.play) {
      return togglePlay();
    } else if (action == EntityActions.stop) {
      return toggleStop();
    } else if (action == EntityActions.skipBackward) {
      return skipBackward();
    } else if (action == EntityActions.skipForeword) {
      return skipForeword();
    } else if (action == EntityActions.close) {
      return closeApp();
    }

    return const Left(CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityBase newEntity,
  }) async {
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async {
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async {
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> sendUrlToDevice(String url) async {
    await castDevice?.openMedia(
      url: url,
      title: 'Opend from CBJ App',
      coverImage:
          'https://raw.githubusercontent.com/CyBear-Jinni/cbj_app/master/assets/cbj_half_app_logo.png',
    );
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePausePlay() async {
    return right(unit);

    // final bool plaing = pausePlayState?.getOrCrash() != null &&
    // pausePlayState?.getOrCrash() == true.toString();
    // return left(const CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePause() async {
    await castDevice?.pauseButton();
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePlay() async {
    await castDevice?.playButton();
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> toggleStop() async {
    await castDevice?.pauseButton();
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> skipBackward() async {
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> skipForeword() async {
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> closeApp() async {
    await session?.close();
    return right(unit);
  }
}
