import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:validify/validify.dart';

final class NormalValidator extends Validify {
  @override
  List<ValidatorFunction> get validators => [
        Validators.require(message: LocaleKeys.validators_normal.locale),
      ];
}
