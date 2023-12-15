import 'package:cbj_integrations_controller/domain/routine/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/node_red/node_red_nodes/node_red_visual_node_abstract.dart';

class NodeRedInjectAtASpecificTimeNode extends NodeRedVisualNodeAbstract {
  NodeRedInjectAtASpecificTimeNode({
    required this.daysToRepeat,
    required this.hourToRepeat,
    required this.minutesToRepeat,
    super.id,
    super.name,
    super.wires,
  }) : super(
          type: 'inject',
        );

  RoutineCbjRepeatDateDays daysToRepeat;
  RoutineCbjRepeatDateHour hourToRepeat;
  RoutineCbjRepeatDateMinute minutesToRepeat;

  @override
  String toString() {
    final String crontab =
        '${minutesToRepeat.getOrCrash()} ${hourToRepeat.getOrCrash()} * * ${daysToRepeatAsCornTabRequire()}';
    return '''
    {
    "id": "$id",
    "type": "$type",
    "name": "$name",
    "props": [
        {
            "p": "payload"
        },
        {
            "p": "topic",
            "vt": "str"
        }
    ],
    "repeat": "",
    "crontab": "$crontab",
    "once": false,
    "onceDelay": 0.1,
    "topic": "",
    "payload": "",
    "payloadType": "date",
    "wires":  ${fixWiresForNodeRed()}
  }''';
  }

  String daysToRepeatAsCornTabRequire() {
    if (daysToRepeat.getOrCrash()!.length >= 7) {
      return '*';
    }
    String daysToRepeatTemp = '';

    for (final String dayToRepeat in daysToRepeat.getOrCrash()!) {
      if (daysToRepeatTemp != '') {
        daysToRepeatTemp += ',';
      }

      if (dayToRepeat == 'sunday') {
        daysToRepeatTemp += '0';
      } else if (dayToRepeat == 'monday') {
        daysToRepeatTemp += '1';
      } else if (dayToRepeat == 'tuesday') {
        daysToRepeatTemp += '2';
      } else if (dayToRepeat == 'wednesday') {
        daysToRepeatTemp += '3';
      } else if (dayToRepeat == 'thursday') {
        daysToRepeatTemp += '4';
      } else if (dayToRepeat == 'friday') {
        daysToRepeatTemp += '5';
      } else if (dayToRepeat == 'saturday') {
        daysToRepeatTemp += '6';
      } else {
        daysToRepeatTemp += 'Error';
        icLogger.e('Day does not exist');
      }
    }
    return daysToRepeatTemp;
  }
}
