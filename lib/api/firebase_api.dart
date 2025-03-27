import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pushnotification/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifiactions() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token: $fCMToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      "/notification_screen",
      arguments: message,
    );
  }

  Future initPushNotifications() async {
    //Handle app when app is open from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // Handle app when app is opened from a background state
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Handles app when app receives a notification on foreground
    FirebaseMessaging.onMessage.listen((message) {
      print("foreground message received ${message.notification?.title}");
    });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print("Background message received: ${message.messageId}");
  }
}
