import 'dart:async';

import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv/generic_smart_tv_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv/generic_smart_tv_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:nodered/nodered.dart';

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
          cbjDeviceVendor:
              CbjDeviceVendor(VendorsAndServices.google.toString()),
        ) {
    setUpNodeRedApi();
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

  late ChromecastNodeRedApi chromecastNodeRedApi;

  Future<void> setUpNodeRedApi() async {
    // TODO: add check to add  uniqueId + action as flow in node read only if missing
    if (deviceLastKnownIp.getOrCrash() == null) {
      icLogger.w('Chromecast last known ip is null');
      return;
    }

    // chromecastNodeRedApi = ChromecastNodeRedApi(
    //   repository: getIt<NodeRedRepository>(),
    //   nodeRedApiBaseTopic:
    //       IMqttServerRepository.instance.getNodeRedApiBaseTopic(),
    //   nodeRedDevicesTopic:
    //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName(),
    //   nodeRedMqttBrokerNodeName: 'Cbj NodeRed plugs Api Broker',
    // );

    chromecastNodeRedApi.setNewYoutubeVideoNodes(
      uniqueId.getOrCrash(),
      deviceLastKnownIp.getOrCrash()!,
    );
  }

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  }) async {
    if (newEntity is! GenericSmartTvDE) {
      return left(
        const CoreFailure.actionExcecuter(
          failedValue: 'Not the correct type',
        ),
      );
    }

    try {
      if (newEntity.openUrl?.getOrCrash() != null &&
          (newEntity.openUrl?.getOrCrash() != openUrl?.getOrCrash() &&
              newEntity.entityStateGRPC.getOrCrash() !=
                  EntityStateGRPC.ack.toString())) {
        (await sendUrlToDevice(newEntity.openUrl!.getOrCrash())).fold((l) {
          icLogger.e('Error opening url on ChromeCast');
          throw l;
        }, (r) {
          icLogger.i('ChromeCast opening url success');
        });
      }

      if (newEntity.pausePlayState?.getOrCrash() != null &&
          (newEntity.pausePlayState?.getOrCrash() !=
                  pausePlayState?.getOrCrash() &&
              newEntity.entityStateGRPC.getOrCrash() !=
                  EntityStateGRPC.ack.toString())) {
        (await togglePausePlay(newEntity.pausePlayState!.getOrCrash())).fold(
            (l) {
          icLogger.e('Error toggle pause or play on ChromeCast');
          throw l;
        }, (r) {
          icLogger.i('ChromeCast toggle pause or play success');
        });
      }

      entityStateGRPC = EntityState(EntityStateGRPC.ack.toString());
      // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
      //   entityFromTheHub: this,
      // );
      return right(unit);
    } catch (e) {
      entityStateGRPC = EntityState(EntityStateGRPC.newStateFailed.toString());
      // IMqttServerRepository.instance.postSmartDeviceToAppMqtt(
      //   entityFromTheHub: this,
      // );

      return left(const CoreFailure.unexpected());
    }
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
  Future<Either<CoreFailure, Unit>> sendUrlToDevice(String newUrl) async {
    try {
      openUrl = GenericSmartTvOpenUrl(newUrl);
      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.playingVideoTopicProperty}';

      String validYoutubeVidId = openUrl!.getOrCrash();
      if (validYoutubeVidId.contains('?v=')) {
        validYoutubeVidId =
            validYoutubeVidId.substring(validYoutubeVidId.indexOf('?v=') + 3);
      }
      if (validYoutubeVidId.contains('&index=')) {
        final int valueOfAndIndexEqual = validYoutubeVidId.indexOf('&index=');
        validYoutubeVidId = validYoutubeVidId.substring(
          0,
          valueOfAndIndexEqual,
        );
      }
      if (validYoutubeVidId.contains('&list=')) {
        final int valueOfAndIndexEqual = validYoutubeVidId.indexOf('&list=');
        validYoutubeVidId = validYoutubeVidId.substring(
          0,
          valueOfAndIndexEqual,
        );
      }
      IMqttServerRepository.instance.publishMessage(topic, validYoutubeVidId);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePausePlay(
    String toggleNewState,
  ) async {
    if (toggleNewState == EntityActions.pause.toString()) {
      return togglePause();
    } else if (toggleNewState == EntityActions.play.toString()) {
      return togglePlay();
    } else if (toggleNewState == EntityActions.stop.toString()) {
      return toggleStop();
    } else if (toggleNewState == EntityActions.skipPreviousVid.toString()) {
      return queuePrev();
    } else if (toggleNewState == EntityActions.skipNextVid.toString()) {
      return queueNext();
    } else if (toggleNewState == EntityActions.close.toString()) {
      return closeApp();
    }
    return left(const CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePause() async {
    try {
      pausePlayState =
          GenericSmartTvPausePlayState(EntityActions.pause.toString());

      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.pauseVideoTopicProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, 'Media Command Pause');
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePlay() async {
    try {
      pausePlayState =
          GenericSmartTvPausePlayState(EntityActions.play.toString());

      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.playVideoTopicProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, 'Media Command Play');
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> toggleStop() async {
    try {
      pausePlayState =
          GenericSmartTvPausePlayState(EntityActions.stop.toString());

      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.stopVideoTopicProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, 'Media Command Stop');
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> queuePrev() async {
    try {
      pausePlayState = GenericSmartTvPausePlayState(
        EntityActions.skipPreviousVid.toString(),
      );

      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.queuePrevVideoTopicProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, 'Media Command Prev Queue');
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> queueNext() async {
    try {
      pausePlayState =
          GenericSmartTvPausePlayState(EntityActions.skipNextVid.toString());

      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.queueNextVideoTopicProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, 'Media Command Next Queue');
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> closeApp() async {
    try {
      pausePlayState =
          GenericSmartTvPausePlayState(EntityActions.close.toString());

      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();

      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${uniqueId.getOrCrash()}/${chromecastNodeRedApi.youtubeVideoTopicProperty}/${chromecastNodeRedApi.closeAppTopicProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, 'Media Command Next Queue');
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }
}
