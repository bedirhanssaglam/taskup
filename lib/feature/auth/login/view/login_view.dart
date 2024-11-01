import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/feature/auth/register/view/register_view.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/logo/app_logo.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/constants/app_constants.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/enums/obscure_text_mode.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/controller_extensions.dart';
import 'package:task_management/product/utility/extensions/riverpod_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:task_management/product/utility/validators/email_validator.dart';
import 'package:task_management/product/utility/validators/password_validator.dart';

part './mixin/login_view_mixin.dart';
part './widgets/email_and_password_fields.dart';
part './widgets/login_error.dart';
part './widgets/login_header.dart';
part './widgets/no_account_widget.dart';

final class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const _LoginHeader(),
                WidgetSizes.spacingXxl8.verticalSpace,
                ValueListenableBuilder<ObscureTextMode>(
                  valueListenable: obscureTextModeNotifier,
                  builder: (context, obscureTextMode, child) {
                    return _EmailAndPasswordFields(
                      emailController: emailController,
                      passwordController: passwordController,
                      obscureTextMode: obscureTextMode,
                      onToggleObscureText: _toggleObscureTextMode,
                    );
                  },
                ),
                WidgetSizes.spacingXxl7.verticalSpace,
                if (ref.loginState.status.isLoading)
                  const CircularProgressIndicator.adaptive()
                else
                  AppButton(
                    onPressed: () => checkFormStateAndLogin(context),
                    text: LocaleKeys.login_loginText,
                  ),
                if (ref.loginState.status.isError) ...[
                  WidgetSizes.spacingM.verticalSpace,
                  _LoginError(
                    errorMessage: ref.loginState.errorMessage!.locale,
                  ),
                ],
                WidgetSizes.spacingL.verticalSpace,
                const _NoAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
