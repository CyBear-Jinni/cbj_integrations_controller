import 'dart:collection';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class RequestActionObject {
  RequestActionObject({
    required this.entityIds,
    required this.property,
    required this.actionType,
    HashMap<ActionValues, dynamic>? value,
  }) {
    this.value = value ?? HashMap();
  }

  final HashSet<String> entityIds;
  final EntityProperties property;
  final EntityActions actionType;
  late HashMap<ActionValues, dynamic> value;

  RequestActionObjectDtos toInfrastructure() {
    return RequestActionObjectDtos(
      entitiesId: entityIds.toList(),
      property: property.name,
      actionType: actionType.name,
      value: HashMap<String, dynamic>.from(
        value.map(
          (key, value) => MapEntry(key.name, value),
        ),
      ),
    );
  }
}
