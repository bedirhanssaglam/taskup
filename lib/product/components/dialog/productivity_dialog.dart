import 'package:flutter/material.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:widget/widget.dart';

final class ProductivityDialog extends StatelessWidget {
  const ProductivityDialog({
    super.key,
  });

  static Future<bool?> show(BuildContext context) async {
    return DialogBase.show<bool>(
      context: context,
      builder: (BuildContext context) => const ProductivityDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: LocaleText(LocaleKeys.dashboard_productivity),
      content: LocaleText(
        LocaleKeys.dashboard_productivityDescription,
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
