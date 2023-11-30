import 'package:cbj_integrations_controller/domain/hub/hub_failures.dart';

class HubUnexpectedValueError extends Error {
  HubUnexpectedValueError(this.homeUserValueFailure);

  final HubFailures homeUserValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString(
      '$explanation Failure was: $homeUserValueFailure',
    );
  }
}
