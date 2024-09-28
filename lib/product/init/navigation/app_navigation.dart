import 'package:flutter/material.dart'
    show MaterialPageRoute, Route, RouteSettings;
import 'package:task_management/feature/auth/login/view/login_view.dart';
import 'package:task_management/feature/auth/register/view/register_view.dart';
import 'package:task_management/feature/main/view/main_view.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String main = '/main';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case main:
        return MaterialPageRoute(builder: (context) => const MainView());
      default:
        throw Exception('Route not found: ${settings.name}');
    }
  }
}