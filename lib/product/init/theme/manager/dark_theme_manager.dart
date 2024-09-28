import 'package:flutter/material.dart';
import 'package:task_management/product/init/theme/colors/custom_color_scheme.dart';
import 'package:task_management/product/init/theme/interface/custom_theme.dart';

/// Custom light theme for project design
final class DarkThemeManager implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
