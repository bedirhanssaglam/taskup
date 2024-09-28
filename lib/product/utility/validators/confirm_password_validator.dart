import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:validify/validify.dart';

final class ConfirmPasswordValidator extends Validify {
  ConfirmPasswordValidator({
    required this.firstValue,
    required this.secondValue,
  });

  final String firstValue;
  final String secondValue;

  @override
  List<ValidatorFunction> get validators => [
        Validators.require(
          message: LocaleKeys.validators_confirmPassword.locale,
        ),
        Validators.equality(
          firstValue,
          secondValue,
          message: LocaleKeys.validators_notMatch.locale,
        ),
      ];
}
