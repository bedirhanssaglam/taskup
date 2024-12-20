import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';

extension ContextExtensions on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => themeData.textTheme;
  ColorScheme get colorScheme => themeData.colorScheme;

  Size get size => MediaQuery.sizeOf(this);

  double get screenHeight => size.height;
  double get screenWidth => size.width;

  double get keyboardPadding => MediaQuery.of(this).viewInsets.bottom;

  String monthShortName(DateTime date) => DateFormat.MMM(
        locale.toString(),
      ).format(date).toUpperCase();

  Future<void> navigateToStartingView() async {
    await Navigator.pushNamedAndRemoveUntil(
      this,
      AppRoutes.starting,
      (route) => false,
    );
  }
}
