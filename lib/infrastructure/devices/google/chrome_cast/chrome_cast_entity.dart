import 'dart:async';

import 'package:cast/cast.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
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
    required DeviceEntityAbstract newEntity,
  }) async {
    // if (newEntity is! GenericSmartTvDE) {
    //   return left(
    //     const CoreFailure.actionExcecuter(
    //       failedValue: 'Not the correct type',
    //     ),
    //   );
    // }

    // try {
    //   if (newEntity.openUrl?.getOrCrash() != null &&
    //       (newEntity.openUrl?.getOrCrash() != openUrl?.getOrCrash() &&
    //           newEntity.entityStateGRPC.getOrCrash() !=
    //               EntityStateGRPC.ack.toString())) {
    //     (await sendUrlToDevice(newEntity.openUrl!.getOrCrash())).fold((l) {
    //       icLogger.e('Error opening url on ChromeCast');
    //       throw l;
    //     }, (r) {
    //       icLogger.i('ChromeCast opening url success');
    //     });
    //   }

    //   if (newEntity.pausePlayState?.getOrCrash() != null &&
    //       (newEntity.pausePlayState?.getOrCrash() !=
    //               pausePlayState?.getOrCrash() &&
    //           newEntity.entityStateGRPC.getOrCrash() !=
    //               EntityStateGRPC.ack.toString())) {
    //     (await togglePausePlay(newEntity.pausePlayState!.getOrCrash())).fold(
    //         (l) {
    //       icLogger.e('Error toggle pause or play on ChromeCast');
    //       throw l;
    //     }, (r) {
    //       icLogger.i('ChromeCast toggle pause or play success');
    //     });
    //   }

    //   entityStateGRPC = EntityState.state(EntityStateGRPC.ack);
    //   // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
    //   //   entityFromTheHub: this,
    //   // );
    //   return right(unit);
    // } catch (e) {
    //   entityStateGRPC = EntityState.state(EntityStateGRPC.newStateFailed);
    //   // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
    //   //   entityFromTheHub: this,
    //   // );

    return left(const CoreFailure.unexpected());
    // }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async {
    try {} catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async {
    try {} catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> sendUrlToDevice(String url) async {
    if (castDevice == null || sessionIsClosing) {
      return const Left(CoreFailure.unexpected());
    }

    sessionIsClosing = true;
    await session?.close();

    session = await CastSessionManager().startSession(castDevice!);
    sessionIsClosing = false;

    session?.stateStream.listen((state) {
      if (state == CastSessionState.connected) {
        icLogger.i('Cast is connected');
      }
    });

    var index = 0;

    session?.messageStream.listen((message) {
      index += 1;

      if (index == 2) {
        Future.delayed(const Duration(seconds: 5)).then((x) {
          _sendMessagePlayVideo(url);
        });
      }
    });

    session?.sendMessage(CastSession.kNamespaceReceiver, {
      'type': 'LAUNCH',
      'appId': 'CC1AD845', // set the appId of your app here
    });

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
    // try {
    //   pausePlayState =
    //       GenericSmartTvPausePlayState(EntityActions.pause.toString());

    //   final String nodeRedApiBaseTopic =
    //       IMqttServerRepository.instance.getNodeRedApiBaseTopic();

    //   final String nodeRedDevicesTopic =
    //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

    //   final String topic =
    //       '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.pauseVideoTopicProperty}';

    //   IMqttServerRepository.instance
    //       .publishMessage(topic, 'Media Command Pause');
    // } catch (e) {
    //   return left(const CoreFailure.unexpected());
    // }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePlay() async {
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> toggleStop() async {
    // try {
    //   pausePlayState =
    //       GenericSmartTvPausePlayState(EntityActions.stop.toString());

    //   final String nodeRedApiBaseTopic =
    //       IMqttServerRepository.instance.getNodeRedApiBaseTopic();

    //   final String nodeRedDevicesTopic =
    //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

    //   final String topic =
    //       '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.stopVideoTopicProperty}';

    //   IMqttServerRepository.instance
    //       .publishMessage(topic, 'Media Command Stop');
    // } catch (e) {
    //   return left(const CoreFailure.unexpected());
    // }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> skipBackward() async {
    // try {
    //   pausePlayState = GenericSmartTvPausePlayState(
    //     EntityActions.skipPreviousVid.toString(),
    //   );

    //   final String nodeRedApiBaseTopic =
    //       IMqttServerRepository.instance.getNodeRedApiBaseTopic();

    //   final String nodeRedDevicesTopic =
    //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

    //   final String topic =
    //       '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.queuePrevVideoTopicProperty}';

    //   IMqttServerRepository.instance
    //       .publishMessage(topic, 'Media Command Prev Queue');
    // } catch (e) {
    //   return left(const CoreFailure.unexpected());
    // }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> skipForeword() async {
    // try {
    //   pausePlayState =
    //       GenericSmartTvPausePlayState(EntityActions.skipNextVid.toString());

    //   final String nodeRedApiBaseTopic =
    //       IMqttServerRepository.instance.getNodeRedApiBaseTopic();

    //   final String nodeRedDevicesTopic =
    //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

    //   final String topic =
    //       '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.queueNextVideoTopicProperty}';

    //   IMqttServerRepository.instance
    //       .publishMessage(topic, 'Media Command Next Queue');
    // } catch (e) {
    //   return left(const CoreFailure.unexpected());
    // }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> closeApp() async {
    await session?.close();
    return right(unit);
  }

  void _sendMessagePlayVideo(String url) {
    final Map<String, Object> message = {
      // Here you can plug an URL to any mp4, webm, mp3 or jpg file with the proper contentType.
      'contentId': url,
      'contentType': 'video/mp4',
      'streamType': 'BUFFERED', // or LIVE

      // Title and cover displayed while buffering
      'metadata': {
        'type': 0,
        'metadataType': 0,
        'title': "Big Buck Bunny",
        'images': [
          {
            'url':
                'https://raw.githubusercontent.com/CyBear-Jinni/cbj_app/master/assets/cbj_half_app_logo.png',
          }
        ],
      },
    };

    if (session == null || sessionIsClosing) {
      return;
    }
    session?.sendMessage(CastSession.kNamespaceMedia, {
      'type': 'LOAD',
      'autoPlay': true,
      'currentTime': 0,
      'media': message,
    });
  }
}
