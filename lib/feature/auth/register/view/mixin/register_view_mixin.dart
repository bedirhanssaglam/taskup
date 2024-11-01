part of '../register_view.dart';

mixin _RegisterViewMixin on ConsumerState<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Future<void> register(BuildContext context) async {
    if (_isFormStateValidate()) {
      await ref.registerViewModel.register(
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

  final ValueNotifier<ObscureTextMode> passwordObscureTextModeNotifier =
      ValueNotifier<ObscureTextMode>(
    ObscureTextMode.hide,
  );
  final ValueNotifier<ObscureTextMode> confirmPasswordObscureTextModeNotifier =
      ValueNotifier<ObscureTextMode>(
    ObscureTextMode.hide,
  );

  void togglePasswordObscureTextMode() {
    passwordObscureTextModeNotifier.value =
        passwordObscureTextModeNotifier.value == ObscureTextMode.hide
            ? ObscureTextMode.show
            : ObscureTextMode.hide;
  }

  void toggleConfirmPasswordObscureTextMode() {
    confirmPasswordObscureTextModeNotifier.value =
        confirmPasswordObscureTextModeNotifier.value == ObscureTextMode.hide
            ? ObscureTextMode.show
            : ObscureTextMode.hide;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordObscureTextModeNotifier.dispose();
    confirmPasswordObscureTextModeNotifier.dispose();
    super.dispose();
  }
}
