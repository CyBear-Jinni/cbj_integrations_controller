//
//  Generated code. Do not modify.
//  source: cbj_hub_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sendingTypeDescriptor instead')
const SendingType$json = {
  '1': 'SendingType',
  '2': [
    {'1': 'undefinedType', '2': 0},
    {'1': 'stringType', '2': 1},
    {'1': 'partialEntityType', '2': 2},
    {'1': 'entityType', '2': 3},
    {'1': 'mqttMassageType', '2': 4},
    {'1': 'sceneType', '2': 5},
    {'1': 'scheduleType', '2': 6},
    {'1': 'routineType', '2': 7},
    {'1': 'bindingsType', '2': 8},
    {'1': 'vendorLoginType', '2': 9},
    {'1': 'firstConnection', '2': 10},
    {'1': 'remotePipesInformation', '2': 11},
    {'1': 'getHubEntityInfo', '2': 12},
    {'1': 'responseHubEntityInfo', '2': 13},
    {'1': 'roomType', '2': 14},
    {'1': 'location', '2': 15},
  ],
};

/// Descriptor for `SendingType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sendingTypeDescriptor = $convert.base64Decode(
    'CgtTZW5kaW5nVHlwZRIRCg11bmRlZmluZWRUeXBlEAASDgoKc3RyaW5nVHlwZRABEhUKEXBhcn'
    'RpYWxFbnRpdHlUeXBlEAISDgoKZW50aXR5VHlwZRADEhMKD21xdHRNYXNzYWdlVHlwZRAEEg0K'
    'CXNjZW5lVHlwZRAFEhAKDHNjaGVkdWxlVHlwZRAGEg8KC3JvdXRpbmVUeXBlEAcSEAoMYmluZG'
    'luZ3NUeXBlEAgSEwoPdmVuZG9yTG9naW5UeXBlEAkSEwoPZmlyc3RDb25uZWN0aW9uEAoSGgoW'
    'cmVtb3RlUGlwZXNJbmZvcm1hdGlvbhALEhQKEGdldEh1YkVudGl0eUluZm8QDBIZChVyZXNwb2'
    '5zZUh1YkVudGl0eUluZm8QDRIMCghyb29tVHlwZRAOEgwKCGxvY2F0aW9uEA8=');

@$core.Deprecated('Use entityStateGRPCDescriptor instead')
const EntityStateGRPC$json = {
  '1': 'EntityStateGRPC',
  '2': [
    {'1': 'stateNotSupported', '2': 0},
    {'1': 'cancelStateInProcess', '2': 1},
    {'1': 'ack', '2': 2},
    {'1': 'newStateFailed', '2': 3},
    {'1': 'waitingInCloud', '2': 4},
    {'1': 'waitingInComp', '2': 5},
    {'1': 'noEntitiesToTransfer', '2': 6},
    {'1': 'pingNow', '2': 7},
    {'1': 'addingNewScene', '2': 8},
    {'1': 'addingNewRoutine', '2': 9},
    {'1': 'addingNewBinding', '2': 10},
    {'1': 'updateHubEntityPropertiesFromRealEntity', '2': 11},
  ],
};

/// Descriptor for `EntityStateGRPC`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List entityStateGRPCDescriptor = $convert.base64Decode(
    'Cg9FbnRpdHlTdGF0ZUdSUEMSFQoRc3RhdGVOb3RTdXBwb3J0ZWQQABIYChRjYW5jZWxTdGF0ZU'
    'luUHJvY2VzcxABEgcKA2FjaxACEhIKDm5ld1N0YXRlRmFpbGVkEAMSEgoOd2FpdGluZ0luQ2xv'
    'dWQQBBIRCg13YWl0aW5nSW5Db21wEAUSGAoUbm9FbnRpdGllc1RvVHJhbnNmZXIQBhILCgdwaW'
    '5nTm93EAcSEgoOYWRkaW5nTmV3U2NlbmUQCBIUChBhZGRpbmdOZXdSb3V0aW5lEAkSFAoQYWRk'
    'aW5nTmV3QmluZGluZxAKEisKJ3VwZGF0ZUh1YkVudGl0eVByb3BlcnRpZXNGcm9tUmVhbEVudG'
    'l0eRAL');

