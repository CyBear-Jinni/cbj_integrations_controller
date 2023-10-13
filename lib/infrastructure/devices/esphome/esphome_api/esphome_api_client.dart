import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cbj_integrations_controller/infrastructure/devices/esphome/esphome_api/esphome_objects_as_dart_objects.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/aioesphomeapi/protoc_as_dart/aioesphomeapi/api.pbserver.dart';
import 'package:cbj_integrations_controller/utils.dart';

/// Client to interact with ESPHome device
/// TODO: All the code here need rewrite, manage to turn device on/off
/// TODO: Source: https://github.com/esphome/aioesphomeapi
class EspHomeApiClient {
  EspHomeApiClient({
    this.devicePort = 6053,
    this.devicePass,
  });

  Socket? _fSocket;
  String? devicePass;
  String? addressOfServer;
  late String deviceMdns;
  int devicePort;

  /// Responses stream from the device.
  /// Some responses come in chunks, this will help us with that.
  /// Each response will be converted to dart object and get passed away in
  /// the stream for the current listening function to decide if it part of their
  /// request and stop listening.
  /// Some request will just keep coming like ping request and button press.
  StreamController deviceResponseStream = StreamController();

  /// aioesphomeapi:
  /// fName = _connect_socket_connect
  /// Step 2 in connect process: connect the socket.
  Future<Socket> getSocket() async {
    if (_fSocket != null && _fSocket!.isBroadcast) {
      return _fSocket!;
    }
    addressOfServer ??= await getIpFromMdns('$deviceMdns.local');
    // TODO: Test if it is possible to connect to socket using the deviceMdns
    // TODO: instead of the address, suppose to be more consistent.

    return _fSocket = await Socket.connect(addressOfServer, devicePort);
  }

