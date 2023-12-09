import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_blinds_device/generic_blinds_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_boiler_device/generic_boiler_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_dimmable_light_device/generic_dimmable_light_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_empty_device/generic_empty_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_light_device/generic_light_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_ping_device/generic_ping_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_printer_device/generic_printer_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_rgbw_light_device/generic_rgbw_light_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_computer_device/generic_smart_computer_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_plug_device/generic_smart_plug_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_tv_device/generic_smart_tv_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_smart_type_type_not_supported_device/generic_smart_type_not_supported_device_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/generic_switch_device/generic_switch_device_dtos.dart';

class DeviceEntityDtoAbstract {
  DeviceEntityDtoAbstract();

  factory DeviceEntityDtoAbstract.fromDomain() {
    icLogger.t('DeviceEntityDtoAbstract.fromDomain');
    return DeviceEntityDtoAbstract();
  }

  factory DeviceEntityDtoAbstract.fromJson(Map<String, dynamic> json) {
    DeviceEntityDtoAbstract deviceEntityDtoAbstract = DeviceEntityDtoAbstract();
    final String jsonDeviceDtoClass = json['deviceDtoClass'].toString();

    if (jsonDeviceDtoClass == (GenericLightDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.light.toString()) {
      deviceEntityDtoAbstract = GenericLightDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass ==
            (GenericDimmableLightDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.dimmableLight.toString()) {
      deviceEntityDtoAbstract = GenericDimmableLightDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericRgbwLightDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.rgbwLights.toString()) {
      deviceEntityDtoAbstract = GenericRgbwLightDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericBlindsDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.blinds.toString()) {
      deviceEntityDtoAbstract = GenericBlindsDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericBoilerDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.boiler.toString()) {
      deviceEntityDtoAbstract = GenericBoilerDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericSmartTvDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.smartTV.toString()) {
      deviceEntityDtoAbstract = GenericSmartTvDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericSwitchDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.switch_.toString()) {
      deviceEntityDtoAbstract = GenericSwitchDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericSmartPlugDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.smartPlug.toString()) {
      deviceEntityDtoAbstract = GenericSmartPlugDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass ==
            (GenericSmartComputerDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.smartComputer.toString()) {
      deviceEntityDtoAbstract = GenericSmartComputerDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericPrinterDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.printer.toString()) {
      deviceEntityDtoAbstract = GenericPrinterDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericEmptyDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.emptyEntity.toString()) {
      deviceEntityDtoAbstract = GenericEmptyDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericPingDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.pingEntity.toString()) {
      deviceEntityDtoAbstract = GenericPingDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass ==
            (GenericSmartTypeNotSupportedDeviceDtos).toString() ||
        json['entityTypes'] == EntityTypes.smartTypeNotSupported.toString()) {
      deviceEntityDtoAbstract =
          GenericSmartTypeNotSupportedDeviceDtos.fromJson(json);
    } else {
      throw 'DtoClassTypeDoesNotExist, please add here support for ${json['entityTypes']}';
    }
    return deviceEntityDtoAbstract;
  }

  final String deviceDtoClassInstance = (DeviceEntityDtoAbstract).toString();

  Map<String, dynamic> toJson() {
    icLogger.t('DeviceEntityDtoAbstract to Json');
    return {};
  }

  DeviceEntityAbstract toDomain() {
    icLogger.t('ToDomain');
    return DeviceEntityNotAbstract();
  }
}