@$core.Deprecated('Use vendorsAndServicesDescriptor instead')
const VendorsAndServices$json = {
  '1': 'VendorsAndServices',
  '2': [
    {'1': 'vendorsAndServicesNotSupported', '2': 0},
    {'1': 'espHome', '2': 1},
    {'1': 'switcherSmartHome', '2': 2},
    {'1': 'tasmota', '2': 3},
    {'1': 'yeelight', '2': 4},
    {'1': 'google', '2': 5},
    {'1': 'miHome', '2': 6},
    {'1': 'lifx', '2': 7},
    {'1': 'tuyaSmart', '2': 8},
    {'1': 'smartLife', '2': 9},
    {'1': 'jinvooSmart', '2': 10},
    {'1': 'shelly', '2': 11},
    {'1': 'wink', '2': 12},
    {'1': 'ikea', '2': 13},
    {'1': 'sonoffDiy', '2': 14},
    {'1': 'philipsHue', '2': 15},
    {'1': 'lg', '2': 16},
    {'1': 'spotify', '2': 17},
    {'1': 'homeAssistant', '2': 18},
    {'1': 'hp', '2': 19},
    {'1': 'yeelink', '2': 20},
    {'1': 'xiaomi', '2': 21},
    {'1': 'sonoffEweLink', '2': 22},
    {'1': 'cbjDeviceSmartEntity', '2': 23},
    {'1': 'wiz', '2': 24},
    {'1': 'switchBot', '2': 25},
    {'1': 'somfy', '2': 26},
    {'1': 'sensibo', '2': 27},
    {'1': 'aqara', '2': 28},
    {'1': 'matter', '2': 29},
    {'1': 'nest', '2': 30},
    {'1': 'uniFi', '2': 31},
    {'1': 'ring', '2': 32},
    {'1': 'myQ', '2': 33},
    {'1': 'wemo', '2': 34},
    {'1': 'tpLink', '2': 35},
    {'1': 'nuki', '2': 36},
    {'1': 'homebridge', '2': 37},
    {'1': 'homeKit', '2': 38},
    {'1': 'twinkly', '2': 39},
    {'1': 'samsung', '2': 40},
    {'1': 'tizen', '2': 41},
    {'1': 'zigbee', '2': 42},
    {'1': 'zWave', '2': 43},
    {'1': 'ffmpeg', '2': 44},
    {'1': 'lightwaveRf', '2': 45},
    {'1': 'cololight', '2': 46},
    {'1': 'broadlink', '2': 47},
    {'1': 'switchBee', '2': 48},
    {'1': 'mycroft', '2': 49},
    {'1': 'xiaomiMi', '2': 50},
    {'1': 'cyBearJinniAppSmartEntity', '2': 51},
    {'1': 'securityBear', '2': 52},
    {'1': 'jinniAssistant', '2': 53},
  ],
};

/// Descriptor for `VendorsAndServices`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List vendorsAndServicesDescriptor = $convert.base64Decode(
    'ChJWZW5kb3JzQW5kU2VydmljZXMSIgoedmVuZG9yc0FuZFNlcnZpY2VzTm90U3VwcG9ydGVkEA'
    'ASCwoHZXNwSG9tZRABEhUKEXN3aXRjaGVyU21hcnRIb21lEAISCwoHdGFzbW90YRADEgwKCHll'
    'ZWxpZ2h0EAQSCgoGZ29vZ2xlEAUSCgoGbWlIb21lEAYSCAoEbGlmeBAHEg0KCXR1eWFTbWFydB'
    'AIEg0KCXNtYXJ0TGlmZRAJEg8KC2ppbnZvb1NtYXJ0EAoSCgoGc2hlbGx5EAsSCAoEd2luaxAM'
    'EggKBGlrZWEQDRINCglzb25vZmZEaXkQDhIOCgpwaGlsaXBzSHVlEA8SBgoCbGcQEBILCgdzcG'
    '90aWZ5EBESEQoNaG9tZUFzc2lzdGFudBASEgYKAmhwEBMSCwoHeWVlbGluaxAUEgoKBnhpYW9t'
    'aRAVEhEKDXNvbm9mZkV3ZUxpbmsQFhIYChRjYmpEZXZpY2VTbWFydEVudGl0eRAXEgcKA3dpeh'
    'AYEg0KCXN3aXRjaEJvdBAZEgkKBXNvbWZ5EBoSCwoHc2Vuc2libxAbEgkKBWFxYXJhEBwSCgoG'
    'bWF0dGVyEB0SCAoEbmVzdBAeEgkKBXVuaUZpEB8SCAoEcmluZxAgEgcKA215URAhEggKBHdlbW'
    '8QIhIKCgZ0cExpbmsQIxIICgRudWtpECQSDgoKaG9tZWJyaWRnZRAlEgsKB2hvbWVLaXQQJhIL'
    'Cgd0d2lua2x5ECcSCwoHc2Ftc3VuZxAoEgkKBXRpemVuECkSCgoGemlnYmVlECoSCQoFeldhdm'
    'UQKxIKCgZmZm1wZWcQLBIPCgtsaWdodHdhdmVSZhAtEg0KCWNvbG9saWdodBAuEg0KCWJyb2Fk'
    'bGluaxAvEg0KCXN3aXRjaEJlZRAwEgsKB215Y3JvZnQQMRIMCgh4aWFvbWlNaRAyEh0KGWN5Qm'
    'Vhckppbm5pQXBwU21hcnRFbnRpdHkQMxIQCgxzZWN1cml0eUJlYXIQNBISCg5qaW5uaUFzc2lz'
    'dGFudBA1');

