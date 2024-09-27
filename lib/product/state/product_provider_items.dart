import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/service/auth/auth_service.dart';
import 'package:task_management/product/service/base/firebase_service.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/state/app_state.dart';
import 'package:task_management/product/state/app_view_model.dart';

class ProductProviderItems {
  static final authServiceProvider = Provider<AuthService>((ref) {
    return AuthService();
  });

  static final appStateProvider =
      StateNotifierProvider<AppViewModel, AppState>((
    ref,
  ) {
    final authService = ref.watch(authServiceProvider);
    return AppViewModel(authService);
  });

  // Define a provider for FirebaseService
  static final firebaseServiceProvider = Provider<FirebaseService>((ref) {
    return FirebaseService();
  });

  static final taskServiceProvider = Provider<TaskService>((ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return TaskService(firestoreService: firebaseService);
  });
}
