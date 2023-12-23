import 'dart:collection';

import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_blinds_entity/generic_blinds_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_blinds_entity/generic_blinds_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_boiler_entity/generic_boiler_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_boiler_entity/generic_boiler_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';

class DemoConnectionController {
  static HashMap<String, DeviceEntityBase> getAllEntities() {
    final HashMap<String, DeviceEntityBase> devicesList = HashMap();

    /// Guy Blinds

    final GenericBlindsDE allRemoteCommandsBlinds = GenericBlindsDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('96386cd0-419b-11ed-8246-e17a279f4d89'),
      entityUniqueId: EntityUniqueId('63b298'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(
        VendorsAndServices.switcherSmartHome,
      ),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Guy Blinds'),
      entityOriginalName: EntityOriginalName('Guy Blinds'),
      deviceOriginalName: DeviceOriginalName('Guy Blinds'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('switcher'),
      senderDeviceModel:
          DeviceSenderDeviceModel('SwitcherDevicesTypes.switcherRunner'),
      senderId: DeviceSenderId.fromUniqueString(
        '94edb282-434a-11ed-bd96-f573a00b65aa',
      ),
      compUuid: DeviceCompUuid('34asdfrsd23gggg'),
      blindsSwitchState:
          GenericBlindsSwitchState(EntityActions.stop.toString()),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('n5sdf1sf-df53-v2sd-ge46-hhjlywawq166'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsBlinds.getCbjDeviceId,
          allRemoteCommandsBlinds,
        ),
      ],
    );

    /// Guy Ceiling Button

    final GenericSwitchDE allRemoteCommandsButton = GenericSwitchDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('c90137f2-419b-11ed-8246-e17a279f4d89'),
      entityUniqueId: EntityUniqueId('67600068c44f33f5b515'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.tuyaSmart),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Guy Ceiling Button'),
      entityOriginalName: EntityOriginalName('Guy Ceiling Button'),
      deviceOriginalName: DeviceOriginalName('Guy Ceiling Button'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('switcher'),
      senderDeviceModel: DeviceSenderDeviceModel('Cloud'),
      senderId: DeviceSenderId.fromUniqueString(
        '90d20fc3-434a-11ed-bd96-f573a00b65aa',
      ),
      compUuid: DeviceCompUuid('34asdfrsd23gggg'),
      switchState: GenericSwitchSwitchState(EntityActions.on.toString()),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('b0gaseh2-u7f4-1g42-vdf2-dfnertaku3fs'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsButton.getCbjDeviceId,
          allRemoteCommandsButton,
        ),
      ],
    );

    /// Guy Button 2