@$core.Deprecated('Use entityTypesDescriptor instead')
const EntityTypes$json = {
  '1': 'EntityTypes',
  '2': [
    {'1': 'smartTypeNotSupported', '2': 0},
    {'1': 'light', '2': 1},
    {'1': 'blinds', '2': 2},
    {'1': 'boiler', '2': 3},
    {'1': 'button', '2': 4},
    {'1': 'buttonWithLight', '2': 5},
    {'1': 'hub', '2': 7},
    {'1': 'phoneApp', '2': 8},
    {'1': 'computerApp', '2': 9},
    {'1': 'browserApp', '2': 10},
    {'1': 'switch', '2': 11},
    {'1': 'dimmableLight', '2': 12},
    {'1': 'cctLight', '2': 13},
    {'1': 'rgbLights', '2': 14},
    {'1': 'rgbwLights', '2': 15},
    {'1': 'rgbcctLights', '2': 16},
    {'1': 'smartTV', '2': 17},
    {'1': 'smartSpeakers', '2': 18},
    {'1': 'coffeeMachine', '2': 19},
    {'1': 'kettle', '2': 20},
    {'1': 'teapot', '2': 21},
    {'1': 'washingMachine', '2': 22},
    {'1': 'dishwasher', '2': 23},
    {'1': 'toaster', '2': 24},
    {'1': 'vacuumCleaner', '2': 25},
    {'1': 'refrigerator', '2': 26},
    {'1': 'bed', '2': 27},
    {'1': 'oven', '2': 28},
    {'1': 'AirConditioner', '2': 29},
    {'1': 'smartWatch', '2': 30},
    {'1': 'smartWaterBottle', '2': 31},
    {'1': 'microphone', '2': 32},
    {'1': 'securityCamera', '2': 33},
    {'1': 'babyMonitor', '2': 34},
    {'1': 'motionSensor', '2': 35},
    {'1': 'temperatureSensor', '2': 36},
    {'1': 'humiditySensor', '2': 37},
    {'1': 'lightSensor', '2': 38},
    {'1': 'soundSensor', '2': 39},
    {'1': 'smokeSensor', '2': 40},
    {'1': 'smokeDetector', '2': 41},
    {'1': 'oxygenSensor', '2': 42},
    {'1': 'smartPlug', '2': 43},
    {'1': 'printer', '2': 44},
    {'1': 'scanner', '2': 45},
    {'1': 'printerWithScanner', '2': 46},
    {'1': 'smartComputer', '2': 47},
    {'1': 'emptyEntity', '2': 48},
    {'1': 'pingEntity', '2': 49},
    {'1': 'routerEntity', '2': 50},
    {'1': 'playerEntity', '2': 51},
    {'1': 'voiceAssistant', '2': 52},
  ],
};

/// Descriptor for `EntityTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List entityTypesDescriptor = $convert.base64Decode(
    'CgtFbnRpdHlUeXBlcxIZChVzbWFydFR5cGVOb3RTdXBwb3J0ZWQQABIJCgVsaWdodBABEgoKBm'
    'JsaW5kcxACEgoKBmJvaWxlchADEgoKBmJ1dHRvbhAEEhMKD2J1dHRvbldpdGhMaWdodBAFEgcK'
    'A2h1YhAHEgwKCHBob25lQXBwEAgSDwoLY29tcHV0ZXJBcHAQCRIOCgpicm93c2VyQXBwEAoSCg'
    'oGc3dpdGNoEAsSEQoNZGltbWFibGVMaWdodBAMEgwKCGNjdExpZ2h0EA0SDQoJcmdiTGlnaHRz'
    'EA4SDgoKcmdid0xpZ2h0cxAPEhAKDHJnYmNjdExpZ2h0cxAQEgsKB3NtYXJ0VFYQERIRCg1zbW'
    'FydFNwZWFrZXJzEBISEQoNY29mZmVlTWFjaGluZRATEgoKBmtldHRsZRAUEgoKBnRlYXBvdBAV'
    'EhIKDndhc2hpbmdNYWNoaW5lEBYSDgoKZGlzaHdhc2hlchAXEgsKB3RvYXN0ZXIQGBIRCg12YW'
    'N1dW1DbGVhbmVyEBkSEAoMcmVmcmlnZXJhdG9yEBoSBwoDYmVkEBsSCAoEb3ZlbhAcEhIKDkFp'
    'ckNvbmRpdGlvbmVyEB0SDgoKc21hcnRXYXRjaBAeEhQKEHNtYXJ0V2F0ZXJCb3R0bGUQHxIOCg'
    'ptaWNyb3Bob25lECASEgoOc2VjdXJpdHlDYW1lcmEQIRIPCgtiYWJ5TW9uaXRvchAiEhAKDG1v'
    'dGlvblNlbnNvchAjEhUKEXRlbXBlcmF0dXJlU2Vuc29yECQSEgoOaHVtaWRpdHlTZW5zb3IQJR'
    'IPCgtsaWdodFNlbnNvchAmEg8KC3NvdW5kU2Vuc29yECcSDwoLc21va2VTZW5zb3IQKBIRCg1z'
    'bW9rZURldGVjdG9yECkSEAoMb3h5Z2VuU2Vuc29yECoSDQoJc21hcnRQbHVnECsSCwoHcHJpbn'
    'RlchAsEgsKB3NjYW5uZXIQLRIWChJwcmludGVyV2l0aFNjYW5uZXIQLhIRCg1zbWFydENvbXB1'
    'dGVyEC8SDwoLZW1wdHlFbnRpdHkQMBIOCgpwaW5nRW50aXR5EDESEAoMcm91dGVyRW50aXR5ED'
    'ISEAoMcGxheWVyRW50aXR5EDMSEgoOdm9pY2VBc3Npc3RhbnQQNA==');

