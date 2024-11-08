import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class CustomColorScheme {
  const CustomColorScheme._();

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: CupertinoColors.systemBlue,
    primaryContainer: Color(0xFF00B4D8),
    secondary: Color(0xFFFFC300),
    secondaryContainer: Color(0xFFFFE699),
    tertiary: Color(0xFF90BE6D),
    tertiaryContainer: Color(0xFFC2E59C),
    error: CupertinoColors.systemRed,
    errorContainer: Color(0xFFFF595E),
    outline: Color(0xFF2D3142),
    surface: CupertinoColors.systemGroupedBackground,
    onSurface: Color(0xFF1C1B1F),
    surfaceContainerHighest: Color(0xFFF0F3F4),
    onSurfaceVariant: Color(0xFF5D737E),
    inverseSurface: Color(0xFF373E4E),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF0096C7),
    shadow: Color(0xFF273036),
    surfaceTint: Color(0xFF0077B6),
    outlineVariant: Color.fromARGB(255, 219, 224, 231),
    scrim: Color(0xFF000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: CupertinoColors.systemBlue,
    primaryContainer: Color(0xFF0077B6),
    secondary: Color(0xFFFFC300),
    secondaryContainer: Color(0xFFB58B00),
    onPrimary: Color.fromARGB(255, 49, 50, 51),
    tertiary: Color(0xFF90BE6D),
    tertiaryContainer: Color(0xFF4B6B2F),
    errorContainer: CupertinoColors.destructiveRed,
    outline: Color(0xFF8A8D91),
    surface: CupertinoColors.darkBackgroundGray,
    onSurface: Color(0xFFE6E1E5),
    surfaceContainerHighest: Color(0xFF495057),
    onSurfaceVariant: Color(0xFFC1C7C9),
    inverseSurface: Color(0xFF373E4E),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF0096C7),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF00B4D8),
    outlineVariant: Color.fromARGB(255, 78, 81, 85),
    scrim: Color(0xFF000000),
  );
}
