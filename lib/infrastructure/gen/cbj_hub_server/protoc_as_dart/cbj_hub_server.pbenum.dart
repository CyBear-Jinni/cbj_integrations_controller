//
//  Generated code. Do not modify.
//  source: cbj_hub_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / Being added to send data for explain the type that was sent
class SendingType extends $pb.ProtobufEnum {
  static const SendingType undefinedType = SendingType._(0, _omitEnumNames ? '' : 'undefinedType');
  static const SendingType stringType = SendingType._(1, _omitEnumNames ? '' : 'stringType');
  static const SendingType partialEntityType = SendingType._(2, _omitEnumNames ? '' : 'partialEntityType');
  static const SendingType entityType = SendingType._(3, _omitEnumNames ? '' : 'entityType');
  static const SendingType mqttMassageType = SendingType._(4, _omitEnumNames ? '' : 'mqttMassageType');
  static const SendingType sceneType = SendingType._(5, _omitEnumNames ? '' : 'sceneType');
  static const SendingType scheduleType = SendingType._(6, _omitEnumNames ? '' : 'scheduleType');
  static const SendingType routineType = SendingType._(7, _omitEnumNames ? '' : 'routineType');
  static const SendingType bindingsType = SendingType._(8, _omitEnumNames ? '' : 'bindingsType');
  static const SendingType vendorLoginType = SendingType._(9, _omitEnumNames ? '' : 'vendorLoginType');
  static const SendingType firstConnection = SendingType._(10, _omitEnumNames ? '' : 'firstConnection');
  static const SendingType remotePipesInformation = SendingType._(11, _omitEnumNames ? '' : 'remotePipesInformation');
  static const SendingType getHubEntityInfo = SendingType._(12, _omitEnumNames ? '' : 'getHubEntityInfo');
  static const SendingType responseHubEntityInfo = SendingType._(13, _omitEnumNames ? '' : 'responseHubEntityInfo');
  static const SendingType roomType = SendingType._(14, _omitEnumNames ? '' : 'roomType');
  static const SendingType location = SendingType._(15, _omitEnumNames ? '' : 'location');

  static const $core.List<SendingType> values = <SendingType> [
    undefinedType,
    stringType,
    partialEntityType,
    entityType,
    mqttMassageType,
    sceneType,
    scheduleType,
    routineType,
    bindingsType,
    vendorLoginType,
    firstConnection,
    remotePipesInformation,
    getHubEntityInfo,
    responseHubEntityInfo,
    roomType,
    location,
  ];

  static final $core.Map<$core.int, SendingType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SendingType? valueOf($core.int value) => _byValue[value];

  const SendingType._($core.int v, $core.String n) : super(v, n);
}

class EntityStateGRPC extends $pb.ProtobufEnum {
  static const EntityStateGRPC stateNotSupported = EntityStateGRPC._(0, _omitEnumNames ? '' : 'stateNotSupported');
  static const EntityStateGRPC cancelStateInProcess = EntityStateGRPC._(1, _omitEnumNames ? '' : 'cancelStateInProcess');
  static const EntityStateGRPC ack = EntityStateGRPC._(2, _omitEnumNames ? '' : 'ack');
  static const EntityStateGRPC newStateFailed = EntityStateGRPC._(3, _omitEnumNames ? '' : 'newStateFailed');
  static const EntityStateGRPC waitingInCloud = EntityStateGRPC._(4, _omitEnumNames ? '' : 'waitingInCloud');
  static const EntityStateGRPC waitingInComp = EntityStateGRPC._(5, _omitEnumNames ? '' : 'waitingInComp');
  static const EntityStateGRPC noEntitiesToTransfer = EntityStateGRPC._(6, _omitEnumNames ? '' : 'noEntitiesToTransfer');
  static const EntityStateGRPC pingNow = EntityStateGRPC._(7, _omitEnumNames ? '' : 'pingNow');
  static const EntityStateGRPC addingNewScene = EntityStateGRPC._(8, _omitEnumNames ? '' : 'addingNewScene');
  static const EntityStateGRPC addingNewRoutine = EntityStateGRPC._(9, _omitEnumNames ? '' : 'addingNewRoutine');
  static const EntityStateGRPC addingNewBinding = EntityStateGRPC._(10, _omitEnumNames ? '' : 'addingNewBinding');
  static const EntityStateGRPC updateHubEntityPropertiesFromRealEntity = EntityStateGRPC._(11, _omitEnumNames ? '' : 'updateHubEntityPropertiesFromRealEntity');