@$core.Deprecated('Use entityActionsDescriptor instead')
const EntityActions$json = {
  '1': 'EntityActions',
  '2': [
    {'1': 'actionNotSupported', '2': 0},
    {'1': 'on', '2': 1},
    {'1': 'off', '2': 2},
    {'1': 'moveUp', '2': 3},
    {'1': 'stop', '2': 4},
    {'1': 'moveDown', '2': 5},
    {'1': 'pressed', '2': 6},
    {'1': 'longPress', '2': 7},
    {'1': 'doubleTap', '2': 8},
    {'1': 'position', '2': 9},
    {'1': 'suspend', '2': 10},
    {'1': 'shutdown', '2': 11},
    {'1': 'itIsFalse', '2': 12},
    {'1': 'itIsTrue', '2': 13},
    {'1': 'pausePlay', '2': 14},
    {'1': 'changeVolume', '2': 15},
    {'1': 'jump', '2': 16},
    {'1': 'skip', '2': 17},
    {'1': 'pause', '2': 18},
    {'1': 'play', '2': 19},
    {'1': 'volumeUp', '2': 20},
    {'1': 'volumeDown', '2': 21},
    {'1': 'skipForeword', '2': 22},
    {'1': 'skipBackward', '2': 23},
    {'1': 'skipNextVid', '2': 24},
    {'1': 'skipPreviousVid', '2': 25},
    {'1': 'open', '2': 26},
    {'1': 'close', '2': 27},
    {'1': 'changeTemperature', '2': 28},
    {'1': 'changeFanSpeed', '2': 29},
    {'1': 'changeMod', '2': 30},
  ],
};

/// Descriptor for `EntityActions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List entityActionsDescriptor = $convert.base64Decode(
    'Cg1FbnRpdHlBY3Rpb25zEhYKEmFjdGlvbk5vdFN1cHBvcnRlZBAAEgYKAm9uEAESBwoDb2ZmEA'
    'ISCgoGbW92ZVVwEAMSCAoEc3RvcBAEEgwKCG1vdmVEb3duEAUSCwoHcHJlc3NlZBAGEg0KCWxv'
    'bmdQcmVzcxAHEg0KCWRvdWJsZVRhcBAIEgwKCHBvc2l0aW9uEAkSCwoHc3VzcGVuZBAKEgwKCH'
    'NodXRkb3duEAsSDQoJaXRJc0ZhbHNlEAwSDAoIaXRJc1RydWUQDRINCglwYXVzZVBsYXkQDhIQ'
    'CgxjaGFuZ2VWb2x1bWUQDxIICgRqdW1wEBASCAoEc2tpcBAREgkKBXBhdXNlEBISCAoEcGxheR'
    'ATEgwKCHZvbHVtZVVwEBQSDgoKdm9sdW1lRG93bhAVEhAKDHNraXBGb3Jld29yZBAWEhAKDHNr'
    'aXBCYWNrd2FyZBAXEg8KC3NraXBOZXh0VmlkEBgSEwoPc2tpcFByZXZpb3VzVmlkEBkSCAoEb3'
    'BlbhAaEgkKBWNsb3NlEBsSFQoRY2hhbmdlVGVtcGVyYXR1cmUQHBISCg5jaGFuZ2VGYW5TcGVl'
    'ZBAdEg0KCWNoYW5nZU1vZBAe');

@$core.Deprecated('Use whenToExecuteDescriptor instead')
const WhenToExecute$json = {
  '1': 'WhenToExecute',
  '2': [
    {'1': 'undefined', '2': 0},
    {'1': 'onOddNumberPress', '2': 1},
    {'1': 'evenNumberPress', '2': 2},
    {'1': 'betweenSelectedTime', '2': 3},
    {'1': 'doNotBetweenSelectedTime', '2': 4},
    {'1': 'allTheTime', '2': 5},
    {'1': 'never', '2': 6},
    {'1': 'onceNow', '2': 7},
    {'1': 'onceInSelectedTime', '2': 8},
    {'1': 'onlyIfEntityListAreInActionListState', '2': 9},
    {'1': 'atHome', '2': 10},
    {'1': 'outOfHome', '2': 11},
    {'1': 'atASpecificTime', '2': 12},
  ],
};

/// Descriptor for `WhenToExecute`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List whenToExecuteDescriptor = $convert.base64Decode(
    'Cg1XaGVuVG9FeGVjdXRlEg0KCXVuZGVmaW5lZBAAEhQKEG9uT2RkTnVtYmVyUHJlc3MQARITCg'
    '9ldmVuTnVtYmVyUHJlc3MQAhIXChNiZXR3ZWVuU2VsZWN0ZWRUaW1lEAMSHAoYZG9Ob3RCZXR3'
    'ZWVuU2VsZWN0ZWRUaW1lEAQSDgoKYWxsVGhlVGltZRAFEgkKBW5ldmVyEAYSCwoHb25jZU5vdx'
    'AHEhYKEm9uY2VJblNlbGVjdGVkVGltZRAIEigKJG9ubHlJZkVudGl0eUxpc3RBcmVJbkFjdGlv'
    'bkxpc3RTdGF0ZRAJEgoKBmF0SG9tZRAKEg0KCW91dE9mSG9tZRALEhMKD2F0QVNwZWNpZmljVG'
    'ltZRAM');

