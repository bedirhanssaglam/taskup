import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class AppConstants {
  const AppConstants._();

  static const String appName = 'Travely';
  static const String genPackageName = 'gen';

  static const String emailHint = 'example@gmail.com';
  static const String passwordHint = '***********';
}
