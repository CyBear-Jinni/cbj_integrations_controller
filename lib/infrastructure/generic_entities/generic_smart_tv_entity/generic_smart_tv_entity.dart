import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_tv_entity/generic_smart_tv_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_tv_entity/generic_smart_tv_value_objects.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericSmartTv that exist inside a computer, the
/// implementations will be actual GenericSmartTv like blinds smartTvs and more
class GenericSmartTvDE extends DeviceEntityBase {
  /// All public field of GenericSmartTv entity
  GenericSmartTvDE({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjDeviceVendor,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
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
    required super.devicesMacAddress,
    required super.deviceMdns,
    required super.srvResourceRecord,
    required super.ptrResourceRecord,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.deviceCbjUniqueId,
    required this.smartTvSwitchState,
    this.openUrl,
    this.pausePlayState,
    this.skip,
    this.volume,
  }) : super(
          entityTypes: EntityType.type(EntityTypes.smartTV),
        );

  /// Empty instance of GenericSmartTvEntity
  factory GenericSmartTvDE.empty() => GenericSmartTvDE(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(''),
        cbjEntityName: CbjEntityName(''),
        entityOriginalName: EntityOriginalName(''),
        deviceOriginalName: DeviceOriginalName(''),
        entityStateGRPC: EntityState(''),
        senderDeviceOs: DeviceSenderDeviceOs(''),
        senderDeviceModel: DeviceSenderDeviceModel(''),
        stateMassage: DeviceStateMassage(''),
        senderId: DeviceSenderId(),
        cbjDeviceVendor: CbjDeviceVendor(''),
        deviceVendor: DeviceVendor(null),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
        deviceUniqueId: DeviceUniqueId(''),
        devicePort: DevicePort(''),
        deviceLastKnownIp: DeviceLastKnownIp(''),
        deviceHostName: DeviceHostName(''),
        deviceMdns: DeviceMdns(''),
        srvResourceRecord: DeviceSrvResourceRecord(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        compUuid: DeviceCompUuid(''),
        powerConsumption: DevicePowerConsumption(''),
        devicesMacAddress: DevicesMacAddress(''),
        entityKey: EntityKey(''),
        requestTimeStamp: RequestTimeStamp(''),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
        deviceCbjUniqueId: CoreUniqueId(),
        smartTvSwitchState:
            GenericSmartTvSwitchState(EntityActions.off.toString()),
      );

  /// State of the smartTv on/off
  GenericSmartTvSwitchState? smartTvSwitchState;
  GenericSmartTvOpenUrl? openUrl;
  GenericSmartTvPausePlayState? pausePlayState;
  GenericSmartTvSkipBackOrForward? skip;
  GenericSmartTvVolume? volume;

  /// Precent of the volume up/down change
  static const int volumeChangePrecent = 10;
  static const double volumeMax = 1;

  static const double _volumeChange = (volumeChangePrecent * volumeMax) / 100;

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() {
    return GenericSmartTvSwitchState.smartTvValidActions();
  }

  @override
  DeviceEntityDtoBase toInfrastructure() {
    return GenericSmartTvDeviceDtos(
      deviceDtoClass: (GenericSmartTvDeviceDtos).toString(),
      id: uniqueId.getOrCrash(),
      entityUniqueId: entityUniqueId.getOrCrash(),
      cbjEntityName: cbjEntityName.getOrCrash(),
      entityOriginalName: entityOriginalName.getOrCrash(),
      deviceOriginalName: deviceOriginalName.getOrCrash(),
      entityStateGRPC: entityStateGRPC.getOrCrash(),
      stateMassage: stateMassage.getOrCrash(),
      senderDeviceOs: senderDeviceOs.getOrCrash(),
      senderDeviceModel: senderDeviceModel.getOrCrash(),
      senderId: senderId.getOrCrash(),
      entityTypes: entityTypes.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      powerConsumption: powerConsumption.getOrCrash(),
      deviceUniqueId: deviceUniqueId.getOrCrash(),
      devicePort: devicePort.getOrCrash(),
      deviceLastKnownIp: deviceLastKnownIp.getOrCrash(),
      deviceHostName: deviceHostName.getOrCrash(),
      deviceMdns: deviceMdns.getOrCrash(),
      srvResourceRecord: srvResourceRecord.getOrCrash(),
      ptrResourceRecord: ptrResourceRecord.getOrCrash(),
      devicesMacAddress: devicesMacAddress.getOrCrash(),
      entityKey: entityKey.getOrCrash(),
      requestTimeStamp: requestTimeStamp.getOrCrash(),
      lastResponseFromDeviceTimeStamp:
          lastResponseFromDeviceTimeStamp.getOrCrash(),
      deviceCbjUniqueId: deviceCbjUniqueId.getOrCrash(),
      smartTvSwitchState: smartTvSwitchState!.getOrCrash(),
      cbjDeviceVendor: cbjDeviceVendor.getOrCrash(),
      deviceVendor: deviceVendor.getOrCrash(),
      deviceNetworkLastUpdate: deviceNetworkLastUpdate.getOrCrash(),
      openUrl: openUrl?.getOrCrash(),
      pausePlayState: pausePlayState?.getOrCrash(),
      skip: skip?.getOrCrash(),
      volume: volume?.getOrCrash(),
    );
  }

  @override
  Future<Either<CoreFailure<dynamic>, Unit>> executeAction({
    required EntityProperties property,
    required EntityActions action,
    HashMap<ActionValues, dynamic>? value,
  }) async {
    switch (action) {
      case EntityActions.on:
        return turnOnSmartTv();
      case EntityActions.off:
        return turnOffSmartTv();
      case EntityActions.open:
        final dynamic url = value?[ActionValues.url];
        if (url is! String) {
          return const Left(CoreFailure.unexpected());
        }
        if (url == 'netflix') {
          return openApp(OpenAppOnSmartTvEnum.netflix);
        }
        return sendUrlToDevice(url);
      case EntityActions.pausePlay:
        return togglePausePlay();
      case EntityActions.pause:
        return togglePause();
      case EntityActions.play:
        return togglePlay();
      case EntityActions.stop:
        return toggleStop();
      case EntityActions.skipBackward:
        return skipBackward();
      case EntityActions.skipForeword:
        return skipForeword();
      case EntityActions.close:
        return closeApp();
      case EntityActions.volumeUp:
        return volumeUp(GenericSmartTvDE._volumeChange);
      case EntityActions.volumeDown:
        return volumeDown(GenericSmartTvDE._volumeChange);
      default:
        break;
    }

    return super
        .executeAction(property: property, action: action, value: value);
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> openApp(OpenAppOnSmartTvEnum value) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> volumeUp(double value) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> volumeDown(double value) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> sendUrlToDevice(String newUrl) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> togglePausePlay() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> togglePause() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> togglePlay() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> toggleStop() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> skipForeword() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> skipBackward() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> closeApp() async => pleaseOverrideMessage();

  @override
  bool replaceActionIfExist(String action) {
    if (GenericSmartTvSwitchState.smartTvValidActions().contains(action)) {
      smartTvSwitchState = GenericSmartTvSwitchState(action);
      return true;
    }
    return false;
  }

  @override
  List<EntityProperties> getListOfPropertiesToChange() {
    return [
      EntityProperties.smartTvSwitchState,
      EntityProperties.openUrl,
      EntityProperties.skip,
      EntityProperties.volume,
    ];
  }
}

enum OpenAppOnSmartTvEnum {
  netflix,
  ;
}
