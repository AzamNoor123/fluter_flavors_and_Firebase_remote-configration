import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_6_flutter_flavours/helper/constantResources.dart';

class FcmServices {
  static GenerateToken() {
    try {
      FirebaseMessaging.instance.getToken().then((value) {});
    } catch (e) {
      log(e.toString());
    }
  }

  static listenAppFcm() {
    FirebaseMessaging.onMessage.listen((event) {
      log(ConstantResources.FORGROUND_FCM);
      log(event.notification?.title ?? '');
      log(event.notification?.body ?? '');
      displyNotification(
          title: event.notification?.title ?? '',
          body: event.notification?.body ?? '');
    });
  }

  static listenBackgroundFcm(RemoteMessage message) {
    log(ConstantResources.BACKGROUND_FCM);

    String title = message.notification?.title ?? ''.toString();
    log(message.notification?.title ?? '');
    log(message.notification?.body ?? '');
    displyNotification(
        title: title, body: message.notification!.body.toString());
  }

  static displyNotification(
      {required String title, required String body}) async {
    log(ConstantResources.STARIK_LOG);

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ));

    flutterLocalNotificationsPlugin.show(
      1,
      title,
      body,
      const NotificationDetails(
          android: AndroidNotificationDetails(
        'test',
        "test",
        playSound: true,
        priority: Priority.high,
        importance: Importance.high,
        enableVibration: true,
      )),
    );
  }
}