  static const $core.List<EntityStateGRPC> values = <EntityStateGRPC> [
    stateNotSupported,
    cancelStateInProcess,
    ack,
    newStateFailed,
    waitingInCloud,
    waitingInComp,
    noEntitiesToTransfer,
    pingNow,
    addingNewScene,
    addingNewRoutine,
    addingNewBinding,
    updateHubEntityPropertiesFromRealEntity,
  ];

  static final $core.Map<$core.int, EntityStateGRPC> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EntityStateGRPC? valueOf($core.int value) => _byValue[value];

  const EntityStateGRPC._($core.int v, $core.String n) : super(v, n);
}

class VendorsAndServices extends $pb.ProtobufEnum {
  static const VendorsAndServices vendorsAndServicesNotSupported = VendorsAndServices._(0, _omitEnumNames ? '' : 'vendorsAndServicesNotSupported');
  static const VendorsAndServices espHome = VendorsAndServices._(1, _omitEnumNames ? '' : 'espHome');
  static const VendorsAndServices switcherSmartHome = VendorsAndServices._(2, _omitEnumNames ? '' : 'switcherSmartHome');
  static const VendorsAndServices tasmota = VendorsAndServices._(3, _omitEnumNames ? '' : 'tasmota');
  static const VendorsAndServices yeelight = VendorsAndServices._(4, _omitEnumNames ? '' : 'yeelight');
  static const VendorsAndServices google = VendorsAndServices._(5, _omitEnumNames ? '' : 'google');
  static const VendorsAndServices miHome = VendorsAndServices._(6, _omitEnumNames ? '' : 'miHome');
  static const VendorsAndServices lifx = VendorsAndServices._(7, _omitEnumNames ? '' : 'lifx');
  static const VendorsAndServices tuyaSmart = VendorsAndServices._(8, _omitEnumNames ? '' : 'tuyaSmart');
  static const VendorsAndServices smartLife = VendorsAndServices._(9, _omitEnumNames ? '' : 'smartLife');
  static const VendorsAndServices jinvooSmart = VendorsAndServices._(10, _omitEnumNames ? '' : 'jinvooSmart');
  static const VendorsAndServices shelly = VendorsAndServices._(11, _omitEnumNames ? '' : 'shelly');
  static const VendorsAndServices wink = VendorsAndServices._(12, _omitEnumNames ? '' : 'wink');
  static const VendorsAndServices ikea = VendorsAndServices._(13, _omitEnumNames ? '' : 'ikea');
  static const VendorsAndServices sonoffDiy = VendorsAndServices._(14, _omitEnumNames ? '' : 'sonoffDiy');
  static const VendorsAndServices philipsHue = VendorsAndServices._(15, _omitEnumNames ? '' : 'philipsHue');
  static const VendorsAndServices lg = VendorsAndServices._(16, _omitEnumNames ? '' : 'lg');
  static const VendorsAndServices spotify = VendorsAndServices._(17, _omitEnumNames ? '' : 'spotify');
  static const VendorsAndServices homeAssistant = VendorsAndServices._(18, _omitEnumNames ? '' : 'homeAssistant');
  static const VendorsAndServices hp = VendorsAndServices._(19, _omitEnumNames ? '' : 'hp');
  static const VendorsAndServices yeelink = VendorsAndServices._(20, _omitEnumNames ? '' : 'yeelink');
  static const VendorsAndServices xiaomi = VendorsAndServices._(21, _omitEnumNames ? '' : 'xiaomi');
  static const VendorsAndServices sonoffEweLink = VendorsAndServices._(22, _omitEnumNames ? '' : 'sonoffEweLink');
  static const VendorsAndServices cbjDeviceSmartEntity = VendorsAndServices._(23, _omitEnumNames ? '' : 'cbjDeviceSmartEntity');
  static const VendorsAndServices wiz = VendorsAndServices._(24, _omitEnumNames ? '' : 'wiz');
  static const VendorsAndServices switchBot = VendorsAndServices._(25, _omitEnumNames ? '' : 'switchBot');
  static const VendorsAndServices somfy = VendorsAndServices._(26, _omitEnumNames ? '' : 'somfy');
  static const VendorsAndServices sensibo = VendorsAndServices._(27, _omitEnumNames ? '' : 'sensibo');
  static const VendorsAndServices aqara = VendorsAndServices._(28, _omitEnumNames ? '' : 'aqara');
  static const VendorsAndServices matter = VendorsAndServices._(29, _omitEnumNames ? '' : 'matter');
  static const VendorsAndServices nest = VendorsAndServices._(30, _omitEnumNames ? '' : 'nest');
  static const VendorsAndServices uniFi = VendorsAndServices._(31, _omitEnumNames ? '' : 'uniFi');
  static const VendorsAndServices ring = VendorsAndServices._(32, _omitEnumNames ? '' : 'ring');
  static const VendorsAndServices myQ = VendorsAndServices._(33, _omitEnumNames ? '' : 'myQ');
  static const VendorsAndServices wemo = VendorsAndServices._(34, _omitEnumNames ? '' : 'wemo');
  static const VendorsAndServices tpLink = VendorsAndServices._(35, _omitEnumNames ? '' : 'tpLink');
  static const VendorsAndServices nuki = VendorsAndServices._(36, _omitEnumNames ? '' : 'nuki');
  static const VendorsAndServices homebridge = VendorsAndServices._(37, _omitEnumNames ? '' : 'homebridge');
  static const VendorsAndServices homeKit = VendorsAndServices._(38, _omitEnumNames ? '' : 'homeKit');
  static const VendorsAndServices twinkly = VendorsAndServices._(39, _omitEnumNames ? '' : 'twinkly');
  static const VendorsAndServices samsung = VendorsAndServices._(40, _omitEnumNames ? '' : 'samsung');
  static const VendorsAndServices tizen = VendorsAndServices._(41, _omitEnumNames ? '' : 'tizen');
  static const VendorsAndServices zigbee = VendorsAndServices._(42, _omitEnumNames ? '' : 'zigbee');
  static const VendorsAndServices zWave = VendorsAndServices._(43, _omitEnumNames ? '' : 'zWave');
  static const VendorsAndServices ffmpeg = VendorsAndServices._(44, _omitEnumNames ? '' : 'ffmpeg');
  static const VendorsAndServices lightwaveRf = VendorsAndServices._(45, _omitEnumNames ? '' : 'lightwaveRf');
  static const VendorsAndServices cololight = VendorsAndServices._(46, _omitEnumNames ? '' : 'cololight');
  static const VendorsAndServices broadlink = VendorsAndServices._(47, _omitEnumNames ? '' : 'broadlink');
  static const VendorsAndServices switchBee = VendorsAndServices._(48, _omitEnumNames ? '' : 'switchBee');
  static const VendorsAndServices mycroft = VendorsAndServices._(49, _omitEnumNames ? '' : 'mycroft');
  static const VendorsAndServices xiaomiMi = VendorsAndServices._(50, _omitEnumNames ? '' : 'xiaomiMi');
  static const VendorsAndServices cyBearJinniAppSmartEntity = VendorsAndServices._(51, _omitEnumNames ? '' : 'cyBearJinniAppSmartEntity');
  static const VendorsAndServices securityBear = VendorsAndServices._(52, _omitEnumNames ? '' : 'securityBear');
  static const VendorsAndServices jinniAssistant = VendorsAndServices._(53, _omitEnumNames ? '' : 'jinniAssistant');

