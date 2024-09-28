import 'package:flutter/material.dart'
    show MaterialPageRoute, Route, RouteSettings;
import 'package:task_management/feature/auth/login/view/login_view.dart';
import 'package:task_management/feature/home/view/home_view.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        throw Exception('Route not found: ${settings.name}');
    }
  }
}
