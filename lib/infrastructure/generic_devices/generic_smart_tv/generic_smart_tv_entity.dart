import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv/generic_smart_tv_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv_device/generic_smart_tv_device_dtos.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericSmartTv that exist inside a computer, the
/// implementations will be actual GenericSmartTv like blinds smartTvs and more
class GenericSmartTvDE extends DeviceEntityAbstract {
  /// All public field of GenericSmartTv entity
  GenericSmartTvDE({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.deviceVendor,
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
          entityTypes: EntityType(EntityTypes.smartTV.toString()),
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
        deviceVendor: DeviceVendor(''),
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

  //
  // /// Will return failure if any of the fields failed or return unit if fields
  // /// have legit values
  Option<CoreFailure<dynamic>> get failureOption =>
      cbjEntityName.value.fold((f) => some(f), (_) => none());
  //
  // return body.failureOrUnit
  //     .andThen(todos.failureOrUnit)
  //     .andThen(
  //       todos
  //           .getOrCrash()
  //           // Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
  //           .map((todoItem) => todoItem.failureOption)
  //           .filter((o) => o.isSome())
  //           // If we can't get the 0th element, the list is empty. In such a case, it's valid.
  //           .getOrElse(0, (_) => none())
  //           .fold(() => right(unit), (f) => left(f)),
  //     )
  //     .fold((f) => some(f), (_) => none());
  // }

  @override
  String getDeviceId() => uniqueId.getOrCrash();

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() {
    return GenericSmartTvSwitchState.smartTvValidActions();
  }

  @override
  DeviceEntityDtoAbstract toInfrastructure() {
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
      deviceVendor: deviceVendor.getOrCrash(),
      openUrl: openUrl?.getOrCrash(),
      pausePlayState: pausePlayState?.getOrCrash(),
      skip: skip?.getOrCrash(),
      volume: volume?.getOrCrash(),
    );
  }

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  }) async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> sendUrlToDevice(String newUrl) async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> togglePausePlay(
    String toggleNewState,
  ) async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> togglePause() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> togglePlay() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> toggleStop() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> queueNext() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> queuePrev() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> closeApp() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  @override
  bool replaceActionIfExist(String action) {
    if (GenericSmartTvSwitchState.smartTvValidActions().contains(action)) {
      smartTvSwitchState = GenericSmartTvSwitchState(action);
      return true;
    }
    return false;
  }

  @override
  List<String> getListOfPropertiesToChange() {
    return [
      'smartTvSwitchState',
      'openUrl',
      'skip',
      'volume',
    ];
  }
}
