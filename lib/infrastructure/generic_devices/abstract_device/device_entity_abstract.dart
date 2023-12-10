import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/value_objects_core.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

/// We are using the term entity to describe individual integrations on a single device
/// So for example switch with three buttons will have three entities
abstract class DeviceEntityAbstract {
  DeviceEntityAbstract({
    required this.uniqueId,
    required this.entityUniqueId,
    required this.deviceVendor,
    required this.entityTypes,
    required this.cbjEntityName,
    required this.stateMassage,
    required this.senderDeviceOs,
    required this.senderDeviceModel,
    required this.senderId,
    required this.compUuid,
    required this.entityStateGRPC,
    required this.entityOriginalName,
    required this.deviceOriginalName,
    required this.powerConsumption,
    required this.deviceUniqueId,
    required this.devicePort,
    required this.deviceLastKnownIp,
    required this.deviceHostName,
    required this.deviceMdns,
    required this.devicesMacAddress,
    required this.entityKey,
    required this.requestTimeStamp,
    required this.lastResponseFromDeviceTimeStamp,
    required this.deviceCbjUniqueId,
    required this.srvResourceRecord,
    required this.ptrResourceRecord,
  });

  /// The unique id that CyBear Jinni Hub gave the device
  CoreUniqueId uniqueId;

  /// The unique id that each company gave their device
  EntityUniqueId entityUniqueId;

  /// The name to show in cbj app, can be changed by the use
  CbjEntityName cbjEntityName;

  /// The name of the entity from the vendor api, user should only view it
  EntityOriginalName entityOriginalName;

  /// The name of the device that the entity exist on from the api, user should only view it
  DeviceOriginalName deviceOriginalName;

  /// Did the massage arrived or was it just sent.
  /// Will be 'set' (need change) or 'ack' for acknowledge
  EntityState entityStateGRPC;

  /// If state didn't change the error description will be found here.
  DeviceStateMassage stateMassage;

  /// Sender GenericLight os type, example: android, iphone, browser
  DeviceSenderDeviceOs senderDeviceOs;

  /// The sender GenericLight model; example: onePlus 3T
  DeviceSenderDeviceModel senderDeviceModel;

  /// Last GenericLight sender id that activated the action
  DeviceSenderId senderId;

  /// The smart entity type
  EntityType entityTypes;

  /// The smart GenericLight type
  DeviceVendor deviceVendor;

  /// Unique id of the computer
  DeviceCompUuid compUuid;

  /// Power consumption of the device
  DevicePowerConsumption powerConsumption;

  /// Unique id of the device that the entity exists on
  DeviceUniqueId deviceUniqueId;

  /// Port of the device
  DevicePort devicePort;

  /// Last known ip
  DeviceLastKnownIp deviceLastKnownIp;

  /// Device Host name
  DeviceHostName deviceHostName;

  /// Device Mdns
  DeviceMdns deviceMdns;

  DeviceSrvResourceRecord srvResourceRecord;

  DevicePtrResourceRecord ptrResourceRecord;

  /// Mac address of the device
  DevicesMacAddress devicesMacAddress;

  /// Some entities will use key to transmit the states via the api
  EntityKey entityKey;

  /// Time that the action got sent from the app
  RequestTimeStamp requestTimeStamp;

  /// Time of the last response from the device
  LastResponseFromDeviceTimeStamp lastResponseFromDeviceTimeStamp;

  /// Unique id that cbj creates for the device that the entity is stored on
  CoreUniqueId deviceCbjUniqueId;

  String getDeviceId();

  /// Copy with device state to waiting or ack
  DeviceEntityAbstract copyWithDeviceState(EntityStateGRPC entityStateGRPC) {
    return this;
  }

  /// Copy with device action
  DeviceEntityAbstract copyWithDeviceAction(EntityActions deviceActions) {
    return this;
  }

  /// Copy with stateMassage
  DeviceEntityAbstract copyWithStateMassage(String stateMassage) {
    return this;
  }

  /// Copy with senderDeviceOs
  DeviceEntityAbstract copyWithSenderDeviceOs(String senderDeviceOs) {
    return this;
  }

  /// Copy with deviceSenderDeviceModel
  DeviceEntityAbstract copyWithDeviceSenderDeviceModel(
    String deviceSenderDeviceModel,
  ) {
    return this;
  }

  /// Copy with currentUserId
  DeviceEntityAbstract copyWithSenderId(String userId) {
    return this;
  }

