import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/domain/vendors/xiaomi_mi_login/generic_xiaomi_mi_login_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/xiaomi_io/xiaomi_io_gpx3021gl/xiaomi_io_gpx3021gl_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbenum.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:mi_iot_token/mi_iot_token.dart';

class XiaomiIoConnectorConjecture extends VendorConnectorConjectureService {
  factory XiaomiIoConnectorConjecture() {
    return _instance;
  }

  XiaomiIoConnectorConjecture._singletonContractor();

  static final XiaomiIoConnectorConjecture _instance =
      XiaomiIoConnectorConjecture._singletonContractor();

  @override
  VendorsAndServices get vendorsAndServices => VendorsAndServices.xiaomi;

  MiCloud? miCloud;

  Future<String> accountLogin(
    GenericXiaomiMiLoginDE loginDE,
  ) async {
    miCloud = MiCloud();
    await miCloud!.login(
      loginDE.xiaomiMiAccountEmail.getOrCrash(),
      loginDE.xiaomiMiAccountPass.getOrCrash(),
    );
    // final List<dynamic> devices = await miCloud!.getDevices();
    // for (final dynamic device in devices) {
    //   print(device.name);
    //   print(device.toString());
    // }
    return '';
  }

  // Discover from miio package does not work on Linux, but it is better than
  // filtering devices by host names like we do now
  // @override
  // Future<HashMap<String, DeviceEntityBase>?> foundEntity(
  // DeviceEntityBase entity,
  // ) async {
  // if (miCloud == null) {
  // icLogger.w('Please set Xiaomi Mi credentials in the app');
  // }

  // try {
  //   if ((activeHost.address).endsWith('.1')) {
  //     // Currently we exclude discovered routers
  //     return;
  //   }
  //   // final InternetAddress internetAddress = InternetAddress('192.168.31.255');
  //   final InternetAddress internetAddress =
  //       InternetAddress(activeHost.address);
  //
  //   final Auth auth = Auth();
  //   final Api api = Api('cn'); // your country code
  //   final dynamic user = await auth.login(
  //     ,
  //     ,
  //   ); // your id or name and password
  //
  //   final dynamic data = await api.getDeviceList(
  //     user['userId'],
  //     user['ssecurity'],
  //     user['token'],
  //     'cn',
  //   ); // your two-letter codes
  //
  //   print(data);
  //
  //   final MiIOPacket miIoPacket = await MiIO.instance.hello(internetAddress);
  //   MiIO.instance.send(
  //     activeHost.internetAddress,
  //     miIoPacket,
  //     token: user["token"] as List<int>?,
  //   );
  //
  //   // await for (final tup.Tuple2<InternetAddress, MiIOPacket> miDevice
  //   //     in MiIO.instance.discover(internetAddress)) {
  //   //   logger.t('miDevice devices $miDevice');
  //   //   // MiIO.inst ance.send(address, packet);
  //   // }
  //
  //   // final InternetAddress internetAddress = InternetAddress('192.168.31.247');
  //   //
  //   // MiIOPacket miIoPacket = await MiIO.instance.hello(internetAddress);
  //   // MiIOPacket ab = await MiIO.instance.send(internetAddress, miIoPacket);
  //   // logger.t('This is mi packets $miIoPacket');
  // } on MiIOError catch (e) {
  //   logger.e(
  //     'Command failed with error from xiaomi device:\n'
  //     'code: ${e.code}\n'
  //     'message: ${e.message}',
  //   );
  // } on Exception catch (e) {
  //   logger.e('Xiaomi command failed with exception:\n$e');
  // } catch (e) {
  //   logger.t('All else');
  // }
  // return null;
  // }

  @override
  Future<void> setUpEntityFromDb(DeviceEntityBase deviceEntity) async {
    DeviceEntityBase? nonGenericDevice;

    if (deviceEntity is GenericRgbwLightDE) {
      nonGenericDevice = XiaomiIoGpx4021GlEntity.fromGeneric(deviceEntity);
    }

    if (nonGenericDevice == null) {
      icLogger.w('Xiaomi mi device could not get loaded from the server');
      return;
    }

    vendorEntities.addEntries([
      MapEntry(nonGenericDevice.entityUniqueId.getOrCrash(), nonGenericDevice),
    ]);
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> convertToVendorDevice(
    DeviceEntityBase entity,
  ) async =>
      HashMap();
}
