// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../core/di.dart';
import '../main.dart';
import '../utils/routes_manager.dart';

class LocalNotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final notifications = FlutterLocalNotificationsPlugin();

  // Initialize the local notifications service
  static Future init() async {
    tz.initializeTimeZones();

    var initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings('mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
          defaultPresentAlert: false,
          defaultPresentBadge: false,
          defaultPresentSound: false,
          onDidReceiveLocalNotification: onDidReceiveLocalNotification),
    );
    notifications.initialize(initializationSettings);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        // ...
        onSelectNotification(notificationResponse.payload);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static void notificationTapBackground(NotificationResponse notificationResponse) {
    // Handle action when notification is tapped in the background
  }

  // Handle the action when a notification is selected
  static Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      /*  initNotifications();
      var data = jsonDecode(payload);

      if (data.isEmpty) {
        HomeCubit.get(navigatorKey.currentContext)
            .getStatistics(staticticsType(), StatisticsRequest(null));

        await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);
      } else {
        HomeCubit.get(navigatorKey.currentContext)
            .getStatistics(staticticsType(), StatisticsRequest(null));

        handleResponse(FirebaseNotificationModel.fromJson(data), notificationsModel: null);
      } */
    }
  }

  // Request iOS permissions for notifications
  static Future<void> requestIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // Cancel a specific notification by ID
  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // Show a notification with given ID, title, body, and payload
  static void showNotification(int id, {String? title, String? body, String? payload}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'SSS_notification', // channel id
      'SSS Notification', // channel name
      importance: Importance.max,
      priority: Priority.high,
      enableLights: true,
      fullScreenIntent: true,
      icon: 'mipmap/ic_launcher',
      ticker: 'ticker',
      autoCancel: false,
      playSound: true,
      enableVibration: true,
    );

    var iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails(threadIdentifier: 'thread_id');

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await notifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  // Schedule a daily notification
  static Future<void> scheduleDailyNotification(int notificationId, String title, String body,
      DateTime endDate, DateTimeComponents? dateTimeComponents) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'SSS_notification', // channel id
      'SSS Notification', // channel name
      importance: Importance.high,
      priority: Priority.high,
      enableLights: true,
      fullScreenIntent: true,
      styleInformation: BigTextStyleInformation(''),
      timeoutAfter: 10,
      autoCancel: false,
      playSound: true,
      enableVibration: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(notificationId, title, body,
        tz.TZDateTime.from(endDate, tz.local), platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "Hello");
  }

  // Handle local notification received
  static Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    if (payload != null) {
      /*  initNotifications();
      var data = jsonDecode(payload);
      if (data.isEmpty) {
        HomeCubit.get(navigatorKey.currentContext)
            .getStatistics(staticticsType(), StatisticsRequest(null));

        await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);
      } else {
        HomeCubit.get(navigatorKey.currentContext)
            .getStatistics(staticticsType(), StatisticsRequest(null));

        handleResponse(FirebaseNotificationModel.fromJson(data), notificationsModel: null);
      } */
    }
  }
/* 
  // Handle a notification response
  static handleResponse(FirebaseNotificationModel? data,
      {NotificationsModel? notificationsModel, bool fromApp = false}) async {
    if (notificationsModel != null) {
      if (Constants.isSupport) {
        handleOpendAppAdminNavigate(notificationsModel, fromApp);
      } else {
        handleOpendAppUserNavigate(notificationsModel, fromApp);
      }
    } else {
      // Closed app
      if (Constants.isSupport) {
        handleClosedAppAdminNavigate(data!);
      } else {
        handleClosedAppUserNavigate(data!);
      }
    }
  }

  // Handle navigation when the app is open
  static void handleOpendAppUserNavigate(
      NotificationsModel notificationsModel, bool fromApp) async {
    if (notificationsModel.contentType == "Ticket") {
      await navigatorKey.currentState?.pushNamed(Routes.ticketDetails, arguments: {
        "ticketId": notificationsModel.notificationTypeId,
        "from": 0,
        "notification": true
      });
    } else {
      await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);

      if (!fromApp) {
        await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);
      }
    }
  }

  // Handle navigation when the app is open for admin
  static void handleOpendAppAdminNavigate(
      NotificationsModel notificationsModel, bool fromApp) async {
    if (notificationsModel.contentType == "Ticket") {
      await navigatorKey.currentState?.pushNamed(Routes.ticketDetails, arguments: {
        "ticketId": notificationsModel.notificationTypeId,
        "from": 0,
        "notification": true
      });
    } else {
      await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);

      if (!fromApp) {
        await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);
      }
    }
  }

  // Handle navigation when the app is closed for user
  static void handleClosedAppUserNavigate(FirebaseNotificationModel data) async {
    if (data.notificationType == "Ticket" || data.notificationType == "tickets") {
      await navigatorKey.currentState?.pushNamed(Routes.ticketDetails,
          arguments: {"ticketId": data.notificationTypeId, "from": 0, "notification": true});
    } else {
      await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);
    }
  }

  // Handle navigation when the app is closed for admin
  static void handleClosedAppAdminNavigate(FirebaseNotificationModel data) async {
    if (data.notificationType == "Ticket" || data.notificationType == "tickets") {
      await navigatorKey.currentState?.pushNamed(Routes.ticketDetails,
          arguments: {"ticketId": data.notificationTypeId, "from": 0, "notification": true});
    } else {
      await navigatorKey.currentState?.pushReplacementNamed(Routes.homeRoutes);
    }
  }
 */
}
