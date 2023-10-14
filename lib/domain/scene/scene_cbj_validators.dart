import 'package:cbj_integrations_controller/domain/scene/scene_cbj_failures.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/device_type_enums.dart';
import 'package:dartz/dartz.dart';

Either<SceneCbjFailure<String>, String> validateSceneNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      SceneCbjFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<SceneCbjFailure<String>, String> validateSceneMaxNameLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      SceneCbjFailure.exceedingLength(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

Either<SceneCbjFailure<String>, String> validateSceneCbjBackgroundColorNotEmpty(
  String input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjAutomationStringLugit(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjNodeRedFlowId(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjFirstNodeId(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjIconCodePoint(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjBackgroundImage(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjLastDateOfExecute(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjStateMassage(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjSenderDeviceOs(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjSenderDeviceModel(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjSenderId(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String?> validateSceneCbjCompUuid(
  String? input,
) {
  return right(input);
}

Either<SceneCbjFailure<String>, String> validateSceneCbjDeviceStateGRPC(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      SceneCbjFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<SceneCbjFailure<String>, String> validateSceneStateExist(
  String input,
) {
  if (EnumHelperCbj.stringToDeviceState(input) != null) {
    return right(input);
  }
  return left(const SceneCbjFailure.sceneStateDoesNotExist());
}
