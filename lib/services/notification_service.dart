import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  Future<void> init() async {
    try {
      tz.initializeTimeZones();

      const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
      const windowsSettings = WindowsInitializationSettings(
        appName: 'MyFlutterApp',
        appUserModelId: 'com.example.myapp',
        guid: '08c330c6-bbb9-4595-bf62-d628ff29c37a',
      );

      const initSettings = InitializationSettings(
        android: androidSettings,
        windows: windowsSettings,
      );

      await _plugin.initialize(initSettings);
    } catch (e) {
      print('[Error][NotificationService.init] $e');
    }
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'default_channel',
        'Default Notifications',
        channelDescription: 'Basic notifications',
        importance: Importance.max,
        priority: Priority.high,
      );

      const windowsDetails = WindowsNotificationDetails();

      const details = NotificationDetails(android: androidDetails, windows: windowsDetails);

      await _plugin.show(id, title, body, details, payload: payload);
    } catch (e) {
      print('[Error][showNotification] $e');
    }
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
    DateTimeComponents? matchDateTimeComponents,
  }) async {
    try {
      final tzTime = tz.TZDateTime.from(scheduledTime, tz.local);

      const androidDetails = AndroidNotificationDetails(
        'scheduled_channel',
        'Scheduled Notifications',
        channelDescription: 'Scheduled alerts',
        importance: Importance.max,
        priority: Priority.high,
      );

      const windowsDetails = WindowsNotificationDetails();

      const details = NotificationDetails(android: androidDetails, windows: windowsDetails);

      await _plugin.zonedSchedule(
        id,
        title,
        body,
        tzTime,
        details,
        
      
        payload: payload,
        matchDateTimeComponents: matchDateTimeComponents, androidScheduleMode: AndroidScheduleMode.exact,

      );
    } catch (e) {
      print('[Error][scheduleNotification] $e');
    }
  }

  Future<void> cancelAll() async {
    try {
      await _plugin.cancelAll();
    } catch (e) {
      print('[Error][cancelAll] $e');
    }
  }
}
