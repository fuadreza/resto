import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:resto/core/route/navigation_service.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

final notificationHelper = NotificationHelper();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  ) async {
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          print('notification payload: ' + payload);
        }
        selectNotificationSubject.add(payload ?? 'empty payload');
      },
    );
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    Restaurant restaurant,
  ) async {
    final _channelId = "1";
    final _channelName = "channel_01";
    final _channelDescription = "resto channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: DefaultStyleInformation(true, true),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    var titleNotification = '<b>${restaurant.name}</b>';
    var subtitle = 'Recommended restaurant for you';

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      subtitle,
      platformChannelSpecifics,
      payload: restaurant.id,
    );
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        var restaurantId = payload;
        NavigationService.navigateTo(route, arguments: restaurantId);
      },
    );
  }
}
