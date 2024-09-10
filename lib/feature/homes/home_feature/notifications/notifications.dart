import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';

class LocalNotification {
  // setup
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static action(NotificationResponse notificationResponse) {}

  static Future init(BuildContext context) async {
    // Initialization settings for Android and iOS
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // Initializing the FlutterLocalNotificationsPlugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap here
        String? payload = response.payload;
        if (payload != null && payload.isNotEmpty) {
          // Navigate to the desired screen based on the payload
          Navigator.pushNamed(context, payload);
        }
      },
      onDidReceiveBackgroundNotificationResponse: action,
    );
  }

  static void basicNotification(
      String title, String body, String payload) async {
    // Notification details for Android
    final int notificationId = Random().nextInt(100000);
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'Basic notification',
        priority: Priority.high,
        importance: Importance.high,
      ),
    );

    // Displaying the notification
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
