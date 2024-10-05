import 'package:task_management/product/constants/exception_constants.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';

final class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = LocaleKeys.error_unknownException,
  ]);

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

  final String message;
}

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

  final String message;
}

final class LogOutFailure implements Exception {}

final class NoUserFailure implements Exception {
  const NoUserFailure([
    this.message = LocaleKeys.error_userNotFound,
  ]);

  final String message;
}
