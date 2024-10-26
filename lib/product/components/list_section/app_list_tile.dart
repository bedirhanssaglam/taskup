import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';

final class AppListTile extends StatelessWidget {
  const AppListTile({
    required this.title,
    required this.leading,
    super.key,
    this.trailing,
    this.onTap,
    this.additionalInfoText,
    this.leadingSize = 21,
    this.leadingColor,
    this.textColor,
  });

  final String title;
  final IconData leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final String? additionalInfoText;
  final double leadingSize;
  final Color? leadingColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Card(
            elevation: 0,
            color: Colors.transparent,
            child: ListTile(
              onTap: onTap,
              title: LocaleText(
                title,
                style: context.textTheme.bodyLarge,
              ),
              leading: Icon(
                leading,
                size: leadingSize,
                color: leadingColor,
              ),
              trailing: trailing,
            ),
          )
        : CupertinoListTile.notched(
            onTap: onTap,
            title: LocaleText(
              title,
              style: context.textTheme.bodyLarge,
            ),
            leading: Container(
              decoration: BoxDecoration(
                color: leadingColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Icon(
                  leading,
                  color: Colors.white,
                  size: leadingSize.h,
                ),
              ),
            ),
            additionalInfo: additionalInfoText != null
                ? LocaleText(
                    additionalInfoText!,
                  )
                : null,
            trailing: trailing,
          );
  }
}
