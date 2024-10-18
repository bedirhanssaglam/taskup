import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class AppButton extends StatelessWidget {
  const AppButton({required this.onPressed, required this.text, super.key});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSizes.spacingXxl7.h,
      width: double.infinity,
      child: Platform.isAndroid
          ? ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  context.colorScheme.primary,
                ),
              ),
              child: Text(
                text.locale,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.background,
                ),
              ),
            )
          : CupertinoButton.filled(
              onPressed: onPressed,
              borderRadius: AppBorderRadius.circularBig(),
              child: Text(
                text.locale,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.background,
                ),
              ),
            ),
    );
  }
}
