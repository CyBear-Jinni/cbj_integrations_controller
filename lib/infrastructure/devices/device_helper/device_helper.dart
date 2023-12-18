import 'dart:convert';

import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_dto_base.dart';

class DeviceHelper {
  /// Dto to json
  static Map<String, dynamic> convertDtoToJson(
    DeviceEntityDtoBase deviceEntityDto,
  ) {
    return deviceEntityDto.toJson();
  }

  /// json to Dto
  static DeviceEntityDtoBase convertJsonToDto(Map<String, dynamic> json) {
    return DeviceEntityDtoBase.fromJson(json);
  }

  /// json to json string
  static String convertJsonToJsonString(Map<String, dynamic> json) {
    return jsonEncode(json);
  }

  /// string json to json
  static Map<String, dynamic> convertJsonStringToJson(String jsonString) {
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  /// Device entity to dto
  static DeviceEntityDtoBase convertDomainToDto(
    DeviceEntityBase deviceEntity,
  ) {
    return deviceEntity.toInfrastructure();
  }

  /// Dto to device entity
  static DeviceEntityBase convertDtoToDomain(
    DeviceEntityDtoBase deviceEntityDto,
  ) {
    return deviceEntityDto.toDomain();
  }

  // Extras methods

  static DeviceEntityDtoBase convertJsonStringToDto(String jsonString) {
    return convertJsonToDto(convertJsonStringToJson(jsonString));
  }

  static String convertDtoToJsonString(
    DeviceEntityDtoBase deviceEntityDto,
  ) {
    return convertJsonToJsonString(convertDtoToJson(deviceEntityDto));
  }

  static DeviceEntityBase convertJsonStringToDomain(String jsonString) {
    return convertDtoToDomain(convertJsonStringToDto(jsonString));
  }

  static String convertDomainToJsonString(DeviceEntityBase deviceEntity) {
    return convertJsonToJsonString(
      convertDtoToJson(convertDomainToDto(deviceEntity)),
    );
  }
}
