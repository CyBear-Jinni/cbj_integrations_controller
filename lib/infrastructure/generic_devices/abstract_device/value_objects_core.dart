import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_errors.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/core_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectCore<T> {
  const ValueObjectCore();

  Either<CoreFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [AuthValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw CoreUnexpectedValueError(f), id);
  }

  Either<CoreFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectCore<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class CoreUniqueId extends ValueObjectCore<String> {
  factory CoreUniqueId() {
    return CoreUniqueId._(right(const Uuid().v1()));
  }

  factory CoreUniqueId.fromUniqueString(String uniqueId) {
    return CoreUniqueId._(right(uniqueId));
  }

  const CoreUniqueId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

/// Object that will store the unique id of the device that each vendor send
class EntityUniqueId extends ValueObjectCore<String> {
  factory EntityUniqueId(String? input) {
    assert(input != null);
    return EntityUniqueId._(
      validateNotEmpty(input!),
    );
  }

  const EntityUniqueId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class CbjEntityName extends ValueObjectCore<String?> {
  factory CbjEntityName(String? input) {
    return CbjEntityName._(
      input == null
          ? right(input)
          : validateNotEmpty(input)
              .flatMap((a) => validateMaxNameLength(input, maxLength)),
    );
  }

  const CbjEntityName._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;

  static const maxLength = 1000;
}

class EntityOriginalName extends ValueObjectCore<String> {
  factory EntityOriginalName(String input) {
    return EntityOriginalName._(validateMaxNameLength(input, maxLength));
  }

  const EntityOriginalName._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static const maxLength = 1000;
}

class DeviceOriginalName extends ValueObjectCore<String?> {
  factory DeviceOriginalName(String? input) {
    return DeviceOriginalName._(
      input == null
          ? right(input)
          : validateNotEmpty(input)
              .flatMap((a) => validateMaxNameLength(input, maxLength)),
    );
  }

  const DeviceOriginalName._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;

  static const maxLength = 1000;
}

class DeviceSrvResourceRecord extends ValueObjectCore<String?> {
  factory DeviceSrvResourceRecord({String? input}) {
    return DeviceSrvResourceRecord._(right(input));
  }

  const DeviceSrvResourceRecord._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DevicePtrResourceRecord extends ValueObjectCore<String?> {
  factory DevicePtrResourceRecord({String? input}) {
    return DevicePtrResourceRecord._(right(input));
  }

  const DevicePtrResourceRecord._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class EntityState extends ValueObjectCore<String> {
  factory EntityState(String? input) {
    return EntityState._(
      validateNotEmpty(input!).flatMap((a) => validateDeviceStateExist(input)),
    );
  }

  const EntityState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceSenderDeviceOs extends ValueObjectCore<String> {
  factory DeviceSenderDeviceOs(String? input) {
    assert(input != null);
    return DeviceSenderDeviceOs._(
      validateNotEmpty(input!),
    );
  }

  const DeviceSenderDeviceOs._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceStateMassage extends ValueObjectCore<String> {
  factory DeviceStateMassage(String? input) {
    assert(input != null);
    return DeviceStateMassage._(
      validateNotEmpty(input!),
    );
  }

  const DeviceStateMassage._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceSenderDeviceModel extends ValueObjectCore<String> {
  factory DeviceSenderDeviceModel(String? input) {
    assert(input != null);
    return DeviceSenderDeviceModel._(
      validateNotEmpty(input!),
    );
  }

  const DeviceSenderDeviceModel._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceSenderId extends ValueObjectCore<String> {
  factory DeviceSenderId() {
    return DeviceSenderId._(right(const Uuid().v1()));
  }

  factory DeviceSenderId.fromUniqueString(String? uniqueId) {
    assert(uniqueId != null);
    return DeviceSenderId._(right(uniqueId!));
  }

  const DeviceSenderId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceAction extends ValueObjectCore<String> {
  factory DeviceAction(String? input) {
    assert(input != null);

    if (input == 'false') {
      input = EntityActions.off.toString();
    } else if (input == 'true') {
      input = EntityActions.on.toString();
    }
    return DeviceAction._(
      validateNotEmpty(input!)
          .flatMap((a) => validateDeviceActionExist(input!)),
    );
  }

  const DeviceAction._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class EntityType extends ValueObjectCore<String> {
  factory EntityType(String? input) {
    assert(input != null);
    return EntityType._(
      validateNotEmpty(input!).flatMap((a) => validateDeviceTypeExist(input)),
    );
  }

  const EntityType._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class CbjDeviceVendor extends ValueObjectCore<String> {
  factory CbjDeviceVendor(String? input) {
    assert(input != null);
    return CbjDeviceVendor._(
      validateNotEmpty(input!).flatMap((a) => validateDeviceVendorExist(input)),
    );
  }

  const CbjDeviceVendor._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceVendor extends ValueObjectCore<String?> {
  factory DeviceVendor(String? input) {
    return DeviceVendor._(right(input));
  }

  const DeviceVendor._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DeviceNetworkLastUpdate extends ValueObjectCore<String?> {
  factory DeviceNetworkLastUpdate(String? input) {
    return DeviceNetworkLastUpdate._(right(input));
  }

  const DeviceNetworkLastUpdate._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DeviceCompUuid extends ValueObjectCore<String> {
  factory DeviceCompUuid(String? input) {
    assert(input != null);
    return DeviceCompUuid._(
      validateNotEmpty(input!),
    );
  }

  const DeviceCompUuid._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceLastKnownIp extends ValueObjectCore<String?> {
  factory DeviceLastKnownIp(String? input) {
    return DeviceLastKnownIp._(right(input));
  }

  const DeviceLastKnownIp._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DevicePowerConsumption extends ValueObjectCore<String> {
  factory DevicePowerConsumption(String? input) {
    assert(input != null);
    return DevicePowerConsumption._(
      validatePowerConsumptionNotEmpty(input!),
    );
  }

  const DevicePowerConsumption._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceMdns extends ValueObjectCore<String?> {
  factory DeviceMdns(String? input) {
    return DeviceMdns._(right(input));
  }

  const DeviceMdns._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class DevicePort extends ValueObjectCore<String> {
  factory DevicePort(String? input) {
    assert(input != null);
    return DevicePort._(
      validatePortNotEmpty(input!),
    );
  }

  const DevicePort._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class EntityKey extends ValueObjectCore<String> {
  factory EntityKey(String? input) {
    assert(input != null);
    return EntityKey._(
      validateKeyNotEmpty(input!),
    );
  }

  const EntityKey._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceUniqueId extends ValueObjectCore<String> {
  factory DeviceUniqueId(String? input) {
    assert(input != null);
    return DeviceUniqueId._(
      validateNotEmpty(input!),
    );
  }

  const DeviceUniqueId._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DeviceHostName extends ValueObjectCore<String?> {
  factory DeviceHostName(String? input) {
    return DeviceHostName._(
      input == null ? right(input) : validateNotEmpty(input),
    );
  }

  const DeviceHostName._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}

class RequestTimeStamp extends ValueObjectCore<String> {
  factory RequestTimeStamp(String? input) {
    assert(input != null);
    return RequestTimeStamp._(
      validateNotEmpty(input!),
    );
  }

  const RequestTimeStamp._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class LastResponseFromDeviceTimeStamp extends ValueObjectCore<String> {
  factory LastResponseFromDeviceTimeStamp(String? input) {
    assert(input != null);
    return LastResponseFromDeviceTimeStamp._(
      validateNotEmpty(input!),
    );
  }

  const LastResponseFromDeviceTimeStamp._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class DevicesMacAddress extends ValueObjectCore<String?> {
  factory DevicesMacAddress(String? input) {
    return DevicesMacAddress._(right(input));
  }

  const DevicesMacAddress._(this.value);

  @override
  final Either<CoreFailure<String?>, String?> value;
}
