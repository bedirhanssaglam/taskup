import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/enums/locale_enums.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';

@immutable
final class ProductLocalization extends EasyLocalization {
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _translationPath = 'assets/translations';

  static Future<void> updateLanguage(
    BuildContext context, {
    required Locales value,
  }) async =>
      context.setLocale(value.locale);

  static String getCurrentLanguage(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale == Locales.tr.locale) {
      return LocaleKeys.turkish.locale;
    } else if (locale == Locales.en.locale) {
      return LocaleKeys.english.locale;
    }
    return 'Unknown';
  }
}
