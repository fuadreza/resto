
import 'dart:io';

final connectivity = ConnectivityUtil.instance;

class ConnectivityUtil {
  static final ConnectivityUtil _instance = ConnectivityUtil();

  static ConnectivityUtil get instance => _instance;

  var isConnected = false;

  Future<void> init() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
  }
}