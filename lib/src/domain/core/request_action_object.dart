import 'dart:collection';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_object_dtos.dart';

class RequestActionObject {
  RequestActionObject({
    required this.uniqueIdByVendor,
    required this.property,
    required this.actionType,
    HashMap<ActionValues, dynamic>? value,
  }) {
    this.value = value ?? HashMap();
  }

  factory RequestActionObject.fromSingle(ActionObjectSingle singleAction) {
    return RequestActionObject(
      uniqueIdByVendor: HashMap.fromEntries([
        MapEntry(singleAction.vendor, HashSet.from([singleAction.entityId])),
      ]),
      property: singleAction.property,
      actionType: singleAction.actionType,
    );
  }

  final HashMap<VendorsAndServices, HashSet<String>> uniqueIdByVendor;
  final EntityProperties property;
  final EntityActions actionType;
  late HashMap<ActionValues, dynamic> value;

  RequestActionObjectDtos toInfrastructure() {
    return RequestActionObjectDtos(
      uniqueIdByVendor: HashMap<String, List<String>>.from(
        uniqueIdByVendor.map(
          (key, value) => MapEntry(key.name, value.toList()),
        ),
      ),
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

class ActionObjectSingle {
  ActionObjectSingle({
    required this.vendor,
    required this.entityId,
    required this.property,
    required this.actionType,
    this.value,
  });

  final VendorsAndServices vendor;
  final String entityId;
  final EntityProperties property;
  final EntityActions actionType;
  HashMap<ActionValues, dynamic>? value;
}
