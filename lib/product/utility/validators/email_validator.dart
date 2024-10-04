import 'package:task_management/product/constants/regexp_constants.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:validify/validify.dart';

final class EmailValidator extends Validify {
  @override
  List<ValidatorFunction> get validators => [
        Validators.require(message: LocaleKeys.validators_email.locale),
        Validators.pattern(
          RegexpConstants.emailRegexp,
          message: LocaleKeys.validators_invalidEmailFormat.locale,
        ),
      ];
}