  static const $core.List<VendorsAndServices> values = <VendorsAndServices> [
    vendorsAndServicesNotSupported,
    espHome,
    switcherSmartHome,
    tasmota,
    yeelight,
    google,
    miHome,
    lifx,
    tuyaSmart,
    smartLife,
    jinvooSmart,
    shelly,
    wink,
    ikea,
    sonoffDiy,
    philipsHue,
    lg,
    spotify,
    homeAssistant,
    hp,
    yeelink,
    xiaomi,
    sonoffEweLink,
    cbjDeviceSmartEntity,
    wiz,
    switchBot,
    somfy,
    sensibo,
    aqara,
    matter,
    nest,
    uniFi,
    ring,
    myQ,
    wemo,
    tpLink,
    nuki,
    homebridge,
    homeKit,
    twinkly,
    samsung,
    tizen,
    zigbee,
    zWave,
    ffmpeg,
    lightwaveRf,
    cololight,
    broadlink,
    switchBee,
    mycroft,
    xiaomiMi,
    cyBearJinniAppSmartEntity,
    securityBear,
    jinniAssistant,
  ];

  static final $core.Map<$core.int, VendorsAndServices> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VendorsAndServices? valueOf($core.int value) => _byValue[value];

  const VendorsAndServices._($core.int v, $core.String n) : super(v, n);
}

