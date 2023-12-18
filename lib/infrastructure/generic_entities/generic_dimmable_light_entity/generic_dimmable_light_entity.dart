import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_value_objects.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericLightWithBrightness that exist inside a computer, the
/// implementations will be actual GenericLightWithBrightness like blinds lights and more
class GenericDimmableLightDE extends DeviceEntityBase {
  /// All public field of GenericLightWithBrightness entity
  GenericDimmableLightDE({
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
    required super.deviceMdns,
    required super.srvResourceRecord,
    required super.ptrResourceRecord,
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.deviceCbjUniqueId,
    required this.lightSwitchState,
    required this.lightBrightness,
  }) : super(
          entityTypes: EntityType.type(EntityTypes.dimmableLight),
        );

  /// Empty instance of GenericLightWithBrightnessEntity
  factory GenericDimmableLightDE.empty() => GenericDimmableLightDE(
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
        lightSwitchState:
            GenericDimmableLightSwitchState(EntityActions.off.toString()),
        lightBrightness: GenericDimmableLightBrightness(''),
      );

  /// State of the light on/off
  GenericDimmableLightSwitchState lightSwitchState;

  /// Brightness 0-100%
  GenericDimmableLightBrightness lightBrightness;

  int sendNewBrightnessEachMilliseconds = 200;
  bool doesWaitingToSendBrightnessRequest = false;

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
    return GenericDimmableLightSwitchState.lightValidActions();
  }

  @override
  DeviceEntityDtoBase toInfrastructure() {
    return GenericDimmableLightDeviceDtos(
      deviceDtoClass: (GenericDimmableLightDeviceDtos).toString(),
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
      cbjDeviceVendor: cbjDeviceVendor.getOrCrash(),
      deviceVendor: deviceVendor.getOrCrash(),
      deviceNetworkLastUpdate: deviceNetworkLastUpdate.getOrCrash(),
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
      lightSwitchState: lightSwitchState.getOrCrash(),
      lightBrightness: lightBrightness.getOrCrash(),
    );
  }

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityBase newEntity,
  }) async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> setBrightness(String brightness) async {
    icLogger.w('Please override this method in the non generic implementation');
    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  @override
  bool replaceActionIfExist(String action) {
    if (GenericDimmableLightSwitchState.lightValidActions().contains(action)) {
      lightSwitchState = GenericDimmableLightSwitchState(action);
      return true;
    }
    return false;
  }

  @override
  List<EntityProperties> getListOfPropertiesToChange() {
    return [
      EntityProperties.lightSwitchState,
    ];
  }
}
