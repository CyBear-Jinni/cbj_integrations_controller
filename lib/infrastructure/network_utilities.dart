part of 'package:cbj_integrations_controller/domain/i_network_utilities.dart';

class _NetworkUtilities implements INetworkUtilities {
  @override
  Future<GenericGenericUnsupportedDE?> deviceFromPort(
    String address,
    int port,
  ) async {
    final ActiveHost? activeHost = await PortScanner.connectToPort(
      address: address,
      port: port,
      // TODO: maybe value can be lower
      timeout: const Duration(milliseconds: 2000),
      activeHostsController: StreamController<ActiveHost>(),
    );
    if (activeHost == null) {
      return null;
    }
    return activeHostToEntity(activeHost);
  }

  @override
  Future<GenericGenericUnsupportedDE> activeHostToEntity(
    ActiveHost activeHost,
  ) async {
    final ARPData? arpData = await activeHost.arpData;
    final String deviceName = await activeHost.deviceName;
    final MdnsInfo? mdns = await activeHost.mdnsInfo;

    return GenericGenericUnsupportedDE(
      uniqueId: CoreUniqueId(),
      entityUniqueId: EntityUniqueId(arpData?.macAddress ?? activeHost.hostId),
      deviceVendor:
          DeviceVendor(VendorsAndServices.vendorsAndServicesNotSupported.name),
      cbjEntityName: CbjEntityName(await activeHost.deviceName),
      stateMassage: DeviceStateMassage(''),
      senderDeviceOs: DeviceSenderDeviceOs(''),
      senderDeviceModel: DeviceSenderDeviceModel(''),
      senderId: DeviceSenderId(),
      compUuid: DeviceCompUuid(''),
      entityStateGRPC: EntityState(''),
      entityOriginalName: EntityOriginalName(''),
      deviceOriginalName: DeviceOriginalName(deviceName),
      powerConsumption: DevicePowerConsumption(''),
      deviceUniqueId: DeviceUniqueId(arpData?.macAddress ?? activeHost.hostId),
      devicePort: DevicePort(activeHost.openPorts.toString()),
      deviceLastKnownIp: DeviceLastKnownIp(activeHost.address),
      deviceHostName: DeviceHostName(deviceName),
      deviceMdns: DeviceMdns(mdns?.mdnsDomainName),
      srvResourceRecord:
          DeviceSrvResourceRecord(input: mdns?.srvResourceRecord.name),
      ptrResourceRecord:
          DevicePtrResourceRecord(input: mdns?.ptrResourceRecord.name),
      devicesMacAddress: DevicesMacAddress(arpData?.macAddress),
      entityKey: EntityKey(''),
      requestTimeStamp: RequestTimeStamp(''),
      lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
      deviceCbjUniqueId: CoreUniqueId(),
    );
  }
}
