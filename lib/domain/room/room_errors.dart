import 'package:cbj_integrations_controller/domain/room/room_failures.dart';

class RoomUnexpectedValueError extends Error {
  RoomUnexpectedValueError(this.roomsValueFailure);

  final RoomFailure roomsValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $roomsValueFailure');
  }
}