@$core.Deprecated('Use areaPurposesTypesDescriptor instead')
const AreaPurposesTypes$json = {
  '1': 'AreaPurposesTypes',
  '2': [
    {'1': 'bedroom', '2': 0},
    {'1': 'studyRoom', '2': 1},
    {'1': 'workRoom', '2': 2},
    {'1': 'tvRoom', '2': 3},
    {'1': 'videoGames', '2': 4},
    {'1': 'livingRoom', '2': 5},
    {'1': 'diningRoom', '2': 6},
    {'1': 'kitchen', '2': 7},
    {'1': 'outside', '2': 8},
    {'1': 'outsidePrimary', '2': 9},
    {'1': 'outsideNotPrimary', '2': 10},
    {'1': 'toiletRoom', '2': 11},
    {'1': 'shower', '2': 12},
    {'1': 'trainingRoom', '2': 13},
    {'1': 'meditation', '2': 14},
    {'1': 'romantic', '2': 15},
    {'1': 'stairsInside', '2': 16},
    {'1': 'stairsOutside', '2': 17},
    {'1': 'childrenRoom', '2': 18},
    {'1': 'cinemaRoom', '2': 19},
    {'1': 'boardGames', '2': 20},
    {'1': 'bathtub', '2': 21},
    {'1': 'laundryRoom', '2': 22},
    {'1': 'protectedSpace', '2': 23},
    {'1': 'safeRoom', '2': 24},
    {'1': 'attic', '2': 25},
    {'1': 'holidayCabin', '2': 26},
  ],
};

/// Descriptor for `AreaPurposesTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List areaPurposesTypesDescriptor = $convert.base64Decode(
    'ChFBcmVhUHVycG9zZXNUeXBlcxILCgdiZWRyb29tEAASDQoJc3R1ZHlSb29tEAESDAoId29ya1'
    'Jvb20QAhIKCgZ0dlJvb20QAxIOCgp2aWRlb0dhbWVzEAQSDgoKbGl2aW5nUm9vbRAFEg4KCmRp'
    'bmluZ1Jvb20QBhILCgdraXRjaGVuEAcSCwoHb3V0c2lkZRAIEhIKDm91dHNpZGVQcmltYXJ5EA'
    'kSFQoRb3V0c2lkZU5vdFByaW1hcnkQChIOCgp0b2lsZXRSb29tEAsSCgoGc2hvd2VyEAwSEAoM'
    'dHJhaW5pbmdSb29tEA0SDgoKbWVkaXRhdGlvbhAOEgwKCHJvbWFudGljEA8SEAoMc3RhaXJzSW'
    '5zaWRlEBASEQoNc3RhaXJzT3V0c2lkZRAREhAKDGNoaWxkcmVuUm9vbRASEg4KCmNpbmVtYVJv'
    'b20QExIOCgpib2FyZEdhbWVzEBQSCwoHYmF0aHR1YhAVEg8KC2xhdW5kcnlSb29tEBYSEgoOcH'
    'JvdGVjdGVkU3BhY2UQFxIMCghzYWZlUm9vbRAYEgkKBWF0dGljEBkSEAoMaG9saWRheUNhYmlu'
    'EBo=');

@$core.Deprecated('Use clientStatusRequestsDescriptor instead')
const ClientStatusRequests$json = {
  '1': 'ClientStatusRequests',
  '2': [
    {'1': 'sendingType', '3': 41, '4': 1, '5': 14, '6': '.CbjHub.SendingType', '10': 'sendingType'},
    {'1': 'allRemoteCommands', '3': 42, '4': 1, '5': 9, '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `ClientStatusRequests`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientStatusRequestsDescriptor = $convert.base64Decode(
    'ChRDbGllbnRTdGF0dXNSZXF1ZXN0cxI1CgtzZW5kaW5nVHlwZRgpIAEoDjITLkNiakh1Yi5TZW'
    '5kaW5nVHlwZVILc2VuZGluZ1R5cGUSLAoRYWxsUmVtb3RlQ29tbWFuZHMYKiABKAlSEWFsbFJl'
    'bW90ZUNvbW1hbmRz');

@$core.Deprecated('Use requestsAndStatusFromHubDescriptor instead')
const RequestsAndStatusFromHub$json = {
  '1': 'RequestsAndStatusFromHub',
  '2': [
    {'1': 'sendingType', '3': 43, '4': 1, '5': 14, '6': '.CbjHub.SendingType', '10': 'sendingType'},
    {'1': 'allRemoteCommands', '3': 44, '4': 1, '5': 9, '10': 'allRemoteCommands'},
  ],
};

/// Descriptor for `RequestsAndStatusFromHub`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestsAndStatusFromHubDescriptor = $convert.base64Decode(
    'ChhSZXF1ZXN0c0FuZFN0YXR1c0Zyb21IdWISNQoLc2VuZGluZ1R5cGUYKyABKA4yEy5DYmpIdW'
    'IuU2VuZGluZ1R5cGVSC3NlbmRpbmdUeXBlEiwKEWFsbFJlbW90ZUNvbW1hbmRzGCwgASgJUhFh'
    'bGxSZW1vdGVDb21tYW5kcw==');

@$core.Deprecated('Use allRemoteCommandsDescriptor instead')
const AllRemoteCommands$json = {
  '1': 'AllRemoteCommands',
  '2': [
    {'1': 'smartEntityInfo', '3': 40, '4': 1, '5': 11, '6': '.CbjHub.SmartEntityInfo', '10': 'smartEntityInfo'},
  ],
};

/// Descriptor for `AllRemoteCommands`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allRemoteCommandsDescriptor = $convert.base64Decode(
    'ChFBbGxSZW1vdGVDb21tYW5kcxJBCg9zbWFydEVudGl0eUluZm8YKCABKAsyFy5DYmpIdWIuU2'
    '1hcnRFbnRpdHlJbmZvUg9zbWFydEVudGl0eUluZm8=');

