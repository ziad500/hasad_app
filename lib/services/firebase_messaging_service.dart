import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hasad_app/main.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import 'local_notifications_service.dart';

/// Service class to handle Firebase Cloud Messaging (FCM) functionality.
class FirebaseMessagingService {
  static FirebaseMessaging? fcm;

  // Function to get the initial message
  static Future<RemoteMessage?> getInitialMessage() async {
    return await fcm?.getInitialMessage().then((message) async {
      RemoteNotification? notification = message?.notification;
      if (notification != null && message?.data != null) {
        await navigatorKey.currentState!.pushNamed(Routes.notificationsScreen);
      }
      return message;
    });
  }

  // Background message handler
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // Handle messages when the app is in the background

    RemoteNotification? notification = message.notification;
    if (notification != null) {
      // Handle the notification when the app is in the background
      // await navigatorKey.currentState!.pushNamed(Routes.notificationsScreen);
    }
  }

  // Initialize Firebase Messaging
  static init() async {
    fcm = FirebaseMessaging.instance;
    getInitialMessage();
    await fcm?.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle messages when the app is open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // Handle messages when the app is open

      RemoteNotification? notification = message.notification;

      if (notification != null) {
        // Handle the notification when the app is open
        handleNotification(notification, message);
      }
    });

    // Handle messages when the app is opened from a terminated state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // Handle the case when the app was not terminated but in the background

      RemoteNotification? notification = message.notification;
      if (notification != null) {
        await navigatorKey.currentState!.pushNamed(Routes.notificationsScreen);
      }
    });

    // Set the background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  // Get the FCM token
  static Future<String?>? getToken() async {
    return await fcm?.getToken();
  }

  // Handle incoming notification
  static handleNotification(RemoteNotification notification, RemoteMessage message) {
    LocalNotificationsService.showNotification(1,
        title: notification.title, body: notification.body, payload: jsonEncode(message.data));
  }
}
