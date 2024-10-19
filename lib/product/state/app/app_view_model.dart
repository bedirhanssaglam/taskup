import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/service/auth/auth_service.dart';
import 'package:task_management/product/state/app/app_state.dart';

class AppViewModel extends StateNotifier<AppState> {
  AppViewModel(this._authService)
      : super(
          _authService.currentUser.isNotEmpty
              ? AppState.authenticated(
                  _authService.currentUser,
                )
              : const AppState.unauthenticated(),
        ) {
    _userSubscription = _authService.account.listen(_onUserChanged);
  }

  final AuthService _authService;
  late final StreamSubscription<Account> _userSubscription;

  void _onUserChanged(Account user) {
    state = user.isNotEmpty
        ? AppState.authenticated(
            user,
          )
        : const AppState.unauthenticated();
  }

  Future<void> logout() async {
    await _authService.logOut();
    state = const AppState.unauthenticated();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }
}