@$core.Deprecated('Use firstSetupMessageDescriptor instead')
const FirstSetupMessage$json = {
  '1': 'FirstSetupMessage',
  '2': [
    {'1': 'compInfo', '3': 38, '4': 1, '5': 11, '6': '.CbjHub.CompHubInfo', '10': 'compInfo'},
    {'1': 'cloudAccountInformation', '3': 39, '4': 1, '5': 11, '6': '.CbjHub.CloudAccountInformation', '10': 'cloudAccountInformation'},
  ],
};

/// Descriptor for `FirstSetupMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firstSetupMessageDescriptor = $convert.base64Decode(
    'ChFGaXJzdFNldHVwTWVzc2FnZRIvCghjb21wSW5mbxgmIAEoCzITLkNiakh1Yi5Db21wSHViSW'
    '5mb1IIY29tcEluZm8SWQoXY2xvdWRBY2NvdW50SW5mb3JtYXRpb24YJyABKAsyHy5DYmpIdWIu'
    'Q2xvdWRBY2NvdW50SW5mb3JtYXRpb25SF2Nsb3VkQWNjb3VudEluZm9ybWF0aW9u');

@$core.Deprecated('Use compHubInfoDescriptor instead')
const CompHubInfo$json = {
  '1': 'CompHubInfo',
  '2': [
    {'1': 'cbjInfo', '3': 47, '4': 1, '5': 11, '6': '.CbjHub.CbjHubIno', '10': 'cbjInfo'},
    {'1': 'compSpecs', '3': 21, '4': 1, '5': 11, '6': '.CbjHub.CompHubSpecs', '10': 'compSpecs'},
  ],
};

/// Descriptor for `CompHubInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compHubInfoDescriptor = $convert.base64Decode(
    'CgtDb21wSHViSW5mbxIrCgdjYmpJbmZvGC8gASgLMhEuQ2JqSHViLkNiakh1Yklub1IHY2JqSW'
    '5mbxIyCgljb21wU3BlY3MYFSABKAsyFC5DYmpIdWIuQ29tcEh1YlNwZWNzUgljb21wU3BlY3M=');

@$core.Deprecated('Use cbjHubInoDescriptor instead')
const CbjHubIno$json = {
  '1': 'CbjHubIno',
  '2': [
    {'1': 'entityName', '3': 48, '4': 1, '5': 9, '10': 'entityName'},
    {'1': 'pubspecYamlVersion', '3': 27, '4': 1, '5': 9, '10': 'pubspecYamlVersion'},
    {'1': 'pubspecYamlBuildNumber', '3': 51, '4': 1, '5': 9, '10': 'pubspecYamlBuildNumber'},
    {'1': 'protoLastGenDate', '3': 49, '4': 1, '5': 9, '10': 'protoLastGenDate'},
    {'1': 'dartSdkVersion', '3': 52, '4': 1, '5': 9, '10': 'dartSdkVersion'},
  ],
};

/// Descriptor for `CbjHubIno`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cbjHubInoDescriptor = $convert.base64Decode(
    'CglDYmpIdWJJbm8SHgoKZW50aXR5TmFtZRgwIAEoCVIKZW50aXR5TmFtZRIuChJwdWJzcGVjWW'
    'FtbFZlcnNpb24YGyABKAlSEnB1YnNwZWNZYW1sVmVyc2lvbhI2ChZwdWJzcGVjWWFtbEJ1aWxk'
    'TnVtYmVyGDMgASgJUhZwdWJzcGVjWWFtbEJ1aWxkTnVtYmVyEioKEHByb3RvTGFzdEdlbkRhdG'
    'UYMSABKAlSEHByb3RvTGFzdEdlbkRhdGUSJgoOZGFydFNka1ZlcnNpb24YNCABKAlSDmRhcnRT'
    'ZGtWZXJzaW9u');

@$core.Deprecated('Use compHubSpecsDescriptor instead')
const CompHubSpecs$json = {
  '1': 'CompHubSpecs',
  '2': [
    {'1': 'compId', '3': 22, '4': 1, '5': 9, '10': 'compId'},
    {'1': 'compUuid', '3': 23, '4': 1, '5': 9, '10': 'compUuid'},
    {'1': 'compOs', '3': 24, '4': 1, '5': 9, '10': 'compOs'},
    {'1': 'compModel', '3': 25, '4': 1, '5': 9, '10': 'compModel'},
    {'1': 'compType', '3': 26, '4': 1, '5': 9, '10': 'compType'},
    {'1': 'compIp', '3': 50, '4': 1, '5': 9, '10': 'compIp'},
  ],
};

/// Descriptor for `CompHubSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compHubSpecsDescriptor = $convert.base64Decode(
    'CgxDb21wSHViU3BlY3MSFgoGY29tcElkGBYgASgJUgZjb21wSWQSGgoIY29tcFV1aWQYFyABKA'
    'lSCGNvbXBVdWlkEhYKBmNvbXBPcxgYIAEoCVIGY29tcE9zEhwKCWNvbXBNb2RlbBgZIAEoCVIJ'
    'Y29tcE1vZGVsEhoKCGNvbXBUeXBlGBogASgJUghjb21wVHlwZRIWCgZjb21wSXAYMiABKAlSBm'
    'NvbXBJcA==');

