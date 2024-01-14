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

extension VendorsAndServicesExtension on VendorsAndServices {
  static VendorsAndServices fromString(String typeAsString) {
    return VendorsAndServices.values.firstWhere(
      (element) => element.toString().split('.').last == typeAsString,
      orElse: () => VendorsAndServices.vendorsAndServicesNotSupported,
    );
  }
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

extension EntityActionsExtension on EntityActions {
  static EntityActions fromString(String typeAsString) {
    return EntityActions.values.firstWhere(
      (element) => element.toString().split('.').last == typeAsString,
      orElse: () => EntityActions.actionNotSupported,
    );
  }
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
  undefined,
  text,
  url,
  brightness,
  alpha,
  hue,
  saturation,
  value,
  temperature,
}

extension ActionValuesExtension on ActionValues {
  static ActionValues fromString(String typeAsString) {
    return ActionValues.values.firstWhere(
      (element) => element.toString().split('.').last == typeAsString,
      orElse: () => ActionValues.undefined,
    );
  }
}

enum VendorLoginTypes {
  notNeeded,
  authToken,
  apiKey,
  emailAndPassword,
}

/// Being added to send data for explain the type that was sent
enum SendingType {
  /// Not sure what we sent or got
  undefinedType,

  /// String without any structure
  stringType,

  /// Partial entity data in the form of json
  partialEntityType,

  /// Entity object in the form of json
  entityType,

  /// Sending mqtt massage
  mqttMassageType,

  /// Scenes
  sceneType,

  /// Schedule
  scheduleType,

  /// Routine
  routineType,

  /// Bindings
  bindingsType,

  /// Type for login into other vendors
  vendorLoginType,

  /// First connection, for sending first connection info like all entities
  /// status and more
  firstConnection,

  /// Remote Pipes Domain information
  remotePipesInformation,

  /// Request to get the entity and software info like proto file version and
  /// more
  getHubEntityInfo,

  /// Response that contains entity and software info like proto file version
  responseHubEntityInfo,

  /// Response that contains area object
  areaType,

  /// Sending location of entity
  location,

  allEntities,
  allAreas,
  allScenes,
  setEntitiesAction,
  ;
}

extension SendingTypeExtension on SendingType {
  static SendingType fromString(String typeAsString) {
    return SendingType.values.firstWhere(
      (element) => element.toString().split('.').last == typeAsString,
      orElse: () => SendingType.undefinedType,
    );
  }
}

/// List of purposes that each area in the home can have
enum AreaPurposesTypes {
  undefinedType,
  bedarea,
  studyArea,
  workArea,
  tvArea,
  videoGames,
  livingArea,
  diningArea,
  kitchen,
  outside,
  outsidePrimary,
  outsideNotPrimary,
  toiletArea,
  shower,
  trainingArea,
  meditation,
  romantic,
  stairsInside,
  stairsOutside,
  childrenArea,
  cinemaArea,
  boardGames,
  bathtub,
  laundryArea,
  protectedSpace,
  safeArea,
  attic,
  holidayCabin,
}

extension AreaPurposesTypesExtension on AreaPurposesTypes {
  static AreaPurposesTypes fromString(String typeAsString) {
    return AreaPurposesTypes.values.firstWhere(
      (element) => element.toString().split('.').last == typeAsString,
      orElse: () => AreaPurposesTypes.undefinedType,
    );
  }
}
