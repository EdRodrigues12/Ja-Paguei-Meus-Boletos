import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ja_paguei_meus_boletos/app/model/payment_slip.dart';
import 'package:ja_paguei_meus_boletos/app/repository/payment_slip_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:ja_paguei_meus_boletos/core/util/format_values.dart';

part 'notifications_viewmodel.g.dart';

class NotificationViewModel = _NotificationViewModelBase
    with _$NotificationViewModel;

abstract class _NotificationViewModelBase with Store {
  PaymentSlipRepository repository = PaymentSlipRepository();

  Future<List<PaymentSlip>> getPaymentSlip() async {
    List<PaymentSlip> list = await repository.findAll();
    return list;
  }

  Future<void> showNotificationMediaStyle(flutterLocalNotificationsPlugin) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'media channel id',
      'media channel name',
      'media channel description',
      color: Colors.red,
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
      styleInformation: MediaStyleInformation(htmlFormatContent: true, htmlFormatTitle: true),
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    List<PaymentSlip> list = await getPaymentSlip();
    var dateNow = formatDateBr(DateTime.now());
    for (PaymentSlip payments in list) {
      if (formatDateTime(payments.date) == formatDateTime(dateNow)) {
        await flutterLocalNotificationsPlugin.show(
            0, payments.description, formatMoneyBr(payments.value), platformChannelSpecifics);
      }
    }
  }

  Future<void> showBigPictureNotification(
      flutterLocalNotificationsPlugin) async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("flutter_devs"),
        largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
        contentTitle: 'flutter devs',
        htmlFormatContentTitle: true,
        summaryText: 'summaryText',
        htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'big text channel id',
        'big text channel name',
        'big text channel description',
        styleInformation: bigPictureStyleInformation);
    var platformChannelSpecifics =
        NotificationDetails(androidPlatformChannelSpecifics, null);
    await flutterLocalNotificationsPlugin.show(
        0, 'big text title', 'silent body', platformChannelSpecifics,
        payload: "big image notifications");
  }

  Future<void> scheduleNotification(flutterLocalNotificationsPlugin) async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: 'flutter_devs',
      largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future<void> cancelNotification(flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  showNotification(flutterLocalNotificationsPlugin) async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Flutter devs', 'Flutter Local Notification Demo', platform,
        payload: 'Welcome to the Local Notification demo ');
  }
}
