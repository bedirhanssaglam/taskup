part of '../register_view.dart';

final class _ConfirmPasswordField extends StatelessWidget {
  const _ConfirmPasswordField({
    required this.confirmPasswordController,
    required this.passwordController,
    required this.confirmPasswordObscureTextMode,
    required this.onToggleObscureText,
  });

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;
  final ObscureTextMode confirmPasswordObscureTextMode;
  final VoidCallback onToggleObscureText;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: confirmPasswordController,
      hintText: AppConstants.passwordHint,
      title: LocaleKeys.register_passwordAgain,
      suffixIcon: IconButton(
        icon: Icon(
          confirmPasswordObscureTextMode.isObscured
              ? Icons.visibility
              : Icons.visibility_off,
        ),
        onPressed: onToggleObscureText,
      ),
      obscureText: confirmPasswordObscureTextMode.isObscured,
      textInputAction: TextInputAction.done,
      validator: ConfirmPasswordValidator(
        firstValue: passwordController.trimmedText,
        secondValue: confirmPasswordController.trimmedText,
      ).validate,
    );
  }
}