class EntityTypes extends $pb.ProtobufEnum {
  static const EntityTypes smartTypeNotSupported = EntityTypes._(0, _omitEnumNames ? '' : 'smartTypeNotSupported');
  static const EntityTypes light = EntityTypes._(1, _omitEnumNames ? '' : 'light');
  static const EntityTypes blinds = EntityTypes._(2, _omitEnumNames ? '' : 'blinds');
  static const EntityTypes boiler = EntityTypes._(3, _omitEnumNames ? '' : 'boiler');
  static const EntityTypes button = EntityTypes._(4, _omitEnumNames ? '' : 'button');
  static const EntityTypes buttonWithLight = EntityTypes._(5, _omitEnumNames ? '' : 'buttonWithLight');
  static const EntityTypes hub = EntityTypes._(7, _omitEnumNames ? '' : 'hub');
  static const EntityTypes phoneApp = EntityTypes._(8, _omitEnumNames ? '' : 'phoneApp');
  static const EntityTypes computerApp = EntityTypes._(9, _omitEnumNames ? '' : 'computerApp');
  static const EntityTypes browserApp = EntityTypes._(10, _omitEnumNames ? '' : 'browserApp');
  static const EntityTypes switch_ = EntityTypes._(11, _omitEnumNames ? '' : 'switch');
  static const EntityTypes dimmableLight = EntityTypes._(12, _omitEnumNames ? '' : 'dimmableLight');
  static const EntityTypes cctLight = EntityTypes._(13, _omitEnumNames ? '' : 'cctLight');
  static const EntityTypes rgbLights = EntityTypes._(14, _omitEnumNames ? '' : 'rgbLights');
  static const EntityTypes rgbwLights = EntityTypes._(15, _omitEnumNames ? '' : 'rgbwLights');
  static const EntityTypes rgbcctLights = EntityTypes._(16, _omitEnumNames ? '' : 'rgbcctLights');
  static const EntityTypes smartTV = EntityTypes._(17, _omitEnumNames ? '' : 'smartTV');
  static const EntityTypes smartSpeakers = EntityTypes._(18, _omitEnumNames ? '' : 'smartSpeakers');
  static const EntityTypes coffeeMachine = EntityTypes._(19, _omitEnumNames ? '' : 'coffeeMachine');
  static const EntityTypes kettle = EntityTypes._(20, _omitEnumNames ? '' : 'kettle');
  static const EntityTypes teapot = EntityTypes._(21, _omitEnumNames ? '' : 'teapot');
  static const EntityTypes washingMachine = EntityTypes._(22, _omitEnumNames ? '' : 'washingMachine');
  static const EntityTypes dishwasher = EntityTypes._(23, _omitEnumNames ? '' : 'dishwasher');
  static const EntityTypes toaster = EntityTypes._(24, _omitEnumNames ? '' : 'toaster');
  static const EntityTypes vacuumCleaner = EntityTypes._(25, _omitEnumNames ? '' : 'vacuumCleaner');
  static const EntityTypes refrigerator = EntityTypes._(26, _omitEnumNames ? '' : 'refrigerator');
  static const EntityTypes bed = EntityTypes._(27, _omitEnumNames ? '' : 'bed');
  static const EntityTypes oven = EntityTypes._(28, _omitEnumNames ? '' : 'oven');
  static const EntityTypes AirConditioner = EntityTypes._(29, _omitEnumNames ? '' : 'AirConditioner');
  static const EntityTypes smartWatch = EntityTypes._(30, _omitEnumNames ? '' : 'smartWatch');
  static const EntityTypes smartWaterBottle = EntityTypes._(31, _omitEnumNames ? '' : 'smartWaterBottle');
  static const EntityTypes microphone = EntityTypes._(32, _omitEnumNames ? '' : 'microphone');
  static const EntityTypes securityCamera = EntityTypes._(33, _omitEnumNames ? '' : 'securityCamera');
  static const EntityTypes babyMonitor = EntityTypes._(34, _omitEnumNames ? '' : 'babyMonitor');
  static const EntityTypes motionSensor = EntityTypes._(35, _omitEnumNames ? '' : 'motionSensor');
  static const EntityTypes temperatureSensor = EntityTypes._(36, _omitEnumNames ? '' : 'temperatureSensor');
  static const EntityTypes humiditySensor = EntityTypes._(37, _omitEnumNames ? '' : 'humiditySensor');
  static const EntityTypes lightSensor = EntityTypes._(38, _omitEnumNames ? '' : 'lightSensor');
  static const EntityTypes soundSensor = EntityTypes._(39, _omitEnumNames ? '' : 'soundSensor');
  static const EntityTypes smokeSensor = EntityTypes._(40, _omitEnumNames ? '' : 'smokeSensor');
  static const EntityTypes smokeDetector = EntityTypes._(41, _omitEnumNames ? '' : 'smokeDetector');
  static const EntityTypes oxygenSensor = EntityTypes._(42, _omitEnumNames ? '' : 'oxygenSensor');
  static const EntityTypes smartPlug = EntityTypes._(43, _omitEnumNames ? '' : 'smartPlug');
  static const EntityTypes printer = EntityTypes._(44, _omitEnumNames ? '' : 'printer');
  static const EntityTypes scanner = EntityTypes._(45, _omitEnumNames ? '' : 'scanner');
  static const EntityTypes printerWithScanner = EntityTypes._(46, _omitEnumNames ? '' : 'printerWithScanner');
  static const EntityTypes smartComputer = EntityTypes._(47, _omitEnumNames ? '' : 'smartComputer');
  static const EntityTypes emptyEntity = EntityTypes._(48, _omitEnumNames ? '' : 'emptyEntity');
  static const EntityTypes pingEntity = EntityTypes._(49, _omitEnumNames ? '' : 'pingEntity');
  static const EntityTypes routerEntity = EntityTypes._(50, _omitEnumNames ? '' : 'routerEntity');
  static const EntityTypes playerEntity = EntityTypes._(51, _omitEnumNames ? '' : 'playerEntity');
  static const EntityTypes voiceAssistant = EntityTypes._(52, _omitEnumNames ? '' : 'voiceAssistant');