  /// Convert the device to the a dtos object in the infrastructure layer
  DeviceEntityDtoAbstract toInfrastructure() {
    return DeviceEntityDtoAbstract();
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  });

  /// Return a list of all valid actions for this device
  List<String> getAllValidActions();

  /// Will replace action field with new action if it exists inside the object
  bool replaceActionIfExist(String action);

  /// List of all the properties that their value can be change when creating a
  /// scene for that device
  List<String> getListOfPropertiesToChange();
}

class DeviceEntityNotAbstract extends DeviceEntityAbstract {
  DeviceEntityNotAbstract()
      : super(
          uniqueId: CoreUniqueId(),
          entityUniqueId: EntityUniqueId('Entity unique id is empty'),
          deviceVendor: DeviceVendor(
            VendorsAndServices.vendorsAndServicesNotSupported.toString(),
          ),
          entityStateGRPC:
              EntityState(EntityTypes.smartTypeNotSupported.toString()),
          compUuid: DeviceCompUuid(const Uuid().v1()),
          cbjEntityName: CbjEntityName('Cbj entity Name is empty'),
          entityOriginalName:
              EntityOriginalName('Entity original name is empty'),
          deviceOriginalName: DeviceOriginalName(
            'Device original name that entity is exists on is empty',
          ),
          entityTypes: EntityType(EntityTypes.light.toString()),
          senderDeviceModel: DeviceSenderDeviceModel('a'),
          senderDeviceOs: DeviceSenderDeviceOs('b'),
          senderId: DeviceSenderId(),
          stateMassage: DeviceStateMassage('go'),
          powerConsumption: DevicePowerConsumption('0'),
          deviceUniqueId: DeviceUniqueId('Device unique id is empty'),
          devicePort: DevicePort('1'),
          deviceLastKnownIp: DeviceLastKnownIp('1.1.1.1'),
          deviceHostName: DeviceHostName('deviceHostName is empty'),
          deviceMdns: DeviceMdns('deviceMdns is empty'),
          srvResourceRecord: DeviceSrvResourceRecord(),
          ptrResourceRecord: DevicePtrResourceRecord(),
          devicesMacAddress: DevicesMacAddress('devicesMacAddress is empty'),
          entityKey: EntityKey('entityKey is empty'),
          requestTimeStamp: RequestTimeStamp('requestTimeStamp is empty'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(
            'lastResponseFromDeviceTimeStamp is empty',
          ),
          deviceCbjUniqueId: CoreUniqueId(),
        );

  @override
  DeviceEntityDtoAbstract toInfrastructure() {
    return DeviceEntityDtoAbstract();
  }

  @override
  String getDeviceId() {
    throw UnimplementedError();
  }

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() {
    return [];
  }

  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction({
    required DeviceEntityAbstract newEntity,
  }) {
    // TODO: implement executeDeviceAction
    throw UnimplementedError();
  }

  @override
  bool replaceActionIfExist(String action) {
    return false;
  }

  @override
  List<String> getListOfPropertiesToChange() {
    return [];
  }
}

// class GenericGenericUnsupportedDE extends DeviceEntityAbstract {
//   GenericGenericUnsupportedDE({
//     required super.uniqueId,
//     required super.entityUniqueId,
//     required super.deviceVendor,
//     required super.entityTypes,
//     required super.cbjEntityName,
//     required super.stateMassage,
//     required super.senderDeviceOs,
//     required super.senderDeviceModel,
//     required super.senderId,
//     required super.compUuid,
//     required super.entityStateGRPC,
//     required super.entityOriginalName,
//     required super.deviceOriginalName,
//     required super.powerConsumption,
//     required super.deviceUniqueId,
//     required super.devicePort,
//     required super.deviceLastKnownIp,
//     required super.deviceHostName,
//     required super.deviceMdns,
//     required super.srvResourceRecord,
//     required super.ptrResourceRecord,
//     required super.devicesMacAddress,
//     required super.entityKey,
//     required super.requestTimeStamp,
//     required super.lastResponseFromDeviceTimeStamp,
//     required super.deviceCbjUniqueId,
//   });

//   @override
//   Future<Either<CoreFailure, Unit>> executeDeviceAction({
//     required DeviceEntityAbstract newEntity,
//   }) async {
//     return right(unit);
//   }

//   @override
//   List<String> getAllValidActions() => [];

//   @override
//   String getDeviceId() => uniqueId.getOrCrash();

//   @override
//   List<String> getListOfPropertiesToChange() => [];

//   @override
//   bool replaceActionIfExist(String action) => false;
// }
