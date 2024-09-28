import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/auth/register/view_model/register_state.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';
import 'package:task_management/product/service/exceptions/firebase_exceptions.dart';
import 'package:task_management/product/state/product_provider_items.dart';

part 'register_view_model.g.dart';

@riverpod
class RegisterViewModel extends _$RegisterViewModel {
  @override
  RegisterState build() => const RegisterState();

  Future<void> register(BuildContext context, RegisterData registerData) async {
    state = state.copyWith(status: RegisterStatus.loading);

    try {
      await ref
          .read(
            ProductProviderItems.authServiceProvider,
          )
          .signUp(
            email: registerData.email,
            password: registerData.password,
            firstName: registerData.firstName,
            lastName: registerData.lastName,
          );

      state = state.copyWith(status: RegisterStatus.success);
      final isAuthenticated =
          ref.watch(ProductProviderItems.appStateProvider).account.isNotEmpty;
      if (isAuthenticated) {
        await ref
            .read(
              ProductProviderItems.navigationService,
            )
            .navigateReplacementTo(AppRoutes.home);
      }
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
        status: RegisterStatus.error,
        errorMessage: e.message,
      );
    }
  }
}
