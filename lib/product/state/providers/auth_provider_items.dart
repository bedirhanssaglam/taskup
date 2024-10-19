import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/auth/login/view_model/login_view_model.dart';
import 'package:task_management/feature/auth/onboarding/view_model/onboarding_view_model.dart';
import 'package:task_management/feature/auth/register/view_model/register_view_model.dart';
import 'package:task_management/product/service/auth/auth_service.dart';
import 'package:task_management/product/state/app/app_state.dart';
import 'package:task_management/product/state/app/app_view_model.dart';

class AuthProviderItems {
  static final appStateProvider =
      StateNotifierProvider<AppViewModel, AppState>((
    ref,
  ) {
    final authService = ref.watch(authServiceProvider);
    return AppViewModel(authService);
  });

  static final authServiceProvider = Provider<AuthService>((ref) {
    return AuthService();
  });

  static final onboardingViewModel =
      StateNotifierProvider<OnboardingViewModel, int>((ref) {
    return OnboardingViewModel(5);
  });

  static final loginViewModel = Provider<LoginViewModel>((ref) {
    return LoginViewModel();
  });

  static final registerViewModel = Provider<RegisterViewModel>((ref) {
    return RegisterViewModel();
  });
}
