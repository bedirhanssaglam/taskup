import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class CustomColorScheme {
  const CustomColorScheme._();

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Color(0xFF0077B6),
    primaryContainer: Color(0xFF00B4D8),
    secondary: Color(0xFFFFC300),
    secondaryContainer: Color(0xFFFFE699),
    tertiary: Color(0xFF90BE6D),
    tertiaryContainer: Color(0xFFC2E59C),
    errorContainer: Color(0xFFFF595E),
    outline: Color(0xFF2D3142),
    background: CupertinoColors.systemGroupedBackground,
    onBackground: Color(0xFF1C1B1F),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFF0F3F4),
    onSurfaceVariant: Color(0xFF5D737E),
    inverseSurface: Color(0xFF373E4E),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF0096C7),
    shadow: Color(0xFF273036),
    surfaceTint: Color(0xFF0077B6),
    outlineVariant: Color(0xFFB0C1D1),
    scrim: Color(0xFF000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Color(0xFF00B4D8),
    primaryContainer: Color(0xFF0077B6),
    secondary: Color(0xFFFFC300),
    secondaryContainer: Color(0xFFB58B00),
    tertiary: Color(0xFF90BE6D),
    tertiaryContainer: Color(0xFF4B6B2F),
    errorContainer: Color(0xFFBA1B1B),
    outline: Color(0xFF8A8D91),
    background: CupertinoColors.darkBackgroundGray,
    onBackground: Color(0xFFE6E1E5),
    surface: Color(0xFF1C1B1F),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF495057),
    onSurfaceVariant: Color(0xFFC1C7C9),
    inverseSurface: Color(0xFF373E4E),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF0096C7),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF00B4D8),
    outlineVariant: Color(0xFF494F59),
    scrim: Color(0xFF000000),
  );
}
