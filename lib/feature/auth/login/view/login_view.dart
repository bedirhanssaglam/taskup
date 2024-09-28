import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/auth/login/view_model/login_state.dart';
import 'package:task_management/feature/auth/login/view_model/login_view_model.dart';
import 'package:task_management/feature/auth/register/view/register_view.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/constants/app_constants.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/controller_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part './mixin/login_view_mixin.dart';
part './widgets/email_and_password_fields.dart';
part './widgets/login_error.dart';
part './widgets/login_header.dart';
part './widgets/no_account_widget.dart';

final class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  static Page<void> view() => const MaterialPage<void>(child: LoginView());

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with _LoginViewMixin {
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
              _EmailAndPasswordFields(emailController, passwordController),
              WidgetSizes.spacingXxl7.verticalSpace,
              if (loginState.status.isLoading)
                const CircularProgressIndicator.adaptive()
              else
                AppButton(
                  onPressed: login,
                  text: LocaleKeys.login_loginText,
                ),
              if (loginState.status.isError) ...[
                WidgetSizes.spacingM.verticalSpace,
                _LoginError(errorMessage: loginState.errorMessage!),
              ],
              WidgetSizes.spacingL.verticalSpace,
              const _NoAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
