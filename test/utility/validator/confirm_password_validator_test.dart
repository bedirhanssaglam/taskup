import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/validators/confirm_password_validator.dart';

void main() {
  group('ConfirmPasswordValidator Tests', () {
    test('Matching passwords should pass', () {
      final validator = ConfirmPasswordValidator(
        firstValue: 'password123',
        secondValue: 'password123',
      );

      final result = validator.validate('password123');
      expect(result, isNull, reason: 'Matching passwords should be valid');
    });

    test('Non-matching passwords should fail', () {
      final validator = ConfirmPasswordValidator(
        firstValue: 'password123',
        secondValue: 'differentPassword',
      );

      final result = validator.validate('differentPassword');
      expect(
        result,
        isNotNull,
        reason: 'Non-matching passwords should be invalid',
      );
      expect(result, LocaleKeys.validators_notMatch.locale);
    });

    test('Empty confirm password should fail', () {
      final validator = ConfirmPasswordValidator(
        firstValue: 'password123',
        secondValue: '',
      );

      final result = validator.validate('');
      expect(
        result,
        isNotNull,
        reason: 'Empty confirm password should be invalid',
      );
      expect(result, LocaleKeys.validators_confirmPassword.locale);
    });
  });
}
