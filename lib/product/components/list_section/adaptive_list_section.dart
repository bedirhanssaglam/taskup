import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';

final class AdaptiveListSection extends StatelessWidget {
  const AdaptiveListSection({
    required this.children,
    super.key,
    this.headerText,
    this.footerText,
  });

  final String? headerText;
  final String? footerText;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Container(
            width: 1.sw,
            margin: const EdgeInsets.only(top: 20),
            color: context.colorScheme.onPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (headerText != null)
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, top: 12.h),
                    child: LocaleText(
                      headerText!,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ...children,
              ],
            ),
          )
        : CupertinoListSection.insetGrouped(
            backgroundColor: Colors.transparent,
            header: headerText != null
                ? LocaleText(
                    headerText!,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
            footer: footerText != null
                ? LocaleText(
                    footerText!,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: CupertinoColors.systemGrey,
                    ),
                  )
                : null,
            children: children,
          );
  }
}
