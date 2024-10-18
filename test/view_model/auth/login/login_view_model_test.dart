import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/feature/auth/login/view_model/login_state.dart';
import 'package:task_management/feature/auth/login/view_model/login_view_model.dart';
import 'package:task_management/product/service/auth/auth_service.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';

final class _MockAuthService extends Mock implements AuthService {
  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return Future<void>.value();
  }
}

void main() {
  test('LoginViewModel fetches tasks', () async {
    final container = ProviderContainer(
      overrides: [
        AuthProviderItems.authServiceProvider.overrideWithValue(
          _MockAuthService(),
        ),
      ],
    );

    final viewModel = container.read(loginViewModelProvider.notifier);

    await viewModel.login(email: 'email@gmail.com', password: '123123');
    expect(
      viewModel.state.status,
      LoginStatus.success,
    );
  });
}
