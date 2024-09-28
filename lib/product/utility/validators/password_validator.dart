import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:validify/validify.dart';

final class PasswordValidator extends Validify {
  @override
  List<ValidatorFunction> get validators => [
        Validators.require(
          message: LocaleKeys.validators_password.locale,
        ),
        Validators.minLength(
          6,
          message: (length) => LocaleKeys.validators_passwordLength.localeArgs([
            length.toString(),
          ]),
        ),
      ];
}
