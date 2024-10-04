import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class ExceptionConstants {
  const ExceptionConstants._();

  static const String invalidEmail = 'invalid-email';
  static const String userDisabled = 'user-disabled';
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String operationNotAllowed = 'operation-not-allowed';
  static const String weakPassword = 'weak-password';
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';
}
