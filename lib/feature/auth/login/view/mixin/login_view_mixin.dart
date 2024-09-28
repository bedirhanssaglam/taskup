part of '../login_view.dart';

mixin _LoginViewMixin on ConsumerState<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginState get loginState => ref.watch(loginViewModelProvider);

  Future<void> login() async {
    final email = emailController.trimmedText;
    final password = passwordController.trimmedText;

    await ref.read(loginViewModelProvider.notifier).login(
          email: email,
          password: password,
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
