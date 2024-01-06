import 'dart:collection';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class ActionObject {
  ActionObject({
    required this.uniqueIdByVendor,
    required this.property,
    required this.actionType,
    this.value,
  });

  factory ActionObject.fromSingle(ActionObjectSingle singleAction) {
    return ActionObject(
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
  HashMap<ActionValues, dynamic>? value;
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
