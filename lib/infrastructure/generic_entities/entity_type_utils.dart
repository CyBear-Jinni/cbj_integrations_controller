import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';

enum EntityProperties {
  blindsSwitchState,
  boilerSwitchState,
  lightSwitchState,
  lightColorTemperature,
  lightColorAlpha,
  lightColorHue,
  lightColorSaturation,
  lightColorValue,
  lightBrightness,
  pingSwitchState,
  printerSwitchState,
  securityCameraSuspendState,
  securityCameraShutDownState,
  smartComputerSuspendState,
  smartComputerShutDownState,
  smartPlugState,
  smartTvSwitchState,
  openUrl,
  skip,
  volume,
  switchState,
  ;

  bool containsAction(EntityActions action) {
    final EntityProperties property = EntityProperties.values[index];
    switch (property) {
      case EntityProperties.blindsSwitchState:
        return action == EntityActions.moveUp ||
            action == EntityActions.stop ||
            action == EntityActions.moveDown;
      case EntityProperties.boilerSwitchState:
        return action == EntityActions.on || action == EntityActions.off;
      case EntityProperties.lightSwitchState:
        return action == EntityActions.on || action == EntityActions.off;
      case EntityProperties.lightColorTemperature:
        return action == EntityActions.changeTemperature;
      case EntityProperties.lightColorAlpha:
        return action == EntityActions.changeTemperature;
      case EntityProperties.lightColorHue:
        return action == EntityActions.changeTemperature;
      case EntityProperties.lightColorSaturation:
        return action == EntityActions.changeTemperature;
      case EntityProperties.lightColorValue:
        return action == EntityActions.changeTemperature;
      case EntityProperties.lightBrightness:
        return action == EntityActions.changeTemperature;
      case EntityProperties.pingSwitchState:
        return action == EntityActions.on || action == EntityActions.off;
      case EntityProperties.printerSwitchState:
        return action == EntityActions.on || action == EntityActions.off;
      case EntityProperties.securityCameraSuspendState:
        return action == EntityActions.suspend;
      case EntityProperties.securityCameraShutDownState:
        return action == EntityActions.shutdown;
      case EntityProperties.smartComputerSuspendState:
        return action == EntityActions.suspend;
      case EntityProperties.smartComputerShutDownState:
        return action == EntityActions.shutdown;
      case EntityProperties.smartPlugState:
        return action == EntityActions.on || action == EntityActions.off;
      case EntityProperties.smartTvSwitchState:
        return action == EntityActions.on ||
            action == EntityActions.off ||
            action == EntityActions.play ||
            action == EntityActions.pause ||
            action == EntityActions.close;
      case EntityProperties.openUrl:
        return action == EntityActions.open;
      case EntityProperties.skip:
        return action == EntityActions.skip;
      case EntityProperties.volume:
        return action == EntityActions.volumeDown ||
            action == EntityActions.volumeDown;
      case EntityProperties.switchState:
        return action == EntityActions.on || action == EntityActions.off;
    }
  }
}

class EntityUtils {
  static String dTToString(EntityTypes deviceType) {
    return deviceType.toString().replaceAll('EntityState.', '');
  }

  static String deviceVendorToString(VendorsAndServices vendorsAndServices) {
    return vendorsAndServices.toString().replaceAll('VendorsAndServices.', '');
  }

  static EntityTypes? stringToDt(String? deviceTypeAsString) {
    if (deviceTypeAsString == null) {
      return null;
    }
    String deviceTypeAsStringTemp = deviceTypeAsString;
    if (deviceTypeAsStringTemp.contains('Object')) {
      deviceTypeAsStringTemp = deviceTypeAsStringTemp.substring(
        0,
        deviceTypeAsStringTemp.indexOf('Object'),
      );
    }
    for (final EntityTypes deviceType in EntityTypes.values) {
      if (dTToString(deviceType) == deviceTypeAsStringTemp) {
        return deviceType;
      }
    }
    return null;
  }

  static VendorsAndServices? stringToDeviceVendor(String deviceVendorAsString) {
    String deviceTypeAsStringTemp = deviceVendorAsString;
    if (deviceTypeAsStringTemp.contains('Object')) {
      deviceTypeAsStringTemp = deviceTypeAsStringTemp.substring(
        0,
        deviceTypeAsStringTemp.indexOf('Object'),
      );
    }
    for (final VendorsAndServices deviceType in VendorsAndServices.values) {
      if (deviceVendorToString(deviceType) == deviceTypeAsStringTemp) {
        return deviceType;
      }
    }
    return null;
  }

  ///  Convert deviceAction to string
  static String deviceActionToString(EntityActions deviceAction) {
    return deviceAction.toString().replaceAll('EntityActions.', '');
  }

  ///  Convert string to deviceAction
  static EntityActions? stringToDeviceAction(String deviceActionString) {
    for (final EntityActions deviceAction in EntityActions.values) {
      if (deviceActionToString(deviceAction) == deviceActionString) {
        return deviceAction;
      }
    }
    return null;
  }

  ///  Convert deviceState to string
  static String deviceStateToString(EntityStateGRPC deviceState) {
    return deviceState.toString().replaceAll('EntityStateGRPC.', '');
  }

  ///  Convert string to deviceState
  static EntityStateGRPC? stringToDeviceState(String deviceStateAsString) {
    for (final EntityStateGRPC deviceState in EntityStateGRPC.values) {
      if (deviceStateToString(deviceState) == deviceStateAsString) {
        return deviceState;
      }
    }
    return null;
  }

  /// Return the corresponding SmartDeviceBaseAbstract Object of the deviceType
  static dynamic deviceTypeToSmartDeviceBaseAbstractObject(
    EntityTypes deviceType,
  ) {
    throw Exception('$deviceType Conditioner was not implemented yet');
  }

  /// Returning the non abstract of this SmartDeviceBaseAbstract
  static Type getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
    dynamic smartDeviceBaseAbstract,
    EntityTypes deviceType,
  ) {
    throw Exception('$deviceType Conditioner was not implemented yet');
  }
}
