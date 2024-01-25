import 'dart:async';

import 'package:cast/cast.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_smart_tv_entity/generic_smart_tv_entity.dart';
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
    super.pausePlayState,
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

  CastDevice? castDevice;
  bool sessionIsClosing = false;

  @override
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async => right(unit);

  @override
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async {
    await castDevice?.close();

    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> sendUrlToDevice(String url) async {
    await castDevice?.openMedia(
      url: url,
      title: 'Opend from CBJ App',
      coverImage: coverImage,
    );
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> openUrl(String url) async {
    await castDevice?.openUrl(url);
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> tts(String text) async {
    await castDevice?.tts(
      text: text,
      title: 'From CBJ App',
      coverImage: coverImage,
    );
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePausePlay() async => right(unit);

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
  Future<Either<CoreFailure, Unit>> volumeUp(double value) async {
    await castDevice?.volumeUp(value);
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> volumeDown(double value) async {
    await castDevice?.volumeDown(value);
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> openApp(OpenAppOnSmartTvEnum value) async {
    await castDevice?.launchAppId('Netflix');
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> skipBackward() async => right(unit);

  @override
  Future<Either<CoreFailure, Unit>> skipForeword() async => right(unit);

  @override
  Future<Either<CoreFailure, Unit>> closeApp() async => right(unit);
}
