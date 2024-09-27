import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';

final class AppTextButton extends StatelessWidget {
  const AppTextButton({required this.text, required this.onPressed, super.key});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextButton(
            onPressed: onPressed,
            child: Text(text.locale),
          )
        : CupertinoButton(
            onPressed: onPressed,
            child: Text(
              text.locale,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary),
            ),
          );
  }
}
