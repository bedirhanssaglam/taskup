import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart'; // Yerel anahtarları içe aktarıyoruz
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/validators/normal_validator.dart';

void main() {
  group('NormalValidator Tests', () {
    final normalValidator = NormalValidator();

    test('Valid input should pass', () {
      final result = normalValidator.validate('Some valid input');
      expect(result, isNull, reason: 'Non-empty input should be valid');
    });

    test('Empty input should fail', () {
      final result = normalValidator.validate('');
      expect(result, isNotNull, reason: 'Empty input should be invalid');
      expect(result, LocaleKeys.validators_normal.locale);
    });
  });
}
