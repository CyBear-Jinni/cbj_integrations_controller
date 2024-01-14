import 'dart:collection';
import 'dart:convert';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class RequestActionObjectDtos {
  RequestActionObjectDtos({
    required this.uniqueIdByVendor,
    required this.property,
    required this.actionType,
    required this.value,
  });

  factory RequestActionObjectDtos.fromDomain(RequestActionObject routineCbj) {
    return RequestActionObjectDtos(
      uniqueIdByVendor: HashMap<String, List<String>>.from(
        routineCbj.uniqueIdByVendor.map(
          (key, value) => MapEntry(key.name, value),
        ),
      ),
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
    final HashMap<String, List<String>> uniqueIdByVendor = HashMap.from(
      Map<String, List<dynamic>>.from(
        jsonDecode(json['uniqueIdByVendor'] as String) as Map<String, dynamic>,
      ).map((key, value) => MapEntry(key, List<String>.from(value))),
    );

    return RequestActionObjectDtos(
      uniqueIdByVendor: uniqueIdByVendor,
      property: json['property'] as String,
      actionType: json['actionType'] as String,
      value: HashMap<String, dynamic>.from(
        jsonDecode(json['value'] as String) as Map<String, dynamic>,
      ),
    );
  }

  HashMap<String, List<String>> uniqueIdByVendor;
  String property;
  String actionType;
  HashMap<String, dynamic> value;

  Map<String, dynamic> toJson() {
    return {
      'uniqueIdByVendor': jsonEncode(uniqueIdByVendor),
      'property': property,
      'actionType': actionType,
      'value': jsonEncode(value),
    };
  }

  String toJsonString() => jsonEncode(toJson());

  final String deviceDtoClassInstance = (RequestActionObjectDtos).toString();

  RequestActionObject toDomain() {
    return RequestActionObject(
      uniqueIdByVendor: HashMap<VendorsAndServices, HashSet<String>>.from(
        uniqueIdByVendor.map(
          (key, value) => MapEntry(
            VendorsAndServicesExtension.fromString(key),
            HashSet<String>.from(value),
          ),
        ),
      ),
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
