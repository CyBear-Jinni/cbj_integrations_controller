import 'dart:core';

import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_blinds_entity/generic_blinds_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_boiler_entity/generic_boiler_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_printer_entity/generic_printer_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_computer_entity/generic_smart_computer_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_plug_entity/generic_smart_plug_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_smart_tv_entity/generic_smart_tv_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_switch_entity/generic_switch_entity.dart';
import 'package:color/color.dart';

class SmartRoomObject {
  SmartRoomObject(
    this._roomName,
    this.grediantColor, {
    this.lightsInTheRoom,
    this.rgbwLightsInTheRoom,
    this.switchesInTheRoom,
    this.blindsInTheRoom,
    this.boilersInTheRoom,
    this.smartPlugsInTheRoom,
    this.smartComputersInTheRoom,
    this.smartTvsInTheRoom,
    this.printersInTheRoom,
  });

  final String _roomName;
  final List<GenericLightDE>? lightsInTheRoom;
  final List<GenericRgbwLightDE>? rgbwLightsInTheRoom;
  final List<GenericSwitchDE>? switchesInTheRoom;
  final List<GenericSmartPlugDE>? smartPlugsInTheRoom;
  final List<GenericSmartComputerDE>? smartComputersInTheRoom;
  final List<GenericSmartTvDE>? smartTvsInTheRoom;
  final List<Color> grediantColor;
  final List<GenericBlindsDE>? blindsInTheRoom;
  final List<GenericBoilerDE>? boilersInTheRoom;
  final List<GenericPrinterDE>? printersInTheRoom;

  String getRoomName() {
    return _roomName;
  }

  List<GenericLightDE>? getLights() {
    return lightsInTheRoom;
  }

  List<GenericRgbwLightDE>? getRgbwLightsColor() {
    return rgbwLightsInTheRoom;
  }

  List<GenericSwitchDE>? getSwitches() {
    return switchesInTheRoom;
  }

  List<GenericSmartPlugDE>? getSmartPlugs() {
    return smartPlugsInTheRoom;
  }

  List<GenericSmartComputerDE>? getSmartComputers() {
    return smartComputersInTheRoom;
  }

  List<GenericSmartTvDE>? getSmartTvs() {
    return smartTvsInTheRoom;
  }

  List<GenericBlindsDE>? getBlinds() {
    return blindsInTheRoom;
  }

  List<GenericBoilerDE>? getBoilers() {
    return boilersInTheRoom;
  }

  List<GenericPrinterDE>? getPrinters() {
    return printersInTheRoom;
  }
}
