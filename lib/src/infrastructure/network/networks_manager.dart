import 'dart:collection';

import 'package:cbj_integrations_controller/src/infrastructure/network/network_object.dart';

class NetworksManager {
  final HashMap<String, NetworkObject> _networks = HashMap();
  NetworkObject? currentNetwork;

  void addNetwork(NetworkObject network) {
    if (!_networks.containsKey(network.uniqueId)) {
      _networks.addEntries([MapEntry(network.uniqueId, network)]);
    }
  }

  void setCurrentNetwork(String uniqueId) {
    currentNetwork = _networks[uniqueId];
  }
}
