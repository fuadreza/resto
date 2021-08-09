import 'package:shared_preferences/shared_preferences.dart';

final sp = SharedPrefUtil.instance;

class SharedPrefUtil {
  static const String notificationPrefs = 'notification';

  static final SharedPrefUtil _instance = SharedPrefUtil();

  static SharedPrefUtil get instance => _instance;

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setNotificationState(bool value) async {
    prefs.setBool(notificationPrefs, value);
  }

  bool getNotificationState() {
    return prefs.getBool(notificationPrefs) ?? false;
  }
}
