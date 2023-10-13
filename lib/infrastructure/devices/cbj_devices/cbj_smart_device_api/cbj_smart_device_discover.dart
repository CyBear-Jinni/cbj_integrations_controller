// import 'dart:io';
//
// import 'package:cbj_integrations_controller/infrastructure/devices/cbjDevices/cbjDevices_api/cbjDevices_api_object.dart';
// import 'package:cbj_integrations_controller/utils.dart';
//
// class CbjDevicesDiscover {
//   static const cbjDevicesUdpPort = 20002;
//   static const cbjDevicesUdpPort2 = 20003;
//
//   static Stream<CbjDevicesApiObject> discover20002Devices() async* {
//     try {
//       final RawDatagramSocket socket20002 = await RawDatagramSocket.bind(
//         InternetAddress.anyIPv4,
//         cbjDevicesUdpPort  ,
//       );
//
//       await for (final event in socket20002) {
//         final Datagram? datagram = socket20002.receive();
//         if (datagram == null) continue;
//         final CbjDevicesApiObject cbjDevicesApiObject =
//             CbjDevicesApiObject.createWithBytes(datagram);
//
//         yield cbjDevicesApiObject;
//       }
//     } catch (e) {
//       logger.e('CbjDevices discover devices got and exception: $e');
//     }
//   }
//
//   /// Blinds 20003 includes blinds for example
//   static Stream<CbjDevicesApiObject> discover20003Devices() async* {
//     try {
//       final RawDatagramSocket socket20003 = await RawDatagramSocket.bind(
//         InternetAddress.anyIPv4,
//         cbjDevicesUdpPort2,
//       );
//
//       await for (final event in socket20003) {
//         final Datagram? datagram = socket20003.receive();
//         if (datagram == null) continue;
//         final CbjDevicesApiObject cbjDevicesApiObject =
//             CbjDevicesApiObject.createWithBytes(datagram);
//
//         yield cbjDevicesApiObject;
//       }
//     } catch (e) {
//       logger.e('CbjDevices discover devices got and exception: $e');
//     }
//   }
// }
