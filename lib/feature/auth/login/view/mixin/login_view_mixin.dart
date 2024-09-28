part of '../login_view.dart';

mixin _LoginViewMixin on ConsumerState<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginState get loginState => ref.watch(loginViewModelProvider);

  Future<void> checkFormStateAndLogin() async {
    if (_isFormStateValidate()) {
      await ref.read(loginViewModelProvider.notifier).login(
            email: emailController.trimmedText,
            password: passwordController.trimmedText,
          );
    }
  }

  bool _isFormStateValidate() => formKey.currentState?.validate() ?? false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
