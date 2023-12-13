part of 'package:cbj_integrations_controller/domain/i_network_utilities.dart';

class _NetworkUtilities implements INetworkUtilities {
  @override
  Future<GenericUnsupportedDE?> deviceFromPort(
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
  Future<GenericUnsupportedDE> activeHostToEntity(
    ActiveHost activeHost,
  ) async {
    final ARPData? arpData = await activeHost.arpData;
    String? deviceName = await activeHost.deviceName;
    if (deviceName == 'Generic Device') {
      deviceName = null;
    }
    final MdnsInfo? mdns = await activeHost.mdnsInfo;
    final Vendor? vendor = await activeHost.vendor;
    final String? hostName = await activeHost.hostName;

    return GenericUnsupportedDE(
      uniqueId: CoreUniqueId(),
      entityUniqueId: EntityUniqueId(arpData?.macAddress ?? activeHost.hostId),
      cbjDeviceVendor: CbjDeviceVendor(
        VendorsAndServices.vendorsAndServicesNotSupported.name,
      ),
      cbjEntityName:
          CbjEntityName(deviceName ?? hostName ?? arpData?.hostname ?? ''),
      deviceVendor: DeviceVendor(vendor?.vendorName),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(vendor?.lastUpdate),
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
      deviceHostName: DeviceHostName(hostName),
      deviceMdns: DeviceMdns(mdns?.mdnsDomainName),
      srvResourceRecord:
          DeviceSrvResourceRecord(input: mdns?.srvResourceRecord.name),
      ptrResourceRecord:
          DevicePtrResourceRecord(input: mdns?.ptrResourceRecord.name),
      devicesMacAddress:
          DevicesMacAddress(arpData?.macAddress ?? vendor?.macPrefix),
      entityKey: EntityKey(''),
      requestTimeStamp: RequestTimeStamp(''),
      lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
      deviceCbjUniqueId: CoreUniqueId(),
    );
  }
}
