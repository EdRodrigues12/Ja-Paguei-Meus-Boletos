import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'app/ui/notifications/notifications_viewmodel.dart';
import 'boletos_app.dart';

void main() {
  Workmanager work = new Workmanager();
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  work.initialize(

    // The top level function, aka callbackDispatcher
     callbackDispatcher,

      // If enabled it will post a notification whenever
      // the task is running. Handy for debugging tasks
      isInDebugMode: false
  );
  // Periodic task registration
  work.registerPeriodicTask(
    "2",

    //This is the value that will be
    // returned in the callbackDispatcher
    "simplePeriodicTask",

    // When no frequency is provided
    // the default 15 minutes is set.
    // Minimum frequency is 15 min.
    // Android will automatically change
    // your frequency to 15 min
    // if you have configured a lower frequency.
    frequency: Duration(minutes: 15),
  );
  runApp(BoletosApp());
}

void callbackDispatcher() {
  Workmanager work = new Workmanager();
  work.executeTask((task, inputData) async {
    // initialise the plugin of flutterlocalnotifications.
    FlutterLocalNotificationsPlugin flip =
    new FlutterLocalNotificationsPlugin();

    // app_icon needs to be a added as a drawable
    // resource to the Android head project.
    var android = new AndroidInitializationSettings('flutter_devs');
    var IOS = new IOSInitializationSettings();
    var vm = new NotificationViewModel();

    // initialise settings for both Android and iOS device.
    var settings = new InitializationSettings(android, IOS);
    flip.initialize(settings);
    await vm.showNotificationMediaStyle(flip);
    return Future.value(true);
  });
}