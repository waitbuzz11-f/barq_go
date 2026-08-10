import 'dart:convert';
import 'dart:async';
import 'constants.dart';
import 'shared_pref_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';

class NotificationHandler {
  static final NotificationHandler _instance = NotificationHandler._internal();

  factory NotificationHandler() => _instance;

  NotificationHandler._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  /// Initialize both FCM and Local Notifications
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    await _runSafely(_requestPermissions);
    await _runSafely(_initializeLocalNotifications);
    _listenToForegroundMessages();
    _handleBackgroundMessages();
    await _runSafely(_handleNotificationTaps);
    await _runSafely(getToken);
  }

  Future<void> _runSafely(Future<void> Function() action) async {
    try {
      await action();
    } catch (_) {
      if (kDebugMode) {
        debugPrint('A notification setup step could not be completed.');
      }
    }
  }

  Future<void> _requestPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        debugPrint('Notification permission granted.');
      }
    } else {
      if (kDebugMode) {
        debugPrint('Notification permission not granted.');
      }
    }
  }

  /// Get the FCM Token for sending push notifications
  Future<void> getToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      if (token == null || token.isEmpty) return;
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.fcmDeviceToken,
        token,
      );
    } catch (_) {
      if (kDebugMode) {
        debugPrint('FCM token is currently unavailable.');
      }
    }
  }

  /// Initialize local notifications
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings darwinSettings =
        DarwinInitializationSettings();

    final InitializationSettings settings = const InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
    );

    await _localNotificationsPlugin.initialize(
      onDidReceiveNotificationResponse: _onNotificationTapped,
      settings: settings,
    );
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    if (response.payload != null) {
      try {
        final data = json.decode(response.payload!);
        if (data is Map<String, dynamic>) {
          _handleNotificationData(data);
        }
      } on FormatException {
        if (kDebugMode) {
          debugPrint('Notification payload could not be decoded.');
        }
      }
    }
  }

  /// Show a local notification with payload
  Future<void> showLocalNotification(
    String title,
    String body,
    Map<String, dynamic> data,
  ) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _localNotificationsPlugin.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: details,
      payload: json.encode(data),
    );
  }

  /// Handle FCM messages when the app is in the foreground
  void _listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        debugPrint('Notification received in foreground.');
      }

      unawaited(
        showLocalNotification(
          message.notification?.title ?? "New Notification",
          message.notification?.body ?? "You have a new message.",
          message.data,
        ).catchError((_) {}),
      );

      // Handle the data
      _handleNotificationData(message.data);
    });
  }

  /// Handle background and terminated state messages
  void _handleBackgroundMessages() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        debugPrint('Notification opened from background.');
      }
      _handleNotificationData(message.data);
    });
  }

  /// Handle notification taps when app was terminated
  Future<void> _handleNotificationTaps() async {
    RemoteMessage? initialMessage = await _firebaseMessaging
        .getInitialMessage();

    if (initialMessage != null) {
      if (kDebugMode) {
        debugPrint('Notification opened from terminated state.');
      }
      _handleNotificationData(initialMessage.data);
    }
  }

  /// Process notification data
  void _handleNotificationData(Map<String, dynamic> data) {
    if (kDebugMode) {
      debugPrint(
        'Notification payload navigation is unsupported; no route was opened.',
      );
    }
  }

  /// Background message handler (must be a top-level function)
  static Future<void> backgroundMessageHandler(RemoteMessage message) async {
    if (kDebugMode) {
      debugPrint('Notification received in background.');
    }
  }
}
