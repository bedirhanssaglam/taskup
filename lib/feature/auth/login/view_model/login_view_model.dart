// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/auth/login/view_model/login_state.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';
import 'package:task_management/product/service/exceptions/firebase_exceptions.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();

  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    state = state.copyWith(status: LoginStatus.loading);

    try {
      await ref
          .read(
            AuthProviderItems.authServiceProvider,
          )
          .logInWithEmailAndPassword(
            email: email,
            password: password,
          );
      state = state.copyWith(status: LoginStatus.success);
      await Navigator.pushReplacementNamed(context, AppRoutes.main);
    } on LogInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.message,
      );
    }
  }
}