  static const $core.List<EntityTypes> values = <EntityTypes> [
    smartTypeNotSupported,
    light,
    blinds,
    boiler,
    button,
    buttonWithLight,
    hub,
    phoneApp,
    computerApp,
    browserApp,
    switch_,
    dimmableLight,
    cctLight,
    rgbLights,
    rgbwLights,
    rgbcctLights,
    smartTV,
    smartSpeakers,
    coffeeMachine,
    kettle,
    teapot,
    washingMachine,
    dishwasher,
    toaster,
    vacuumCleaner,
    refrigerator,
    bed,
    oven,
    AirConditioner,
    smartWatch,
    smartWaterBottle,
    microphone,
    securityCamera,
    babyMonitor,
    motionSensor,
    temperatureSensor,
    humiditySensor,
    lightSensor,
    soundSensor,
    smokeSensor,
    smokeDetector,
    oxygenSensor,
    smartPlug,
    printer,
    scanner,
    printerWithScanner,
    smartComputer,
    emptyEntity,
    pingEntity,
    routerEntity,
    playerEntity,
    voiceAssistant,
  ];

  static final $core.Map<$core.int, EntityTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EntityTypes? valueOf($core.int value) => _byValue[value];

  const EntityTypes._($core.int v, $core.String n) : super(v, n);
}

