import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/tap_area/tap_area.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/category.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class CategoryDialog extends StatelessWidget {
  const CategoryDialog({super.key});

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
        height: .5.sh,
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
            return TapArea(
              onTap: () => Navigator.of(context).pop(category),
              child: Column(
                children: [
                  Container(
                    padding: const AppPadding.mediumAll(),
                    decoration: BoxDecoration(
                      color: category.color,
                      borderRadius: AppBorderRadius.circularSmall(),
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.onBackground,
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: category.icon.show(),
                  ),
                  WidgetSizes.spacingXxs.verticalSpace,
                  LocaleText(
                    category.name,
                    style: context.textTheme.bodySmall,
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
