import 'package:flutter/material.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:widget/widget.dart';

final class CongratsDialog extends StatelessWidget {
  const CongratsDialog({
    super.key,
  });

  static Future<void> show(BuildContext context) async {
    return DialogBase.show<void>(
      context: context,
      builder: (BuildContext context) => const CongratsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: LocaleText(LocaleKeys.dialog_congrats_title),
      content: LocaleText(
        LocaleKeys.dialog_congrats_content,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        AppTextButton(
          text: LocaleKeys.ok,
          onPressed: Navigator.of(context).pop,
        ),
      ],
    );
  }
}