class EntityActions extends $pb.ProtobufEnum {
  static const EntityActions actionNotSupported = EntityActions._(0, _omitEnumNames ? '' : 'actionNotSupported');
  static const EntityActions on = EntityActions._(1, _omitEnumNames ? '' : 'on');
  static const EntityActions off = EntityActions._(2, _omitEnumNames ? '' : 'off');
  static const EntityActions moveUp = EntityActions._(3, _omitEnumNames ? '' : 'moveUp');
  static const EntityActions stop = EntityActions._(4, _omitEnumNames ? '' : 'stop');
  static const EntityActions moveDown = EntityActions._(5, _omitEnumNames ? '' : 'moveDown');
  static const EntityActions pressed = EntityActions._(6, _omitEnumNames ? '' : 'pressed');
  static const EntityActions longPress = EntityActions._(7, _omitEnumNames ? '' : 'longPress');
  static const EntityActions doubleTap = EntityActions._(8, _omitEnumNames ? '' : 'doubleTap');
  static const EntityActions position = EntityActions._(9, _omitEnumNames ? '' : 'position');
  static const EntityActions suspend = EntityActions._(10, _omitEnumNames ? '' : 'suspend');
  static const EntityActions shutdown = EntityActions._(11, _omitEnumNames ? '' : 'shutdown');
  static const EntityActions itIsFalse = EntityActions._(12, _omitEnumNames ? '' : 'itIsFalse');
  static const EntityActions itIsTrue = EntityActions._(13, _omitEnumNames ? '' : 'itIsTrue');
  static const EntityActions pausePlay = EntityActions._(14, _omitEnumNames ? '' : 'pausePlay');
  static const EntityActions changeVolume = EntityActions._(15, _omitEnumNames ? '' : 'changeVolume');
  static const EntityActions jump = EntityActions._(16, _omitEnumNames ? '' : 'jump');
  static const EntityActions skip = EntityActions._(17, _omitEnumNames ? '' : 'skip');
  static const EntityActions pause = EntityActions._(18, _omitEnumNames ? '' : 'pause');
  static const EntityActions play = EntityActions._(19, _omitEnumNames ? '' : 'play');
  static const EntityActions volumeUp = EntityActions._(20, _omitEnumNames ? '' : 'volumeUp');
  static const EntityActions volumeDown = EntityActions._(21, _omitEnumNames ? '' : 'volumeDown');
  static const EntityActions skipForeword = EntityActions._(22, _omitEnumNames ? '' : 'skipForeword');
  static const EntityActions skipBackward = EntityActions._(23, _omitEnumNames ? '' : 'skipBackward');
  static const EntityActions skipNextVid = EntityActions._(24, _omitEnumNames ? '' : 'skipNextVid');
  static const EntityActions skipPreviousVid = EntityActions._(25, _omitEnumNames ? '' : 'skipPreviousVid');
  static const EntityActions open = EntityActions._(26, _omitEnumNames ? '' : 'open');
  static const EntityActions close = EntityActions._(27, _omitEnumNames ? '' : 'close');
  static const EntityActions changeTemperature = EntityActions._(28, _omitEnumNames ? '' : 'changeTemperature');
  static const EntityActions changeFanSpeed = EntityActions._(29, _omitEnumNames ? '' : 'changeFanSpeed');
  static const EntityActions changeMod = EntityActions._(30, _omitEnumNames ? '' : 'changeMod');

