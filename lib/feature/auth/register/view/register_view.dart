import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/feature/auth/register/view_model/register_state.dart';
import 'package:task_management/feature/auth/register/view_model/register_view_model.dart';
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
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:task_management/product/utility/validators/confirm_password_validator.dart';
import 'package:task_management/product/utility/validators/email_validator.dart';
import 'package:task_management/product/utility/validators/normal_validator.dart';
import 'package:task_management/product/utility/validators/password_validator.dart';

part './mixin/register_view_mixin.dart';
part './widgets/confirm_password_field.dart';
part './widgets/have_account_widget.dart';
part './widgets/password_field.dart';
part './widgets/register_error.dart';
part './widgets/register_header.dart';

final class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView>
    with _RegisterViewMixin {
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
                const _RegisterHeader(),
                AppTextField(
                  hintText: LocaleKeys.register_enterYourName.locale,
                  title: LocaleKeys.register_name.locale,
                  controller: firstNameController,
                  validator: NormalValidator().validate,
                ),
                WidgetSizes.spacingM.verticalSpace,
                AppTextField(
                  hintText: LocaleKeys.register_enterYourSurname.locale,
                  title: LocaleKeys.register_surname,
                  controller: lastNameController,
                  validator: NormalValidator().validate,
                ),
                WidgetSizes.spacingM.verticalSpace,
                AppTextField(
                  hintText: AppConstants.emailHint,
                  title: LocaleKeys.login_email,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: EmailValidator().validate,
                ),
                WidgetSizes.spacingM.verticalSpace,
                ValueListenableBuilder<ObscureTextMode>(
                  valueListenable: passwordObscureTextModeNotifier,
                  builder: (context, passwordObscureTextMode, child) {
                    return _PasswordField(
                      passwordController: passwordController,
                      passwordObscureTextMode: passwordObscureTextMode,
                      onToggleObscureText: togglePasswordObscureTextMode,
                    );
                  },
                ),
                WidgetSizes.spacingM.verticalSpace,
                ValueListenableBuilder<ObscureTextMode>(
                  valueListenable: confirmPasswordObscureTextModeNotifier,
                  builder: (context, confirmPasswordObscureTextMode, child) {
                    return _ConfirmPasswordField(
                      confirmPasswordController: confirmPasswordController,
                      passwordController: passwordController,
                      confirmPasswordObscureTextMode:
                          confirmPasswordObscureTextMode,
                      onToggleObscureText: toggleConfirmPasswordObscureTextMode,
                    );
                  },
                ),
                WidgetSizes.spacingXxl3.verticalSpace,
                if (registerState.status.isLoading)
                  const CircularProgressIndicator.adaptive()
                else
                  AppButton(
                    onPressed: () => register(context),
                    text: LocaleKeys.login_registerText,
                  ),
                if (registerState.status.isError) ...[
                  _RegisterError(errorMessage: registerState.errorMessage!),
                ],
                WidgetSizes.spacingS.verticalSpace,
                const _HaveAccountWidget(),
                WidgetSizes.spacingL.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
