import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/utility/validators/email_validator.dart';

void main() {
  group('EmailValidator Tests', () {
    final emailValidator = EmailValidator();

    test('Valid email addresses should pass', () {
      final validEmails = [
        'test@example.com',
        'user.name+tag+sorting@example.com',
        'user@subdomain.example.com',
        'user.name@domain.co.uk',
        'user@domain.info',
      ];

      for (final email in validEmails) {
        final result = emailValidator.validate(email);
        expect(result, isNull, reason: 'Email should be valid: $email');
      }
    });

    test('Invalid email addresses should fail', () {
      final invalidEmails = [
        'plainaddress',
        '@missingusername.com',
        'username@.com',
        'username@domain..com',
        'user@domain,com',
        'user@domain#com',
        'user@domain@com',
      ];

      for (final email in invalidEmails) {
        final result = emailValidator.validate(email);
        expect(result, isNotNull, reason: 'Email should be invalid: $email');
      }
    });
  });
}
