import 'package:flutter/material.dart';
import 'package:task_management/product/init/theme/colors/custom_color_scheme.dart';
import 'package:task_management/product/init/theme/interface/custom_theme.dart';

/// Custom light theme for project design
final class LightThemeManager implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: 'Open Sans',
        colorScheme: CustomColorScheme.lightColorScheme,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
