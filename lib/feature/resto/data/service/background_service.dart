import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:resto/feature/resto/data/service/notification/notification_helper.dart';

import '../../../../core/utils/random_util.dart';
import '../response/local/restaurant/local_restaurant_dto.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final localJson = json.decode(await rootBundle.loadString('assets/local_restaurant.json'));
    final dto = LocalRestaurantDto.fromJson(localJson);
    final length = dto.restaurants.length;

    final restaurant = dto.restaurants[getRandom(length)];

    await notificationHelper.showNotification(flutterLocalNotificationsPlugin, restaurant);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
