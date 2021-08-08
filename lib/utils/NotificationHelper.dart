import 'package:camnote/utils/DatebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:camnote/models/Note.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static NotificationHelper _notificationHelper =
      NotificationHelper._internal();

  FlutterLocalNotificationsPlugin? flutterNotification;
  var androidInitilize;
  var iosInitilize;
  var initilizationsSettings;
  var androidDetails;
  var iosDetails;
  var generalNotificationDetails;
  var scheduledTime;

  factory NotificationHelper() {
    if (_notificationHelper == null) {
      _notificationHelper = NotificationHelper._internal();
      return _notificationHelper;
    } else {
      return _notificationHelper;
    }
  }

  NotificationHelper._internal();

  ///Notification selected fonksiyonu içinde payload gönderilecek(String).
  void initiliazeNotification() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Detroit'));

    androidInitilize = new AndroidInitializationSettings('ic_launcher');
    iosInitilize = new IOSInitializationSettings();
    initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iosInitilize);
    flutterNotification = new FlutterLocalNotificationsPlugin();
    flutterNotification!.initialize(initilizationsSettings);
  }

  Future showNotification(Note note) async {
    androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Cam Note", "Notification content",
        importance: Importance.max);

    iosDetails = new IOSNotificationDetails();

    generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);

    await flutterNotification!.periodicallyShow(note.id, "Cam Note", note.note,
        RepeatInterval.daily, generalNotificationDetails,
        androidAllowWhileIdle: true);
    print("Bildirim zamanlandı!");
  }

  Future deleteNotification(Note note) async {
    flutterNotification!.cancel(note.id);
  }
}
