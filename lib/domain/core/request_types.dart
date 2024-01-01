enum EntityStateGRPC {
  stateNotSupported,

  /// Cancel if not ack yet
  cancelStateInProcess,

  /// Acknowledge that the state was updated
  ack,

  /// New State was failed to execute
  newStateFailed,

  /// Waiting for entity to take action from cloud and ack
  waitingInCloud,

  /// Comp/Hub is trying to execute and waiting ack
  waitingInComp,

  /// No entities to transfer
  noEntitiesToTransfer,

  /// Ping the other side
  pingNow,

  /// Adding new scene
  addingNewScene,

  /// Adding new routine
  addingNewRoutine,

  /// Adding new binding
  addingNewBinding,

  /// Update hub entity object properties from the real entity
  updateHubEntityPropertiesFromRealEntity,
  ;
}

enum VendorsAndServices {
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
  ;
}

enum EntityTypes {
  smartTypeNotSupported,
  light,
  blinds,
  boiler,
  button,
  buttonWithLight,
  hub,

  /// The app running on a phone.
  phoneApp,

  /// The app running on a computer.
  computerApp,

  /// The app running on a browser.
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
  airConditioner,
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

  /// Entity with full computer excess like executing commands and checking
  /// process status.
  smartComputer,
  emptyEntity,
  pingEntity,
  routerEntity,

  /// Music player
  playerEntity,
  voiceAssistant,
  ;
}

enum EntityActions {
  actionNotSupported,
  on,
  off,
  moveUp,
  stop,
  moveDown,
  pressed, // for buttons
  longPress, // for buttons
  doubleTap, // for buttons
  position, // Example: for blinds height
  suspend, // Suspend the computer
  shutdown, // Shut down the computer
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
  ;
}

enum WhenToExecute {
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
  atASpecificTime, // Example: Only on Sunday and Tuesday at 5:35
  ;
}
