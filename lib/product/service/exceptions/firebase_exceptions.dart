import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/constants/exception_constants.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';

/// Thrown during the sign up process if a failure occurs.
final class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = LocaleKeys.error_unknownException,
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case ExceptionConstants.invalidEmail:
        return SignUpWithEmailAndPasswordFailure(
          LocaleKeys.error_invalidEmail.locale,
        );
      case ExceptionConstants.userDisabled:
        return SignUpWithEmailAndPasswordFailure(
          LocaleKeys.error_userDisabled.locale,
        );
      case ExceptionConstants.emailAlreadyInUse:
        return SignUpWithEmailAndPasswordFailure(
          LocaleKeys.error_signUp_emailAlreadyInUse.locale,
        );
      case ExceptionConstants.operationNotAllowed:
        return SignUpWithEmailAndPasswordFailure(
          LocaleKeys.error_signUp_operationNotAllowed.locale,
        );
      case ExceptionConstants.weakPassword:
        return SignUpWithEmailAndPasswordFailure(
          LocaleKeys.error_signUp_weakPassword.locale,
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the login process if a failure occurs.
final class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = LocaleKeys.error_unknownException,
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case ExceptionConstants.invalidEmail:
        return LogInWithEmailAndPasswordFailure(
          LocaleKeys.error_invalidEmail.locale,
        );
      case ExceptionConstants.userDisabled:
        return LogInWithEmailAndPasswordFailure(
          LocaleKeys.error_userDisabled.locale,
        );
      case ExceptionConstants.userNotFound:
        return LogInWithEmailAndPasswordFailure(
          LocaleKeys.error_login_userNotFound.locale,
        );
      case ExceptionConstants.wrongPassword:
        return LogInWithEmailAndPasswordFailure(
          LocaleKeys.error_login_wrongPassword.locale,
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
final class LogOutFailure implements Exception {}
