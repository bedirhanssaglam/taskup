part of '../register_view.dart';

mixin _RegisterViewMixin on ConsumerState<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  RegisterState get registerState => ref.watch(registerViewModelProvider);

  Future<void> register(BuildContext context) async {
    final email = emailController.trimmedText;
    final password = passwordController.trimmedText;
    final firstName = firstNameController.trimmedText;
    final lastName = lastNameController.trimmedText;

    await ref.read(registerViewModelProvider.notifier).register(
          context,
          RegisterData(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
          ),
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
