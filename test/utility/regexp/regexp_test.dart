import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/utility/constants/regexp_constants.dart';

void main() {
  group('RegexpConstants - emailRegexp', () {
    test('should match valid email addresses', () {
      const validEmails = [
        'test@example.com',
        'john.doe@domain.co',
        'user123@sub.domain.com',
        'email.with+symbol@domain.org',
        'name_lastname@domain.info',
      ];

      for (final email in validEmails) {
        expect(
          RegexpConstants.emailRegexp.hasMatch(email),
          isTrue,
          reason: 'Failed for $email',
        );
      }
    });

    test('should not match invalid email addresses', () {
      const invalidEmails = [
        'plainaddress',
        '@missingusername.com',
        'username@.com',
        'username@domain..com',
        'username@domain,com',
        'username@domain',
        'username@domain..com',
      ];

      for (final email in invalidEmails) {
        expect(
          RegexpConstants.emailRegexp.hasMatch(email),
          isFalse,
          reason: 'Failed for $email',
        );
      }
    });
  });
}
