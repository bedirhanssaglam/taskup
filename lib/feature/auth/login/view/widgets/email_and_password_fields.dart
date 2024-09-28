part of '../login_view.dart';

final class _EmailAndPasswordFields extends StatelessWidget {
  const _EmailAndPasswordFields(this.emailController, this.passwordController);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: emailController,
          hintText: AppConstants.emailHint,
          title: LocaleKeys.login_email,
          keyboardType: TextInputType.emailAddress,
        ),
        WidgetSizes.spacingM.verticalSpace,
        AppTextField(
          controller: passwordController,
          hintText: AppConstants.passwordHint,
          title: LocaleKeys.login_password,
          obscureText: true,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
