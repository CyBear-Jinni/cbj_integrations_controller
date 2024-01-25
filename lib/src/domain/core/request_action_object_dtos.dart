import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class RequestActionObjectDtos {
  RequestActionObjectDtos({
    required this.entitiesId,
    required this.property,
    required this.actionType,
    required this.value,
  });

  factory RequestActionObjectDtos.fromDomain(RequestActionObject routineCbj) {
    return RequestActionObjectDtos(
      entitiesId: routineCbj.entityIds.toList(),
      property: routineCbj.property.name,
      actionType: routineCbj.actionType.name,
      value: HashMap<String, dynamic>.from(
        routineCbj.value.map(
          (key, value) => MapEntry(key.name, value),
        ),
      ),
    );
  }

  factory RequestActionObjectDtos.fromJsonString(String value) =>
      RequestActionObjectDtos.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
      );

  factory RequestActionObjectDtos.fromJson(Map<String, dynamic> json) {
    return RequestActionObjectDtos(
      entitiesId: jsonDecode(json['entitiesId'] as String) as List<String>,
      property: json['property'] as String,
      actionType: json['actionType'] as String,
      value: HashMap<String, dynamic>.from(
        jsonDecode(json['value'] as String) as Map<String, dynamic>,
      ),
    );
  }

  List<String> entitiesId;
  String property;
  String actionType;
  HashMap<String, dynamic> value;

  Map<String, dynamic> toJson() {
    return {
      'uniqueIdByVendor': jsonEncode(entitiesId),
      'property': property,
      'actionType': actionType,
      'value': jsonEncode(value),
    };
  }

  String toJsonString() => jsonEncode(toJson());

  final String deviceDtoClassInstance = (RequestActionObjectDtos).toString();

  RequestActionObject toDomain() {
    return RequestActionObject(
      entityIds: HashSet.from(entitiesId),
      property: EntityPropertiesExtension.fromString(property),
      actionType: EntityActionsExtension.fromString(actionType),
      value: HashMap<ActionValues, dynamic>.from(
        value.map(
          (key, value) =>
              MapEntry(ActionValuesExtension.fromString(key), value),
        ),
      ),
    );
  }
}