  Future<void> listenToResponses() async {
    final Socket socket = await getSocket();

    socket.listen(
      // handle data from the server
      (Uint8List data) {
        final int responseType = data[2];

        /// HelloRequest
        if (responseType == 1) {
          logger.t('responseType is HelloRequest');
        }

        /// HelloResponse
        else if (responseType == 2) {
          logger.t('responseType is HelloResponse');
          final HelloResponse? helloResponseData = bytesToHelloResponse(data);
          if (helloResponseData != null) {
            deviceResponseStream.add(
              EspHomeHelloResponseObject(
                apiVersionMajor: helloResponseData.apiVersionMajor,
                apiVersionMinor: helloResponseData.apiVersionMinor,
                serverInfo: helloResponseData.serverInfo,
              ),
            );
          }
          logger.t('HelloResponse data: ${helloResponseData?.serverInfo}');
          logger.t('');
        }

        /// ConnectRequest
        else if (responseType == 3) {
          logger.t('responseType is ConnectRequest');
        }

        /// ConnectResponse
        else if (responseType == 4) {
          logger.t('responseType is ConnectResponse');
          logger.t(
            'ConnectResponse data: ${utf8.decode(data.sublist(3), allowMalformed: true)}',
          );
          logger.t('Data: $data');
          if (data.length > 3) {
            logger.t('Password is wrong');
            devicePass = null;
          } else {
            logger.t('Correct password');
          }
          logger.t('');
        }

        /// DisconnectRequest
        else if (responseType == 5) {
          logger.t('responseType is DisconnectRequest');
        }

        /// DisconnectResponse
        else if (responseType == 6) {
          logger.t('responseType is DisconnectResponse');
        }

        /// PingRequest
        else if (responseType == 7) {
          logger.t('responseType is PingRequest');
          logger.t('PingRequest data: ${utf8.decode(data.sublist(3))}');
          logger.t('');
        }

        /// PingResponse
        else if (responseType == 8) {
          logger.t('responseType is PingResponse');
          logger.t('PingResponse data: ${utf8.decode(data.sublist(3))}');
          logger.t('');
        }

        /// DeviceInfoRequest
        else if (responseType == 9) {
          logger.t('responseType is DeviceInfoRequest');
        }

        /// DeviceInfoResponse
        else if (responseType == 10) {
          logger.t('responseType is DeviceInfoResponse');
          logger.t('DeviceInfoResponse data: $data');
          logger.t('');
        }

        /// ListEntitiesRequest
        else if (responseType == 11) {
          logger.t('responseType is ListEntitiesRequest');
        }

        /// ListEntitiesBinarySensorResponse
        else if (responseType == 12) {
          logger.t('responseType is ListEntitiesBinarySensorResponse');
        }

        /// ListEntitiesCoverResponse
        else if (responseType == 13) {
          logger.t('responseType is ListEntitiesCoverResponse');
        }

        /// ListEntitiesFanResponse
        else if (responseType == 14) {
          logger.t('responseType is ListEntitiesFanResponse');
        }

        /// ListEntitiesLightResponse
        else if (responseType == 15) {
          logger.t('responseType is ListEntitiesLightResponse');
        }

        /// ListEntitiesSensorResponse
        else if (responseType == 16) {
          logger.t('responseType is ListEntitiesSensorResponse');
        }

        /// ListEntitiesSwitchResponse
        else if (responseType == 17) {
          logger.t('responseType is ListEntitiesSwitchResponse');
          String dataPayload = '';

          try {
            dataPayload = data.length > 3 ? utf8.decode(data.sublist(3)) : '';

            logger.t(
              'ListEntitiesSwitchResponse data payload:'
              ' $dataPayload',
            );
          } catch (e) {
            logger.t(
              'ListEntitiesSwitchResponse data bytes:'
              ' $data',
            );
          }
          logger.t('');
        }

        /// ListEntitiesTextSensorResponse
        else if (responseType == 18) {
          logger.t('responseType is ListEntitiesTextSensorResponse');
        }

        /// dsaDoneResponse
        else if (responseType == 19) {
          logger.t('responseType is ListEntitiesDoneResponse');
          logger.t(
            'ListEntitiesDoneResponse data: ${utf8.decode(data.sublist(3))}',
          );
          logger.t('');
        }

        /// SubscribeStatesRequest
        else if (responseType == 20) {
          logger.t('responseType is SubscribeStatesRequest');
        }

        /// BinarySensorStateResponse
        else if (responseType == 21) {
          logger.t('responseType is BinarySensorStateResponse');
        }

        /// CoverStateResponse
        else if (responseType == 22) {
          logger.t('responseType is CoverStateResponse');
        }

        /// FanStateResponse
        else if (responseType == 23) {
          logger.t('responseType is FanStateResponse');
        }

        /// LightStateResponse
        else if (responseType == 24) {
          logger.t('responseType is LightStateResponse');
        }

        /// SensorStateResponse
        else if (responseType == 25) {
          logger.t('responseType is SensorStateResponse');
        }

        /// SwitchStateResponse
        else if (responseType == 26) {
          logger.t('responseType is SwitchStateResponse');
          logger.t('SwitchStateResponse data: $data}');
          logger.t('');
        }

        /// TextSensorStateResponse
        else if (responseType == 27) {
          logger.t('responseType is TextSensorStateResponse');
        }

        /// SubscribeLogsRequest
        else if (responseType == 28) {
          logger.t('responseType is SubscribeLogsRequest');
        }

        /// SubscribeLogsResponse
        else if (responseType == 29) {
          logger.t('responseType is SubscribeLogsResponse');
        }

        /// CoverCommandRequest
        else if (responseType == 30) {
          logger.t('responseType is CoverCommandRequest');
        }

        /// FanCommandRequest
        else if (responseType == 31) {
          logger.t('responseType is FanCommandRequest');
        }

        /// LightCommandRequest
        else if (responseType == 32) {
          logger.t('responseType is LightCommandRequest');
        }

        /// SwitchCommandRequest
        else if (responseType == 33) {
          logger.t('responseType is SwitchCommandRequest');
        }

        /// SubscribeHomeassistantServicesRequest
        else if (responseType == 34) {
          logger.t('responseType is SubscribeHomeassistantServicesRequest');
        }

        /// HomeassistantServiceResponse
        else if (responseType == 35) {
          logger.t('responseType is HomeassistantServiceResponse');
        }

        /// GetTimeRequest
        else if (responseType == 36) {
          logger.t('responseType is GetTimeRequest');
        }

        /// GetTimeResponse
        else if (responseType == 37) {
          logger.t('responseType is GetTimeResponse');
        }

        /// SubscribeHomeAssistantStatesRequest
        else if (responseType == 38) {
          logger.t('responseType is SubscribeHomeAssistantStatesRequest');
        }

        /// SubscribeHomeAssistantStateResponse
        else if (responseType == 39) {
          logger.t('responseType is SubscribeHomeAssistantStateResponse');
        }

        /// HomeAssistantStateResponse
        else if (responseType == 40) {
          logger.t('responseType is HomeAssistantStateResponse');
        }

        /// ListEntitiesServicesResponse
        else if (responseType == 41) {
          logger.t('responseType is ListEntitiesServicesResponse');
        }

        /// ExecuteServiceRequest
        else if (responseType == 42) {
          logger.t('responseType is ExecuteServiceRequest');
        }

        /// ListEntitiesCameraResponse
        else if (responseType == 43) {
          logger.t('responseType is ListEntitiesCameraResponse');
        }

        /// CameraImageResponse
        else if (responseType == 44) {
          logger.t('responseType is CameraImageResponse');
        }

        /// CameraImageRequest
        else if (responseType == 45) {
          logger.t('responseType is CameraImageRequest');
        }

        /// ListEntitiesClimateResponse
        else if (responseType == 46) {
          logger.t('responseType is ListEntitiesClimateResponse');
        }

        /// ClimateStateResponse
        else if (responseType == 47) {
          logger.t('responseType is ClimateStateResponse');
        }

        /// ClimateCommandRequest
        else if (responseType == 48) {
          logger.t('responseType is ClimateCommandRequest');
        }

        /// ListEntitiesNumberResponse
        else if (responseType == 49) {
          logger.t('responseType is ListEntitiesNumberResponse');
        }

        /// NumberStateResponse
        else if (responseType == 50) {
          logger.t('responseType is NumberStateResponse');
        }

        /// NumberCommandRequest
        else if (responseType == 51) {
          logger.t('responseType is NumberCommandRequest');
        }

        /// ListEntitiesSelectResponse
        else if (responseType == 52) {
          logger.t('responseType is ListEntitiesSelectResponse');
        }

        /// SelectStateResponse
        else if (responseType == 53) {
          logger.t('responseType is SelectStateResponse');
        }

        /// SelectCommandRequest
        else if (responseType == 54) {
          logger.t('responseType is SelectCommandRequest');
        } else {
          logger.t('responseType is else');
          logger.t('Listen to data $data');
          logger.t('');
        }
      },

      // handle errors
      onError: (error) {
        logger.e(error);
        socket.destroy();
      },

      // handle server ending connection
      onDone: () {
        logger.t('Server left.');
        socket.destroy();
      },
    );
  }