@$core.Deprecated('Use microcontrollerSpecsDescriptor instead')
const MicrocontrollerSpecs$json = {
  '1': 'MicrocontrollerSpecs',
  '2': [
    {'1': 'microcontrollerModel', '3': 31, '4': 1, '5': 9, '10': 'microcontrollerModel'},
    {'1': 'microcontrollerType', '3': 32, '4': 1, '5': 9, '10': 'microcontrollerType'},
    {'1': 'softwareVersion', '3': 33, '4': 1, '5': 9, '10': 'softwareVersion'},
  ],
};

/// Descriptor for `MicrocontrollerSpecs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List microcontrollerSpecsDescriptor = $convert.base64Decode(
    'ChRNaWNyb2NvbnRyb2xsZXJTcGVjcxIyChRtaWNyb2NvbnRyb2xsZXJNb2RlbBgfIAEoCVIUbW'
    'ljcm9jb250cm9sbGVyTW9kZWwSMAoTbWljcm9jb250cm9sbGVyVHlwZRggIAEoCVITbWljcm9j'
    'b250cm9sbGVyVHlwZRIoCg9zb2Z0d2FyZVZlcnNpb24YISABKAlSD3NvZnR3YXJlVmVyc2lvbg'
    '==');

@$core.Deprecated('Use smartEntityInfoDescriptor instead')
const SmartEntityInfo$json = {
  '1': 'SmartEntityInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'state', '3': 3, '4': 1, '5': 9, '10': 'state'},
    {'1': 'defaultName', '3': 14, '4': 1, '5': 9, '10': 'defaultName'},
    {'1': 'roomId', '3': 15, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'senderDeviceModel', '3': 16, '4': 1, '5': 9, '10': 'senderDeviceModel'},
    {'1': 'senderDeviceOs', '3': 17, '4': 1, '5': 9, '10': 'senderDeviceOs'},
    {'1': 'senderId', '3': 18, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'serverTimeStamp', '3': 19, '4': 1, '5': 9, '10': 'serverTimeStamp'},
    {'1': 'stateMassage', '3': 20, '4': 1, '5': 9, '10': 'stateMassage'},
    {'1': 'mqttMassage', '3': 43, '4': 1, '5': 11, '6': '.CbjHub.MqttMassage', '10': 'mqttMassage'},
    {'1': 'isComputer', '3': 29, '4': 1, '5': 8, '10': 'isComputer'},
    {'1': 'compSpecs', '3': 30, '4': 1, '5': 11, '6': '.CbjHub.CompHubSpecs', '10': 'compSpecs'},
    {'1': 'microcontrollerSpecsSpecs', '3': 31, '4': 1, '5': 11, '6': '.CbjHub.MicrocontrollerSpecs', '10': 'microcontrollerSpecsSpecs'},
    {'1': 'entityTypesActions', '3': 34, '4': 1, '5': 11, '6': '.CbjHub.EntityTypesActions', '10': 'entityTypesActions'},
  ],
};

/// Descriptor for `SmartEntityInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartEntityInfoDescriptor = $convert.base64Decode(
    'Cg9TbWFydEVudGl0eUluZm8SDgoCaWQYASABKAlSAmlkEhQKBXN0YXRlGAMgASgJUgVzdGF0ZR'
    'IgCgtkZWZhdWx0TmFtZRgOIAEoCVILZGVmYXVsdE5hbWUSFgoGcm9vbUlkGA8gASgJUgZyb29t'
    'SWQSLAoRc2VuZGVyRGV2aWNlTW9kZWwYECABKAlSEXNlbmRlckRldmljZU1vZGVsEiYKDnNlbm'
    'RlckRldmljZU9zGBEgASgJUg5zZW5kZXJEZXZpY2VPcxIaCghzZW5kZXJJZBgSIAEoCVIIc2Vu'
    'ZGVySWQSKAoPc2VydmVyVGltZVN0YW1wGBMgASgJUg9zZXJ2ZXJUaW1lU3RhbXASIgoMc3RhdG'
    'VNYXNzYWdlGBQgASgJUgxzdGF0ZU1hc3NhZ2USNQoLbXF0dE1hc3NhZ2UYKyABKAsyEy5DYmpI'
    'dWIuTXF0dE1hc3NhZ2VSC21xdHRNYXNzYWdlEh4KCmlzQ29tcHV0ZXIYHSABKAhSCmlzQ29tcH'
    'V0ZXISMgoJY29tcFNwZWNzGB4gASgLMhQuQ2JqSHViLkNvbXBIdWJTcGVjc1IJY29tcFNwZWNz'
    'EloKGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MYHyABKAsyHC5DYmpIdWIuTWljcm9jb250cm'
    '9sbGVyU3BlY3NSGW1pY3JvY29udHJvbGxlclNwZWNzU3BlY3MSSgoSZW50aXR5VHlwZXNBY3Rp'
    'b25zGCIgASgLMhouQ2JqSHViLkVudGl0eVR5cGVzQWN0aW9uc1ISZW50aXR5VHlwZXNBY3Rpb2'
    '5z');

@$core.Deprecated('Use smartEntityStatusDescriptor instead')
const SmartEntityStatus$json = {
  '1': 'SmartEntityStatus',
  '2': [
    {'1': 'onOffState', '3': 4, '4': 1, '5': 8, '10': 'onOffState'},
  ],
};

/// Descriptor for `SmartEntityStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartEntityStatusDescriptor = $convert.base64Decode(
    'ChFTbWFydEVudGl0eVN0YXR1cxIeCgpvbk9mZlN0YXRlGAQgASgIUgpvbk9mZlN0YXRl');

