import 'package:cbj_integrations_controller/domain/room/room_errors.dart';
import 'package:cbj_integrations_controller/domain/room/room_failures.dart';
import 'package:cbj_integrations_controller/domain/room/room_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectRooms<T> {
  const ValueObjectRooms();

  Either<RoomFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [AuthValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw RoomUnexpectedValueError(f), id);
  }

  Either<RoomFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectRooms<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class RoomUniqueId extends ValueObjectRooms<String> {
  factory RoomUniqueId() {
    return RoomUniqueId._(right(const Uuid().v1()));
  }

  factory RoomUniqueId.fromUniqueString(String uniqueId) {
    return RoomUniqueId._(right(uniqueId));
  }

  factory RoomUniqueId.discovered() {
    return RoomUniqueId._(right(discovereId));
  }
  const RoomUniqueId._(this.value);

  static const String discovereId = '00000000-0000-0000-0000-000000000000';

  @override
  final Either<RoomFailure<String>, String> value;
}

class RoomDefaultName extends ValueObjectRooms<String> {
  factory RoomDefaultName(String input) {
    return RoomDefaultName._(
      validateRoomNotEmpty(input)
          .flatMap((a) => validateRoomMaxNameLength(input, maxLength)),
    );
  }

  factory RoomDefaultName.discoveredRoomName() {
    return RoomDefaultName._(right('Discovered'));
  }

  const RoomDefaultName._(this.value);

  @override
  final Either<RoomFailure<String>, String> value;

  static const maxLength = 1000;
}

/// Can be an image or a color hex value
class RoomBackground extends ValueObjectRooms<String> {
  factory RoomBackground(String input) {
    return RoomBackground._(
      validateRoomBackgroundNotEmpty(input),
    );
  }

  const RoomBackground._(this.value);

  @override
  final Either<RoomFailure<String>, String> value;
}

class RoomTypes extends ValueObjectRooms<Set<String>> {
  factory RoomTypes(Set<String> input) {
    return RoomTypes._(validateRoomTypesExist(input));
  }

  const RoomTypes._(this.value);

  @override
  final Either<RoomFailure<Set<String>>, Set<String>> value;
}

class RoomDevicesId extends ValueObjectRooms<Set<String>> {
  factory RoomDevicesId(Set<String> input) {
    return RoomDevicesId._(validateRoomTypsValid(input));
  }

  const RoomDevicesId._(this.value);

  @override
  final Either<RoomFailure<Set<String>>, Set<String>> value;
}

class RoomScenesId extends ValueObjectRooms<Set<String>> {
  factory RoomScenesId(Set<String> input) {
    return RoomScenesId._(validateRoomTypsValid(input));
  }

  const RoomScenesId._(this.value);

  @override
  final Either<RoomFailure<Set<String>>, Set<String>> value;
}

class RoomRoutinesId extends ValueObjectRooms<Set<String>> {
  factory RoomRoutinesId(Set<String> input) {
    return RoomRoutinesId._(validateRoomTypsValid(input));
  }

  const RoomRoutinesId._(this.value);

  @override
  final Either<RoomFailure<Set<String>>, Set<String>> value;
}

class RoomBindingsId extends ValueObjectRooms<Set<String>> {
  factory RoomBindingsId(Set<String> input) {
    return RoomBindingsId._(validateRoomTypsValid(input));
  }

  const RoomBindingsId._(this.value);

  @override
  final Either<RoomFailure<Set<String>>, Set<String>> value;
}

class RoomMostUsedBy extends ValueObjectRooms<Set<String>> {
  factory RoomMostUsedBy(Set<String> input) {
    return RoomMostUsedBy._(validateUserIdsValid(input));
  }

  const RoomMostUsedBy._(this.value);

  @override
  final Either<RoomFailure<Set<String>>, Set<String>> value;
}

class RoomPermissions extends ValueObjectRooms<Set<String>> {
  factory RoomPermissions(Set<String> input) {
    return RoomPermissions._(validateUserIdsValid(input));
  }

  const RoomPermissions._(this.value);

  @override
  final Either<RoomFailure<Set<String>>, Set<String>> value;
}