  Future<void> sendConnect() async {
    final Socket socket = await getSocket();

    await _helloRequestToEsp();

    final ConnectRequest connectRequest =
        ConnectRequest(password: '\n\n$devicePass');

    const int numOfByteBeforeData = 3;

    final List<int> list = utf8.encode(connectRequest.password);

    final int totalSizeToTransfer = numOfByteBeforeData + list.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, list.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 3);

//  * The message object encoded as a ProtoBuf message

    for (int i = numOfByteBeforeData;
        i < list.length + numOfByteBeforeData;
        i++) {
      byteData.setUint8(i, list[i - numOfByteBeforeData]);
    }

    socket.add(message);
  }

  Future<void> disconnect() async {
    await (await getSocket()).close();
  }

  /// aioesphomeapi:
  /// fName = _connect_hello
  /// Step 4 in connect process: send hello and get api version.
  Future<void> _helloRequestToEsp() async {
    // connect to the socket server
    final Socket socket = await getSocket();

    const String clientName = 'aioesphomeapi';

    final HelloRequest helloRequest =
        HelloRequest(clientInfo: '\n\r$clientName');

    const int numOfByteBeforeData = 3;

    final List<int> clientInfoAsIntList = utf8.encode(helloRequest.clientInfo);

    final int totalSizeToTransfer =
        numOfByteBeforeData + clientInfoAsIntList.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, clientInfoAsIntList.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 1);

//  * The message object encoded as a ProtoBuf message

    for (int i = numOfByteBeforeData;
        i < clientInfoAsIntList.length + numOfByteBeforeData;
        i++) {
      byteData.setUint8(i, clientInfoAsIntList[i - numOfByteBeforeData]);
    }

    socket.add(message);
  }

  Future<void> connectRequestToEsp() async {
    // connect to the socket server
    final socket = await getSocket();

    final ConnectRequest connectRequest = ConnectRequest(password: devicePass);

    final List<int> passwordAsIntList = utf8.encode(connectRequest.password);

    const int numOfBytesBeforeData = 3;

    // final List<int> list = utf8.encode(helloRequest.password);

    final int totalSizeToTransfer =
        numOfBytesBeforeData + passwordAsIntList.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, connectRequest.password.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 3);

//  * The message object encoded as a ProtoBuf message
//
    for (int i = numOfBytesBeforeData;
        i < connectRequest.password.length + numOfBytesBeforeData;
        i++) {
      byteData.setUint8(i, passwordAsIntList[i - numOfBytesBeforeData]);
    }

    socket.add(message);
  }

  /// aioesphomeapi:
  /// fName = _connect_start_ping
  /// Step 5 in connect process: start the ping loop.
  Future<void> ping() async {
    // connect to the socket server
    final socket = await getSocket();
    logger.t(
      'Connected request to: '
      '${socket.remoteAddress.address}:${socket.remotePort}',
    );

    PingRequest();

    const int numOfByteBeforeData = 3;

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 7);

