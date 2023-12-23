import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_type_type_not_supported_entity/generic_smart_type_not_supported_device_dtos.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericSmartTypeNotSupported that exist inside a computer, the
/// implementations will be actual GenericSmartTypeNotSupported like smartTypeNotSupported smartTypeNotSupporteds and more
class GenericSmartTypeNotSupportedDE extends DeviceEntityBase {
  /// All public field of GenericSmartTypeNotSupported entity
  GenericSmartTypeNotSupportedDE({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.cbjDeviceVendor,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.entityStateGRPC,
    required super.stateMassage,
    required super.senderDeviceOs,
    required super.senderDeviceModel,
    required super.senderId,
    required super.compUuid,
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
  }) : super(
          entityTypes: EntityType.type(EntityTypes.smartTypeNotSupported),
        );

  /// Empty instance of GenericSmartTypeNotSupportedEntity
  factory GenericSmartTypeNotSupportedDE.empty() =>
      GenericSmartTypeNotSupportedDE(
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
      );

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

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() {
    return [];
  }

  @override
  DeviceEntityDtoBase toInfrastructure() {
    return GenericSmartTypeNotSupportedDeviceDtos(
      deviceDtoClass: (GenericSmartTypeNotSupportedDeviceDtos).toString(),
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
      devicesMacAddress: devicesMacAddress.getOrCrash(),
      entityKey: entityKey.getOrCrash(),
      requestTimeStamp: requestTimeStamp.getOrCrash(),
      lastResponseFromDeviceTimeStamp:
          lastResponseFromDeviceTimeStamp.getOrCrash(),
      deviceCbjUniqueId: deviceCbjUniqueId.getOrCrash(),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOnSmartTypeNotSupported() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOffSmartTypeNotSupported() async =>
      pleaseOverrideMessage();

  @override
  bool replaceActionIfExist(String action) {
    return true;
  }

  @override
  List<EntityProperties> getListOfPropertiesToChange() {
    return [];
  }
}
