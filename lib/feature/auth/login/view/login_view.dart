import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/auth/register/view/register_view.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/constants/app_constants.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part './widgets/email_and_password_fields.dart';
part './widgets/login_header.dart';
part './widgets/no_account_widget.dart';

final class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static Page<void> view() => const MaterialPage<void>(child: LoginView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const AppPadding.normalHorizontal(),
          child: Column(
            children: [
              const _LoginHeader(),
              WidgetSizes.spacingXxl8.verticalSpace,
              const _EmailAndPasswordFields(),
              WidgetSizes.spacingXxl7.verticalSpace,
              AppButton(
                onPressed: () {},
                text: LocaleKeys.login_loginText,
              ),
              WidgetSizes.spacingL.verticalSpace,
              const _NoAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
