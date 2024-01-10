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
  shelly,
  sonoffDiy,
  philipsHue,
  hp,
  yeelink,
  xiaomi,
  sonoffEweLink,
  cbjDeviceSmartEntity,
  wiz,
  sensibo,
  xiaomiMi,
  cyBearJinniAppSmartEntity,
  securityBear,
  jinniAssistant,
  apple,
}

enum EntityTypes {
  smartTypeNotSupported,
  light,
  blinds,
  boiler,

  /// The app running on a browser.
  switch_,
  dimmableLight,
  rgbwLights,
  smartTV,
  securityCamera,
  smartPlug,
  printer,

  /// Entity with full computer excess like executing commands and checking
  /// process status.
  smartComputer,
  emptyEntity,
  pingEntity,
  ac,
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
  openUrl,
  close,
  changeTemperature,
  changeMod,
  speek,
  hsvColor,
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
}

enum ActionValues {
  text,
  url,
  brightness,
  alpha,
  hue,
  saturation,
  value,
  temperature,
}

enum VendorLoginTypes {
  notNeeded,
  authToken,
  apiKey,
  emailAndPassword,
}
