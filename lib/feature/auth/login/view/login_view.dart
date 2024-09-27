import 'package:flutter/material.dart';

final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static Page<void> view() => const MaterialPage<void>(child: LoginView());

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
