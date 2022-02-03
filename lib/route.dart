import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/home_page/home_page.dart';
import 'package:todo_app/view/screens/task_page/task_page.dart';
import 'package:todo_app/view/screens/splash_screen/splash_screen.dart';
import 'package:todo_app/view/widgets/cubit/bottom_navbar_cubit/bottom_nav_bar_view.dart';

class RouteManager {
  static generateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashSceenPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const BottomNavBarView());
      case 'task':
        return MaterialPageRoute(builder: (_) => const TaskPage());
    }
  }
}