  static const $core.List<EntityActions> values = <EntityActions> [
    actionNotSupported,
    on,
    off,
    moveUp,
    stop,
    moveDown,
    pressed,
    longPress,
    doubleTap,
    position,
    suspend,
    shutdown,
    itIsFalse,
    itIsTrue,
    pausePlay,
    changeVolume,
    jump,
    skip,
    pause,
    play,
    volumeUp,
    volumeDown,
    skipForeword,
    skipBackward,
    skipNextVid,
    skipPreviousVid,
    open,
    close,
    changeTemperature,
    changeFanSpeed,
    changeMod,
  ];

  static final $core.Map<$core.int, EntityActions> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EntityActions? valueOf($core.int value) => _byValue[value];

  const EntityActions._($core.int v, $core.String n) : super(v, n);
}

class WhenToExecute extends $pb.ProtobufEnum {
  static const WhenToExecute undefined = WhenToExecute._(0, _omitEnumNames ? '' : 'undefined');
  static const WhenToExecute onOddNumberPress = WhenToExecute._(1, _omitEnumNames ? '' : 'onOddNumberPress');
  static const WhenToExecute evenNumberPress = WhenToExecute._(2, _omitEnumNames ? '' : 'evenNumberPress');
  static const WhenToExecute betweenSelectedTime = WhenToExecute._(3, _omitEnumNames ? '' : 'betweenSelectedTime');
  static const WhenToExecute doNotBetweenSelectedTime = WhenToExecute._(4, _omitEnumNames ? '' : 'doNotBetweenSelectedTime');
  static const WhenToExecute allTheTime = WhenToExecute._(5, _omitEnumNames ? '' : 'allTheTime');
  static const WhenToExecute never = WhenToExecute._(6, _omitEnumNames ? '' : 'never');
  static const WhenToExecute onceNow = WhenToExecute._(7, _omitEnumNames ? '' : 'onceNow');
  static const WhenToExecute onceInSelectedTime = WhenToExecute._(8, _omitEnumNames ? '' : 'onceInSelectedTime');
  static const WhenToExecute onlyIfEntityListAreInActionListState = WhenToExecute._(9, _omitEnumNames ? '' : 'onlyIfEntityListAreInActionListState');
  static const WhenToExecute atHome = WhenToExecute._(10, _omitEnumNames ? '' : 'atHome');
  static const WhenToExecute outOfHome = WhenToExecute._(11, _omitEnumNames ? '' : 'outOfHome');
  static const WhenToExecute atASpecificTime = WhenToExecute._(12, _omitEnumNames ? '' : 'atASpecificTime');

  static const $core.List<WhenToExecute> values = <WhenToExecute> [
    undefined,
    onOddNumberPress,
    evenNumberPress,
    betweenSelectedTime,
    doNotBetweenSelectedTime,
    allTheTime,
    never,
    onceNow,
    onceInSelectedTime,
    onlyIfEntityListAreInActionListState,
    atHome,
    outOfHome,
    atASpecificTime,
  ];

  static final $core.Map<$core.int, WhenToExecute> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WhenToExecute? valueOf($core.int value) => _byValue[value];

  const WhenToExecute._($core.int v, $core.String n) : super(v, n);
}

