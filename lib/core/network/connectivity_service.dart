
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService {
  Connectivity connectivity = Connectivity();
  Future<bool> hasInternetConnection() async {
    try {
      var res = await connectivity.checkConnectivity();
      if (res.contains(ConnectivityResult.none)) {
        // showSnackBarMessage('Check your internet connection');
        return false;
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return true;
    }
  }
}
