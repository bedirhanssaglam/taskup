import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/utility/validators/password_validator.dart';

void main() {
  group('PasswordValidator Tests', () {
    final passwordValidator = PasswordValidator();

    test('Valid passwords should pass', () {
      final validPasswords = [
        '123456',
        'abcdef',
        'Password1',
        'validPass123',
        'qwertyuiop',
      ];

      for (final password in validPasswords) {
        final result = passwordValidator.validate(password);
        expect(
          result,
          isNull,
          reason: 'Password should be valid: $password',
        );
      }
    });

    test('Invalid passwords should fail', () {
      final invalidPasswords = [
        '',
        '123',
        'abcd',
        'pass',
        'short',
      ];

      for (final password in invalidPasswords) {
        final result = passwordValidator.validate(password);
        expect(
          result,
          isNotNull,
          reason: 'Password should be invalid: $password',
        );
      }
    });

    test('Empty password should fail', () {
      final result = passwordValidator.validate('');
      expect(result, isNotNull, reason: 'Empty password should be invalid');
    });
  });
}