/// / List of purposes that each area in the home can have
class AreaPurposesTypes extends $pb.ProtobufEnum {
  static const AreaPurposesTypes bedroom = AreaPurposesTypes._(0, _omitEnumNames ? '' : 'bedroom');
  static const AreaPurposesTypes studyRoom = AreaPurposesTypes._(1, _omitEnumNames ? '' : 'studyRoom');
  static const AreaPurposesTypes workRoom = AreaPurposesTypes._(2, _omitEnumNames ? '' : 'workRoom');
  static const AreaPurposesTypes tvRoom = AreaPurposesTypes._(3, _omitEnumNames ? '' : 'tvRoom');
  static const AreaPurposesTypes videoGames = AreaPurposesTypes._(4, _omitEnumNames ? '' : 'videoGames');
  static const AreaPurposesTypes livingRoom = AreaPurposesTypes._(5, _omitEnumNames ? '' : 'livingRoom');
  static const AreaPurposesTypes diningRoom = AreaPurposesTypes._(6, _omitEnumNames ? '' : 'diningRoom');
  static const AreaPurposesTypes kitchen = AreaPurposesTypes._(7, _omitEnumNames ? '' : 'kitchen');
  static const AreaPurposesTypes outside = AreaPurposesTypes._(8, _omitEnumNames ? '' : 'outside');
  static const AreaPurposesTypes outsidePrimary = AreaPurposesTypes._(9, _omitEnumNames ? '' : 'outsidePrimary');
  static const AreaPurposesTypes outsideNotPrimary = AreaPurposesTypes._(10, _omitEnumNames ? '' : 'outsideNotPrimary');
  static const AreaPurposesTypes toiletRoom = AreaPurposesTypes._(11, _omitEnumNames ? '' : 'toiletRoom');
  static const AreaPurposesTypes shower = AreaPurposesTypes._(12, _omitEnumNames ? '' : 'shower');
  static const AreaPurposesTypes trainingRoom = AreaPurposesTypes._(13, _omitEnumNames ? '' : 'trainingRoom');
  static const AreaPurposesTypes meditation = AreaPurposesTypes._(14, _omitEnumNames ? '' : 'meditation');
  static const AreaPurposesTypes romantic = AreaPurposesTypes._(15, _omitEnumNames ? '' : 'romantic');
  static const AreaPurposesTypes stairsInside = AreaPurposesTypes._(16, _omitEnumNames ? '' : 'stairsInside');
  static const AreaPurposesTypes stairsOutside = AreaPurposesTypes._(17, _omitEnumNames ? '' : 'stairsOutside');
  static const AreaPurposesTypes childrenRoom = AreaPurposesTypes._(18, _omitEnumNames ? '' : 'childrenRoom');
  static const AreaPurposesTypes cinemaRoom = AreaPurposesTypes._(19, _omitEnumNames ? '' : 'cinemaRoom');
  static const AreaPurposesTypes boardGames = AreaPurposesTypes._(20, _omitEnumNames ? '' : 'boardGames');
  static const AreaPurposesTypes bathtub = AreaPurposesTypes._(21, _omitEnumNames ? '' : 'bathtub');
  static const AreaPurposesTypes laundryRoom = AreaPurposesTypes._(22, _omitEnumNames ? '' : 'laundryRoom');
  static const AreaPurposesTypes protectedSpace = AreaPurposesTypes._(23, _omitEnumNames ? '' : 'protectedSpace');
  static const AreaPurposesTypes safeRoom = AreaPurposesTypes._(24, _omitEnumNames ? '' : 'safeRoom');
  static const AreaPurposesTypes attic = AreaPurposesTypes._(25, _omitEnumNames ? '' : 'attic');
  static const AreaPurposesTypes holidayCabin = AreaPurposesTypes._(26, _omitEnumNames ? '' : 'holidayCabin');

  static const $core.List<AreaPurposesTypes> values = <AreaPurposesTypes> [
    bedroom,
    studyRoom,
    workRoom,
    tvRoom,
    videoGames,
    livingRoom,
    diningRoom,
    kitchen,
    outside,
    outsidePrimary,
    outsideNotPrimary,
    toiletRoom,
    shower,
    trainingRoom,
    meditation,
    romantic,
    stairsInside,
    stairsOutside,
    childrenRoom,
    cinemaRoom,
    boardGames,
    bathtub,
    laundryRoom,
    protectedSpace,
    safeRoom,
    attic,
    holidayCabin,
  ];

  static final $core.Map<$core.int, AreaPurposesTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AreaPurposesTypes? valueOf($core.int value) => _byValue[value];

  const AreaPurposesTypes._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
