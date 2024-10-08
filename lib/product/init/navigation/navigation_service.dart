import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed<void>(routeName) ??
        Future<void>.value();
  }

  Future<void> navigateReplacementTo(String routeName) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName) ??
        Future<void>.value();
  }

  void pop() => navigatorKey.currentState?.pop();
}