@$core.Deprecated('Use mqttMassageDescriptor instead')
const MqttMassage$json = {
  '1': 'MqttMassage',
  '2': [
    {'1': 'mqttTopic', '3': 44, '4': 1, '5': 9, '10': 'mqttTopic'},
    {'1': 'mqttMassage', '3': 45, '4': 1, '5': 9, '10': 'mqttMassage'},
  ],
};

/// Descriptor for `MqttMassage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mqttMassageDescriptor = $convert.base64Decode(
    'CgtNcXR0TWFzc2FnZRIcCgltcXR0VG9waWMYLCABKAlSCW1xdHRUb3BpYxIgCgttcXR0TWFzc2'
    'FnZRgtIAEoCVILbXF0dE1hc3NhZ2U=');

@$core.Deprecated('Use commendStatusDescriptor instead')
const CommendStatus$json = {
  '1': 'CommendStatus',
  '2': [
    {'1': 'success', '3': 5, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CommendStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commendStatusDescriptor = $convert.base64Decode(
    'Cg1Db21tZW5kU3RhdHVzEhgKB3N1Y2Nlc3MYBSABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use smartEntitiesUpdateDetailsDescriptor instead')
const SmartEntitiesUpdateDetails$json = {
  '1': 'SmartEntitiesUpdateDetails',
  '2': [
    {'1': 'smartEntity', '3': 6, '4': 1, '5': 11, '6': '.CbjHub.SmartEntityInfo', '10': 'smartEntity'},
    {'1': 'newName', '3': 7, '4': 1, '5': 9, '10': 'newName'},
  ],
};

/// Descriptor for `SmartEntitiesUpdateDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartEntitiesUpdateDetailsDescriptor = $convert.base64Decode(
    'ChpTbWFydEVudGl0aWVzVXBkYXRlRGV0YWlscxI5CgtzbWFydEVudGl0eRgGIAEoCzIXLkNiak'
    'h1Yi5TbWFydEVudGl0eUluZm9SC3NtYXJ0RW50aXR5EhgKB25ld05hbWUYByABKAlSB25ld05h'
    'bWU=');

@$core.Deprecated('Use cloudAccountInformationDescriptor instead')
const CloudAccountInformation$json = {
  '1': 'CloudAccountInformation',
  '2': [
    {'1': 'cloudProjectId', '3': 8, '4': 1, '5': 9, '10': 'cloudProjectId'},
    {'1': 'cloudApiKey', '3': 9, '4': 1, '5': 9, '10': 'cloudApiKey'},
    {'1': 'userEmail', '3': 10, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'userPassword', '3': 11, '4': 1, '5': 9, '10': 'userPassword'},
    {'1': 'homeId', '3': 12, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `CloudAccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cloudAccountInformationDescriptor = $convert.base64Decode(
    'ChdDbG91ZEFjY291bnRJbmZvcm1hdGlvbhImCg5jbG91ZFByb2plY3RJZBgIIAEoCVIOY2xvdW'
    'RQcm9qZWN0SWQSIAoLY2xvdWRBcGlLZXkYCSABKAlSC2Nsb3VkQXBpS2V5EhwKCXVzZXJFbWFp'
    'bBgKIAEoCVIJdXNlckVtYWlsEiIKDHVzZXJQYXNzd29yZBgLIAEoCVIMdXNlclBhc3N3b3JkEh'
    'YKBmhvbWVJZBgMIAEoCVIGaG9tZUlk');

@$core.Deprecated('Use entityTypesActionsDescriptor instead')
const EntityTypesActions$json = {
  '1': 'EntityTypesActions',
  '2': [
    {'1': 'vendorsAndServices', '3': 46, '4': 1, '5': 14, '6': '.CbjHub.VendorsAndServices', '10': 'vendorsAndServices'},
    {'1': 'entityType', '3': 35, '4': 1, '5': 14, '6': '.CbjHub.EntityTypes', '10': 'entityType'},
    {'1': 'entityAction', '3': 36, '4': 1, '5': 14, '6': '.CbjHub.EntityActions', '10': 'entityAction'},
    {'1': 'entityStateGRPC', '3': 37, '4': 1, '5': 14, '6': '.CbjHub.EntityStateGRPC', '10': 'entityStateGRPC'},
  ],
};

/// Descriptor for `EntityTypesActions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityTypesActionsDescriptor = $convert.base64Decode(
    'ChJFbnRpdHlUeXBlc0FjdGlvbnMSSgoSdmVuZG9yc0FuZFNlcnZpY2VzGC4gASgOMhouQ2JqSH'
    'ViLlZlbmRvcnNBbmRTZXJ2aWNlc1ISdmVuZG9yc0FuZFNlcnZpY2VzEjMKCmVudGl0eVR5cGUY'
    'IyABKA4yEy5DYmpIdWIuRW50aXR5VHlwZXNSCmVudGl0eVR5cGUSOQoMZW50aXR5QWN0aW9uGC'
    'QgASgOMhUuQ2JqSHViLkVudGl0eUFjdGlvbnNSDGVudGl0eUFjdGlvbhJBCg9lbnRpdHlTdGF0'
    'ZUdSUEMYJSABKA4yFy5DYmpIdWIuRW50aXR5U3RhdGVHUlBDUg9lbnRpdHlTdGF0ZUdSUEM=');

