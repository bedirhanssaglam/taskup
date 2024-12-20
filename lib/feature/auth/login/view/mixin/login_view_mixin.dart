part of '../login_view.dart';

mixin _LoginViewMixin on ConsumerState<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> checkFormStateAndLogin(BuildContext context) async {
    if (_isFormStateValidate()) {
      await ref.loginViewModel.login(
        context,
        email: emailController.trimmedText,
        password: passwordController.trimmedText,
      );
    }
  }

  bool _isFormStateValidate() => formKey.currentState?.validate() ?? false;

  final ValueNotifier<ObscureTextMode> obscureTextModeNotifier =
      ValueNotifier<ObscureTextMode>(
    ObscureTextMode.hide,
  );

  void _toggleObscureTextMode() {
    obscureTextModeNotifier.value =
        obscureTextModeNotifier.value == ObscureTextMode.hide
            ? ObscureTextMode.show
            : ObscureTextMode.hide;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    obscureTextModeNotifier.dispose();
    super.dispose();
  }
}
