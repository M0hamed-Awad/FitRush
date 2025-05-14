import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Initialization
  Future<void> initializeLocalNotifications() async {
    // Prevent Re-Initialization
    if (_isInitialized) return;

    // Prepare Android Initialization Settings
    const androidInitializationSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher', // Default App Icon
    );

    // Prepare IOS Initialization Settings
    const iosInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    // Initialization Settings
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettings,
        );

    // Initialize the Plugin
    await notificationsPlugin.initialize(initializationSettings);
  }

  // Notifications Detail Set Up
  NotificationDetails notificationDetails() {
    // Android Notification Details
    const androidNotificationDetails = AndroidNotificationDetails(
      'daily_channel_id',
      'Daily Channel',
      channelDescription: 'This is the Daily channel for notifications.',
      importance: Importance.max,
      priority: Priority.high,
    );

    // IOS Notification Details
    const iosNotificationDetails = DarwinNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  // Show Notification
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    notificationsPlugin.show(id, title, body, notificationDetails());
  }

  // On Notification Tap
  // TODO
}
