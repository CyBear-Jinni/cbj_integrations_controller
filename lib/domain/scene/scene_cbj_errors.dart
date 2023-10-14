import 'package:cbj_integrations_controller/domain/scene/scene_cbj_failures.dart';

class SceneCbjUnexpectedValueError extends Error {
  SceneCbjUnexpectedValueError(this.scenesValueFailure);

  final SceneCbjFailure scenesValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $scenesValueFailure');
  }
}
