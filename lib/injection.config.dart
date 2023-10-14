// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cbj_integrations_controller/infrastructure/devices/cbj_devices/cbj_devices_connector_conjector.dart'
    as _i3;
import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_connector_conjector.dart'
    as _i4;
import 'package:cbj_integrations_controller/infrastructure/devices/ewelink/ewelink_connector_conjector.dart'
    as _i5;
import 'package:cbj_integrations_controller/infrastructure/devices/google/google_connector_conjector.dart'
    as _i6;
import 'package:cbj_integrations_controller/infrastructure/devices/hp/hp_connector_conjector.dart'
    as _i7;
import 'package:cbj_integrations_controller/infrastructure/devices/lg/lg_connector_conjector.dart'
    as _i8;
import 'package:cbj_integrations_controller/infrastructure/devices/lifx/lifx_connector_conjector.dart'
    as _i9;
import 'package:cbj_integrations_controller/infrastructure/devices/philips_hue/philips_hue_connector_conjector.dart'
    as _i10;
import 'package:cbj_integrations_controller/infrastructure/devices/shelly/shelly_connector_conjector.dart'
    as _i11;
import 'package:cbj_integrations_controller/infrastructure/devices/sonoff_diy/sonoff_diy_connector_conjector.dart'
    as _i12;
import 'package:cbj_integrations_controller/infrastructure/devices/switcher/switcher_connector_conjector.dart'
    as _i13;
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_connector_conjector.dart'
    as _i14;
import 'package:cbj_integrations_controller/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_connector_conjector.dart'
    as _i15;
import 'package:cbj_integrations_controller/infrastructure/devices/tuya_smart/tuya_smart_connector_conjector.dart'
    as _i16;
import 'package:cbj_integrations_controller/infrastructure/devices/wiz/wiz_connector_conjector.dart'
    as _i17;
import 'package:cbj_integrations_controller/infrastructure/devices/xiaomi_io/xiaomi_io_connector_conjector.dart'
    as _i18;
import 'package:cbj_integrations_controller/infrastructure/devices/yeelight/yeelight_connector_conjector.dart'
    as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.CbjDevicesConnectorConjector>(
        _i3.CbjDevicesConnectorConjector());
    gh.singleton<_i4.EspHomeConnectorConjector>(
        _i4.EspHomeConnectorConjector());
    gh.singleton<_i5.EwelinkConnectorConjector>(
        _i5.EwelinkConnectorConjector());
    gh.singleton<_i6.GoogleConnectorConjector>(_i6.GoogleConnectorConjector());
    gh.singleton<_i7.HpConnectorConjector>(_i7.HpConnectorConjector());
    gh.singleton<_i8.LgConnectorConjector>(_i8.LgConnectorConjector());
    gh.singleton<_i9.LifxConnectorConjector>(_i9.LifxConnectorConjector());
    gh.singleton<_i10.PhilipsHueConnectorConjector>(
        _i10.PhilipsHueConnectorConjector());
    gh.singleton<_i11.ShellyConnectorConjector>(
        _i11.ShellyConnectorConjector());
    gh.singleton<_i12.SonoffDiyConnectorConjector>(
        _i12.SonoffDiyConnectorConjector());
    gh.singleton<_i13.SwitcherConnectorConjector>(
        _i13.SwitcherConnectorConjector());
    gh.singleton<_i14.TasmotaIpConnectorConjector>(
        _i14.TasmotaIpConnectorConjector());
    gh.singleton<_i15.TasmotaMqttConnectorConjector>(
        _i15.TasmotaMqttConnectorConjector());
    gh.singleton<_i16.TuyaSmartConnectorConjector>(
        _i16.TuyaSmartConnectorConjector());
    gh.singleton<_i17.WizConnectorConjector>(_i17.WizConnectorConjector());
    gh.singleton<_i18.XiaomiIoConnectorConjector>(
        _i18.XiaomiIoConnectorConjector());
    gh.singleton<_i19.YeelightConnectorConjector>(
        _i19.YeelightConnectorConjector());
    return this;
  }
}