    final GenericSwitchDE allRemoteCommandsButton2 = GenericSwitchDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('a31523m6-463s-32ge-7426-g33c642r7m25'),
      entityUniqueId: EntityUniqueId('67600068c44f33f5b515'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.tuyaSmart),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Guy Bedroom Button'),
      entityOriginalName: EntityOriginalName('Guy Bedroom Button'),
      deviceOriginalName: DeviceOriginalName('Guy Bedroom Button'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('switcher'),
      senderDeviceModel: DeviceSenderDeviceModel('Cloud'),
      senderId: DeviceSenderId.fromUniqueString(
        '90d20fc3-434a-11ed-bd96-f573a00b65aa',
      ),
      compUuid: DeviceCompUuid('34asdfrsd23gggg'),
      switchState: GenericSwitchSwitchState(EntityActions.on.toString()),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('654wdf2u-rge2-ffh2-gn22-rthweru521rs'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsButton2.getCbjDeviceId,
          allRemoteCommandsButton2,
        ),
      ],
    );

    /// Boiler

    final GenericBoilerDE allRemoteCommandsBoiler = GenericBoilerDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('65d84b10-434d-11ed-817a-7d350fb52f91'),
      entityUniqueId: EntityUniqueId('65fd2f'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(
        VendorsAndServices.switcherSmartHome,
      ),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Boiler'),
      entityOriginalName: EntityOriginalName('Boiler'),
      deviceOriginalName: DeviceOriginalName('Boiler'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('switcher'),
      senderDeviceModel:
          DeviceSenderDeviceModel('SwitcherDevicesTypes.switcherV2Esp'),
      senderId: DeviceSenderId.fromUniqueString(
        '65d84b11-434d-11ed-817a-7d350fb52f91',
      ),
      compUuid: DeviceCompUuid('34asdfrsd23gggg'),
      boilerSwitchState: GenericBoilerSwitchState(EntityActions.off.toString()),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('id2erfdd-g34a-uhj5-fdfa-sdf5y3wsdfhs'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsBoiler.getCbjDeviceId,
          allRemoteCommandsBoiler,
        ),
      ],
    );

    /// RGBLight

    final GenericRgbwLightDE allRemoteCommandsRgbLight = GenericRgbwLightDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('7189ed76-4351-11ed-b249-63fd7e165c16'),
      entityUniqueId: EntityUniqueId('bf4bccdaf68347e31dhiut'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.tuyaSmart),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Dining Room Ceiling'),
      entityOriginalName: EntityOriginalName('Dining Room Ceiling'),
      deviceOriginalName: DeviceOriginalName('Dining Room Ceiling'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('tuya_smart'),
      senderDeviceModel: DeviceSenderDeviceModel('1SE'),
      senderId: DeviceSenderId.fromUniqueString(
        '7189ed77-4351-11ed-b249-63fd7e165c16',
      ),
      compUuid: DeviceCompUuid('34asdfrsd23gggg'),
      lightSwitchState:
          GenericRgbwLightSwitchState(EntityActions.off.toString()),
      lightBrightness: GenericRgbwLightBrightness('100'),
      lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
      lightColorHue: GenericRgbwLightColorHue('0.0'),
      lightColorSaturation: GenericRgbwLightColorSaturation('1.0'),
      lightColorTemperature: GenericRgbwLightColorTemperature('8129'),
      lightColorValue: GenericRgbwLightColorValue('1.0'),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('sd3fgbns-64as-1gd2-gfdw-dgghks325as6'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsRgbLight.getCbjDeviceId,
          allRemoteCommandsRgbLight,
        ),
      ],
    );

    /// RGBLight

    final GenericDimmableLightDE allRemoteCommandsDimmableLight1 =
        GenericDimmableLightDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('sfds344t-sdf3-fd3d-24s4-bd2sdf3n5rfd'),
      entityUniqueId: EntityUniqueId('dn2fs1sgnxzzx34sh53qdf'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.lifx),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Dining Room Stove'),
      entityOriginalName: EntityOriginalName('Dining Room Light 1'),
      deviceOriginalName: DeviceOriginalName('Dining Room Light 1'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('lifx'),
      senderDeviceModel: DeviceSenderDeviceModel('1SE'),
      senderId: DeviceSenderId.fromUniqueString(
        'askf3gd7-nb21-fg2d-bvw9-xcbsd24sdgd6',
      ),
      compUuid: DeviceCompUuid('sn45sd1fcn5532d'),
      lightSwitchState:
          GenericDimmableLightSwitchState(EntityActions.off.toString()),
      lightBrightness: GenericDimmableLightBrightness('100'),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('dgh4nsdg-fd2d-df32-vn4g-dfgw2dvvnrrg'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsDimmableLight1.getCbjDeviceId,
          allRemoteCommandsDimmableLight1,
        ),
      ],
    );

    final GenericDimmableLightDE allRemoteCommandsDimmableLight2 =
        GenericDimmableLightDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('gcvweg3y-bv2s-cvwe-bdmf-7h4f3f2dw2d1'),
      entityUniqueId: EntityUniqueId('4gj76jykeg3fsdf2dsq11f'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.lifx),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Ami Room Ceiling'),
      entityOriginalName: EntityOriginalName('Ami Workshop Light'),
      deviceOriginalName: DeviceOriginalName('Ami Workshop Light'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('lifx'),
      senderDeviceModel: DeviceSenderDeviceModel('1SE'),
      senderId: DeviceSenderId.fromUniqueString(
        'f23gg2d2-h6j7-k8ky-6ugh-6t574ty47yj5',
      ),
      compUuid: DeviceCompUuid('dg23esbh4eghrer'),
      lightSwitchState:
          GenericDimmableLightSwitchState(EntityActions.off.toString()),
      lightBrightness: GenericDimmableLightBrightness('100'),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('nbfsgsdf-34f3-631w-125f-324f23567731'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsDimmableLight2.getCbjDeviceId,
          allRemoteCommandsDimmableLight2,
        ),
      ],
    );

    /// Light

    final GenericLightDE allRemoteCommandsLight = GenericLightDE(
      uniqueId:
          CoreUniqueId.fromUniqueString('wfdsg2w6-fgde-234s-vbz2-b234jmgvbfd6'),
      entityUniqueId: EntityUniqueId('cb3rdfh2ttgl9dgbvnsudt'),
      cbjDeviceVendor: CbjDeviceVendor.vendor(VendorsAndServices.espHome),
      deviceVendor: DeviceVendor(null),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(null),
      cbjEntityName: CbjEntityName('Dining Room Light 2'),
      entityOriginalName: EntityOriginalName('Dining Room Light 2'),
      deviceOriginalName: DeviceOriginalName('Dining Room Light 2'),
      entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('espHome'),
      senderDeviceModel: DeviceSenderDeviceModel('esp8266'),
      senderId: DeviceSenderId.fromUniqueString(
        'ffb3rg2s-cvns-awre-bmkp-yityueyertbe',
      ),
      compUuid: DeviceCompUuid('erbvnr34yh4627i'),
      lightSwitchState: GenericLightSwitchState(EntityActions.off.toString()),
      powerConsumption: DevicePowerConsumption('0'),
      deviceUniqueId: DeviceUniqueId('deviceUniqueId'),
      devicePort: DevicePort('devicePort'),
      deviceLastKnownIp: DeviceLastKnownIp('deviceLastKnownIp'),
      deviceHostName: DeviceHostName('deviceHostName'),
      deviceMdns: DeviceMdns('deviceMdns'),
      srvResourceRecord: DeviceSrvResourceRecord(),
      ptrResourceRecord: DevicePtrResourceRecord(),
      devicesMacAddress: DevicesMacAddress('devicesMacAddress'),
      entityKey: EntityKey('entityKey'),
      requestTimeStamp: RequestTimeStamp('requestTimeStamp'),
      lastResponseFromDeviceTimeStamp:
          LastResponseFromDeviceTimeStamp('lastResponseFromDeviceTimeStamp'),
      deviceCbjUniqueId:
          CoreUniqueId.fromUniqueString('sgeryjmn-gfn3-bf3v-et24-fvd22445jng3'),
    );

    devicesList.addEntries(
      [
        MapEntry(
          allRemoteCommandsLight.getCbjDeviceId,
          allRemoteCommandsLight,
        ),
      ],
    );

    return devicesList;
  }
}