//  * The message object encoded as a ProtoBuf message

    socket.add(message);
  }

  Future<void> deviceInfoRequestToEsp() async {
    // connect to the socket server
    final socket = await getSocket();
    logger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    DeviceInfoRequest();

    const int numOfByteBeforeData = 3;

    // final List<int> list = utf8.encode(helloRequest.toString());

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 9);

    socket.add(message);
  }

  Future<void> subscribeStatesRequest() async {
    // connect to the socket server
    final socket = await getSocket();
    logger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    SubscribeStatesRequest();

    const int numOfByteBeforeData = 3;

    // final List<int> list = utf8.encode(helloRequest.toString());

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// First, a message in this protocol has a specific format:

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 20);

    socket.add(message);
  }

  Future<void> switchCommandRequest(int deviceKey, bool changeTostate) async {
    if (devicePass == null) {
      logger.t('Please call sendConnect, password is missing');
      return;
    }
    // connect to the socket server
    final socket = await getSocket();
    logger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    final SwitchCommandRequest switchCommandRequest =
        SwitchCommandRequest(key: deviceKey, state: changeTostate);

    final String myHexKey =
        switchCommandRequest.key.toRadixString(16).padLeft(4, '0');

    List<int> myHexKeyList = [];

    for (int i = 0; i < myHexKey.length; i += 2) {
      myHexKeyList.add(int.parse('0x${myHexKey.substring(i, i + 2)}'));
    }

    myHexKeyList = List.from(myHexKeyList.reversed);
    myHexKeyList.insert(0, 13);

    if (changeTostate == true) {
      myHexKeyList.add(16);
      myHexKeyList.add(1);
    }

    const int numOfByteBeforeData = 3;

    final int totalSizeToTransfer = numOfByteBeforeData + myHexKeyList.length;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    logger.t(myHexKeyList);

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, myHexKeyList.length);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 33);

    for (int a = numOfByteBeforeData;
        a < myHexKeyList.length + numOfByteBeforeData;
        a++) {
      byteData.setUint8(a, myHexKeyList[a - numOfByteBeforeData]);
    }

    logger.t('switchCommandRequest message: $message');

//  * The message object encoded as a ProtoBuf message
    socket.add(message);
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  Future<void> listEntitiesRequest() async {
    if (devicePass == null) {
      logger.t('Please call sendConnect, password is missing');
      return;
    }
    // connect to the socket server
    final socket = await getSocket();
    logger.t(
      'Connected request to:'
      ' ${socket.remoteAddress.address}:${socket.remotePort}',
    );

    ListEntitiesRequest();

    const int numOfByteBeforeData = 3;

    const int totalSizeToTransfer = numOfByteBeforeData;

    final Uint8List message = Uint8List(totalSizeToTransfer);

    final ByteData byteData = ByteData.view(message.buffer);

    /// A zero byte.
    byteData.setUint8(0, 0x00);

    /// VarInt denoting the size of the message object.
    /// (type is not part of this)
    byteData.setUint8(1, 0);

    ///  * VarInt denoting the type of message.
    byteData.setUint8(2, 11);

    logger.t('ListEntitiesRequest message: $message');

//  * The message object encoded as a ProtoBuf message
    socket.add(message);
  }

  static HelloResponse? bytesToHelloResponse(List<int> bytes) {
    // Check if request is hello response
    if (bytes[2] != 2) {
      return null;
    }

    final HelloResponse helloResponse = HelloResponse();

    final List<int> responseBytes = bytes.sublist(3);
    helloResponse.serverInfo = utf8.decode(responseBytes);

    return helloResponse;
  }

  /// aioesphomeapi:
  /// fName = _connect_init_frame_helper
  /// Step 3 in connect process: initialize the frame helper and init read loop.
  Future<void> connectInitFrameHelper() async {
    await getSocket();

    await listenToResponses();
  }

  /// Gets mDNS name and return the IP of that device
  /// aioesphomeapi:
  /// fName = _connect_resolve_host
  /// Step 1 in connect process: resolve the address.
  static Future<String?> getIpFromMdns(String deviceMdnsName) async {
    try {
      final List<InternetAddress> deviceIpList =
          await InternetAddress.lookup(deviceMdnsName);
      if (deviceIpList.isNotEmpty) {
        return deviceIpList[0].address;
      }
    } catch (e) {
      logger.e(
        'Crash when searching the IP for device with mDNS\n$e',
      );
    }

    return null;
  }
}
