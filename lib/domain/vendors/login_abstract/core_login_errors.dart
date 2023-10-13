import 'package:cbj_integrations_controller/domain/vendors/vendor_failures.dart';

class CoreLoginUnexpectedValueError extends Error {
  CoreLoginUnexpectedValueError(this.loginValueFailure);

  final VendorValueFailure loginValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $loginValueFailure');
  }
}
