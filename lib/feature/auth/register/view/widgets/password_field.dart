part of '../register_view.dart';

final class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.passwordController,
    required this.passwordObscureTextMode,
    required this.onToggleObscureText,
  });

  final TextEditingController passwordController;
  final ObscureTextMode passwordObscureTextMode;
  final VoidCallback onToggleObscureText;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: AppConstants.passwordHint,
      title: LocaleKeys.login_password,
      controller: passwordController,
      suffixIcon: IconButton(
        icon: Icon(
          passwordObscureTextMode.isObscured
              ? Icons.visibility
              : Icons.visibility_off,
        ),
        onPressed: onToggleObscureText,
      ),
      obscureText: passwordObscureTextMode.isObscured,
      validator: PasswordValidator().validate,
    );
  }
}
