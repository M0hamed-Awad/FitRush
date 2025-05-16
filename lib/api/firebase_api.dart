import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fit_rush_app/services/notifications_service.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  // Getting a NotificationService instance to run the Locale Notifications
  final NotificationsService _notificationsService;
  // DI
  FirebaseApi(this._notificationsService);

  // Create an Instance of Firebase Messaging
  // This will be capable of:
  //  Request permissions,
  //  Get device’s token,
  //  and Listen to notifications
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Function to Initialize the Notifications
  Future<void> initializeNotifications() async {
    // Request Permission to send notifications to the user
    await _firebaseMessaging.requestPermission();

    // Fetch the FCM token for the Device
    // A unique key that Firebase uses to identify the Device.
    final fcmToken = await _firebaseMessaging.getToken();

    // Print the Token (Normally you would send this to your server)
    debugPrint("[DEBUG] Token: $fcmToken");

    // initialize further settings for push notification
    initializePushNotifications();
  }

  // Function to Handle received Notifications
  // This function runs WHEN a user taps a notification, and the app opens.
  void handleMessage(RemoteMessage? message) {
    // if the Message is NULL, Do Nothing.
    if (message == null) return;

    // Do something (Navigation) when message is Received and User Taps Notification
    debugPrint("[DEBUG] Notification Tapped (Do Something Here)");
  }

  // Function to Initialize Foreground & Background Settings
  // This function sets up the behavior for when the user interacts with a Notification.
  Future initializePushNotifications() async {
    // Case 1: App was Terminated (fully closed) and the user tapped a Notification.
    // It checks if the app was opened via a Push Notification.
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // Case 2: App was in Background, and the user tapped a Notification:
    // Attach Event Listeners for when a Notification Opens the App
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Case 3: App in the Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      // if the Notification Message is NULL, Do Nothing.
      if (notification == null) return;

      // Show Notification with the right Data.
      _notificationsService.showNotification(
        title: notification.title,
        body: notification.body,
      );
    });
  }
}
