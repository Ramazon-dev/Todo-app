import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/model/reminders.dart';
import 'package:todo_app/route.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // registering the adapter
  Hive.registerAdapter(RemindersAdapter());
  // open the people box
  await Hive.openBox('remindersBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteManager.generateRoute(settings),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.splashScaffoldColor,
        textTheme: TextTheme(
            bodyText1: TextStyle(
              color: AppColors.textColor,
            ),
            bodyText2: TextStyle(
              color: AppColors.textColor,
            )),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
