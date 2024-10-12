part of '../login_view.dart';

final class _EmailAndPasswordFields extends StatelessWidget {
  const _EmailAndPasswordFields({
    required this.emailController,
    required this.passwordController,
    required this.obscureTextMode,
    required this.onToggleObscureText,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ObscureTextMode obscureTextMode;
  final VoidCallback onToggleObscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: emailController,
          hintText: AppConstants.emailHint,
          title: LocaleKeys.login_email,
          keyboardType: TextInputType.emailAddress,
          validator: EmailValidator().validate,
        ),
        WidgetSizes.spacingM.verticalSpace,
        AppTextField(
          controller: passwordController,
          hintText: AppConstants.passwordHint,
          title: LocaleKeys.login_password,
          suffixIcon: IconButton(
            icon: Icon(
              obscureTextMode.isObscured
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: onToggleObscureText,
          ),
          obscureText: obscureTextMode.isObscured,
          textInputAction: TextInputAction.done,
          validator: PasswordValidator().validate,
        ),
      ],
    );
  }
}
