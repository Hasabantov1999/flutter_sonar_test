import 'dart:async';
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/services/base_service.dart';

extension LocaleNotificationExtension on LocaleNotification {
  LocaleNotification get get => Inject<LocaleNotification>().get;
}

class LocaleNotification implements BaseService {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  Future<void> init() async {
    const androidInitialize =
        AndroidInitializationSettings('mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iosSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  Future<void> showBigTextNotification({
    int id = 0,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const darwinNotificationDetails = DarwinNotificationDetails();
    const not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: darwinNotificationDetails,
    );

    await fln.show(
      0,
      title,
      body,
      not,
      payload: json.encode(payload),
    );
  }

  Future<void> onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final payload = notificationResponse.payload;
    if (payload != null) {}
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class PayloadModel {
  PayloadModel({this.action, this.id});

  factory PayloadModel.fromJson(Map<String, dynamic> json) => PayloadModel(
        id: json['id'] as int,
        action: json['action'] as String,
      );

  final String? action;
  final int? id;
}
