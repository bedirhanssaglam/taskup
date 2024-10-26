import 'package:flutter/material.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:widget/widget.dart';

final class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
  });

  static Future<bool?> show(BuildContext context) async {
    return DialogBase.show<bool>(
      context: context,
      builder: (BuildContext context) => const LogOutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: LocaleText('Çıkış Yap'),
      content: LocaleText('Çıkış yapmak istediğinize emin misiniz?'),
      actions: <Widget>[
        AppTextButton(
          text: LocaleKeys.cancelText,
          onPressed: () => Navigator.of(context).pop<bool>(false),
        ),
        AppTextButton(
          text: 'Çıkış yap',
          onPressed: () => Navigator.of(context).pop<bool>(true),
          textColor: context.colorScheme.error,
        ),
      ],
    );
  }
}
