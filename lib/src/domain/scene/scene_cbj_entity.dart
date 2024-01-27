import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/core/value_objects.dart';
import 'package:cbj_integrations_controller/src/domain/scene/value_objects_scene_cbj.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/scene_cbj_dtos.dart';

class SceneCbjEntity {
  const SceneCbjEntity({
    /// The unique id of the scene, will alsow be used as the flow/tab id.
    required this.uniqueId,

    /// Name of the automation, will be shown to the user.
    required this.name,
    required this.backgroundColor,

    /// All the automation as string.
    required this.automationString,

    /// Node-Red flow id of the scene
    required this.nodeRedFlowId,

    /// The actual id of the first node, most of the time will be the same as
    /// uniqueId variable.
    required this.firstNodeId,

    /// The Unicode code point at which this icon is stored in the icon font.
    required this.iconCodePoint,
    required this.image,
    required this.lastDateOfExecute,
    required this.stateMassage,
    required this.senderDeviceOs,
    required this.senderDeviceModel,
    required this.senderId,
    required this.compUuid,
    required this.entityStateGRPC,
    required this.actions,
    required this.areaPurposeType,
  });

  final UniqueId uniqueId;
  final SceneCbjName name;
  final SceneCbjBackgroundColor backgroundColor;
  final SceneCbjAutomationString automationString;
  final SceneCbjNodeRedFlowId nodeRedFlowId;
  final SceneCbjFirstNodeId firstNodeId;
  final SceneCbjIconCodePoint iconCodePoint;
  final SceneCbjBackgroundImage image;
  final SceneCbjLastDateOfExecute lastDateOfExecute;
  final SceneCbjStateMassage stateMassage;
  final SceneCbjSenderDeviceOs senderDeviceOs;
  final SceneCbjSenderDeviceModel senderDeviceModel;
  final SceneCbjSenderId senderId;
  final SceneCbjCompUuid compUuid;
  final SceneCbjDeviceStateGRPC entityStateGRPC;

  /// {entityId, ActionObject}
  final List<RequestActionObject> actions;
  final AreaPurposesTypes areaPurposeType;

  SceneCbjEntity copyWithNewAction(List<RequestActionObject> actions) =>
      SceneCbjEntity(
        uniqueId: uniqueId,
        name: name,
        backgroundColor: backgroundColor,
        automationString: automationString,
        nodeRedFlowId: nodeRedFlowId,
        firstNodeId: firstNodeId,
        iconCodePoint: iconCodePoint,
        image: image,
        lastDateOfExecute: lastDateOfExecute,
        stateMassage: stateMassage,
        senderDeviceOs: senderDeviceOs,
        senderDeviceModel: senderDeviceModel,
        senderId: senderId,
        compUuid: compUuid,
        entityStateGRPC: entityStateGRPC,
        actions: actions,
        areaPurposeType: areaPurposeType,
      );

  SceneCbjDtos toInfrastructure() => SceneCbjDtos(
        uniqueId: uniqueId.getOrCrash(),
        name: name.getOrCrash(),
        backgroundColor: backgroundColor.getOrCrash(),
        automationString: automationString.getOrCrash(),
        nodeRedFlowId: nodeRedFlowId.getOrCrash(),
        firstNodeId: firstNodeId.getOrCrash(),
        iconCodePoint: iconCodePoint.getOrCrash(),
        image: image.getOrCrash(),
        lastDateOfExecute: lastDateOfExecute.getOrCrash(),
        entityStateGRPC: entityStateGRPC.getOrCrash(),
        senderDeviceModel: senderDeviceModel.getOrCrash(),
        senderDeviceOs: senderDeviceOs.getOrCrash(),
        senderId: senderId.getOrCrash(),
        compUuid: compUuid.getOrCrash(),
        stateMassage: stateMassage.getOrCrash(),
        areaPurposeType: areaPurposeType.name,
      );
}
