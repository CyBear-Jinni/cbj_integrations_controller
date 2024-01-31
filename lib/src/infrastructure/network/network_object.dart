class NetworkObject {
  NetworkObject({
    required this.ssid,
    required this.bssid,
    required this.subNet,
    required this.longitude,
    required this.latitude,
    required this.type,
    required this.remotePipe,
  }) {
    uniqueId = bssid;
    boxesFirstName = uniqueId;
  }

  late String uniqueId;

  /// Network name
  String ssid;

  /// Uniqe identifyer
  String bssid;
  String subNet;
  double? longitude;
  double? latitude;

  /// IPv4 or IPv6
  String? type;
  String? remotePipe;
  late String boxesFirstName;
}
