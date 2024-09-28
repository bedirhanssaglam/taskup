import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/constants/app_constants.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part './widgets/have_account_widget.dart';
part './widgets/register_header.dart';

final class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const AppPadding.normalHorizontal(),
          child: Column(
            children: [
              const _RegisterHeader(),
              AppTextField(
                hintText: LocaleKeys.register_enterYourName.locale,
                title: LocaleKeys.register_name.locale,
              ),
              WidgetSizes.spacingM.verticalSpace,
              AppTextField(
                hintText: LocaleKeys.register_enterYourSurname.locale,
                title: LocaleKeys.register_surname,
              ),
              WidgetSizes.spacingM.verticalSpace,
              const AppTextField(
                hintText: AppConstants.emailHint,
                title: LocaleKeys.login_email,
                keyboardType: TextInputType.emailAddress,
              ),
              WidgetSizes.spacingM.verticalSpace,
              const AppTextField(
                hintText: AppConstants.passwordHint,
                title: LocaleKeys.login_password,
              ),
              WidgetSizes.spacingM.verticalSpace,
              const AppTextField(
                hintText: AppConstants.passwordHint,
                title: LocaleKeys.register_passwordAgain,
                textInputAction: TextInputAction.done,
              ),
              WidgetSizes.spacingXxl3.verticalSpace,
              AppButton(
                onPressed: () {},
                text: LocaleKeys.login_registerText,
              ),
              WidgetSizes.spacingS.verticalSpace,
              const _HaveAccountWidget(),
              WidgetSizes.spacingL.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
