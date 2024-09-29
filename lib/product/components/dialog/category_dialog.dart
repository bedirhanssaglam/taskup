import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/dialog/category.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

final class CategoryDialog extends StatelessWidget {
  const CategoryDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: LocaleText(
              LocaleKeys.category_title,
              style: context.textTheme.titleMedium,
            ),
          ),
          const Divider(),
        ],
      ),
      content: SizedBox(
        height: .45.sh,
        width: double.maxFinite,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: Category.categories.length,
          itemBuilder: (context, index) {
            final category = Category.categories[index];
            return InkWell(
              onTap: Navigator.of(context).pop,
              child: Column(
                children: [
                  Container(
                    padding: const AppPadding.mediumAll(),
                    decoration: BoxDecoration(
                      color: category.color,
                      borderRadius: AppBorderRadius.circularSmall(),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: category.icon.show(),
                  ),
                  Text(
                    category.name.locale,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}