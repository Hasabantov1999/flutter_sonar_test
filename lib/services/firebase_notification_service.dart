import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:tripy_ev_stable/services/locale_notification_service.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

class FirebaseNotificationService implements BaseService {
  late final FirebaseMessaging messaging;

  String? fcmToken;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> init() async {
    await FirebaseMessaging.instance.requestPermission();
    messaging = FirebaseMessaging.instance;

    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    LocaleNotification().get.flutterLocalNotificationsPlugin =
        flutterLocalNotificationsPlugin;
    LocaleNotification().get.init();
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {},
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        if (message.notification != null) {
          DeveloperLog.instance.logSuccess(message.notification!.toMap());
          if (Platform.isAndroid) {
            LocaleNotification().get.showBigTextNotification(
                  title: message.notification?.title ?? '',
                  body: message.notification?.body ?? '',
                  fln: flutterLocalNotificationsPlugin,
                  payload: message.data,
                );
          }
        }
      },
    );

    fcmToken = await messaging.getToken() ?? '';

    log("Token: $fcmToken", name: "FCM Token");
  }
}
