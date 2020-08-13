import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tasks/bloc/task/task_bloc.dart';
import 'package:tasks/pages/add_task.dart';
import 'package:tasks/pages/home.dart';
import 'package:tasks/pages/settings.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _initNotifications() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

/* Clear notifications */
    await flutterLocalNotificationsPlugin.cancelAll();

    /* Set a daily notification */
    Time scheduledTime = Time(19, 0, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'main',
      'Main notification',
      'Daily notifications',
      importance: Importance.High,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Hi, have you completed your daily tasks?',
        'Tap here to review them.',
        scheduledTime,
        platformChannelSpecifics);

    /* await flutterLocalNotificationsPlugin.show(
        0,
        'Hi, have you completed your daily tasks?',
        'Tap here to review them.',
        platformChannelSpecifics); */
  }

  Future selectNotification(String payload) async {
    print("HEEELOOOO");
  }

  @override
  void initState() {
    super.initState();
    _initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'settings': (context) => SettingsPage(),
        'add_task': (context) => AddTaskPage(),
      },
      /* Task Bloc provider for whole app */
      builder: (context, widget) => BlocProvider<TaskBloc>(
        create: (_) => TaskBloc(),
        child: widget,
      ),
    );
  }
}
