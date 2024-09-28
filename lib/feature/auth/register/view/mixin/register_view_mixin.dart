part of '../register_view.dart';

mixin _RegisterViewMixin on ConsumerState<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  RegisterState get registerState => ref.watch(registerViewModelProvider);

  Future<void> register(BuildContext context) async {
    if (_isFormStateValidate()) {
      await ref.read(registerViewModelProvider.notifier).register(
            context,
            RegisterData(
              email: emailController.trimmedText,
              password: passwordController.trimmedText,
              firstName: firstNameController.trimmedText,
              lastName: lastNameController.trimmedText,
            ),
          );
    }
  }

  bool _isFormStateValidate() => formKey.currentState?.validate() ?? false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}
