import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/image_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class StartingView extends StatelessWidget {
  const StartingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const AppPadding.normalHorizontal(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetSizes.spacingXxl4.verticalSpace,
              Assets.images.onboarding.show(height: .5.sh),
              const Spacer(),
              LocaleText(
                LocaleKeys.starting_title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              WidgetSizes.spacingXxl4.verticalSpace,
              AppButton(
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.onboarding,
                ),
                text: LocaleKeys.starting_button,
              ),
              const Spacer(),
              LocaleText(
                LocaleKeys.starting_agreement,
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              WidgetSizes.spacingXxl4.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
