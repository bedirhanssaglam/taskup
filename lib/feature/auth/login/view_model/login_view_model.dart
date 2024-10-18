import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/auth/login/view_model/login_state.dart';
import 'package:task_management/product/service/exceptions/firebase_exceptions.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();

  Future<void> login({
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
    } on LogInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.message,
      );
    }
  }
}
