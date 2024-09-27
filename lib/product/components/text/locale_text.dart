import 'package:flutter/material.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';

final class LocaleText extends Text {
  LocaleText(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    List<String>? args,
  }) : super(
          args != null ? text.localeArgs(args) : text.locale,
          key: key,
          style: style,
          textAlign: textAlign,
        );
}
