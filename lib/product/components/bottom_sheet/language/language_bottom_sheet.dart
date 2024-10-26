import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:widget/widget.dart';

final class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    required this.title,
    required this.onTurkishPressed,
    required this.onEnglishPressed,
    super.key,
  });

  final String title;
  final VoidCallback onTurkishPressed;
  final VoidCallback onEnglishPressed;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required VoidCallback onTurkishTapped,
    required VoidCallback onEnglishTapped,
  }) async {
    await BottomSheetBase.show<void>(
      context: context,
      builder: (context) => LanguageBottomSheet(
        title: title,
        onTurkishPressed: onTurkishTapped,
        onEnglishPressed: onEnglishTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SizedBox(
            height: .2.sh,
            width: 1.sw,
            child: Column(
              children: [
                30.verticalSpace,
                ListTile(
                  leading: Assets.icons.turkish.show(
                    height: 24.h,
                  ),
                  onTap: () {
                    onTurkishPressed.call();
                    Navigator.of(context).pop();
                  },
                  title: LocaleText(LocaleKeys.turkish),
                ),
                ListTile(
                  leading: Assets.icons.english.show(
                    height: 24.h,
                  ),
                  onTap: () {
                    onEnglishPressed.call();
                    Navigator.of(context).pop();
                  },
                  title: LocaleText(LocaleKeys.english),
                ),
              ],
            ),
          )
        : CupertinoActionSheet(
            title: LocaleText(title),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: onTurkishPressed,
                child: Row(
                  children: [
                    Assets.icons.turkish.show(
                      height: 24.h,
                    ),
                    8.horizontalSpace,
                    LocaleText(LocaleKeys.turkish),
                  ],
                ),
              ),
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: onEnglishPressed,
                child: Row(
                  children: [
                    Assets.icons.english.show(
                      height: 24.h,
                    ),
                    8.horizontalSpace,
                    LocaleText(LocaleKeys.english),
                  ],
                ),
              ),
            ],
          );
  }
}
