import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/auth/login/view_model/login_view_model.dart';
import 'package:task_management/feature/auth/register/view_model/register_view_model.dart';
import 'package:task_management/feature/main/view_model/main_view_model.dart';
import 'package:task_management/product/components/bottom_sheet/filter/view_model/filter_view_model.dart';
import 'package:task_management/product/init/navigation/navigation_service.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/service/auth/auth_service.dart';
import 'package:task_management/product/service/base/firebase_service.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/state/app_state.dart';
import 'package:task_management/product/state/app_view_model.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';

class ProductProviderItems {
  static final authServiceProvider = Provider<AuthService>((ref) {
    return AuthService();
  });

  static final navigationService = Provider<NavigationService>((ref) {
    return NavigationService();
  });

  static final appStateProvider =
      StateNotifierProvider<AppViewModel, AppState>((
    ref,
  ) {
    final authService = ref.watch(authServiceProvider);
    return AppViewModel(authService);
  });

  static final loginViewModel = Provider<LoginViewModel>((
    ref,
  ) {
    return LoginViewModel();
  });

  static final registerViewModel = Provider<RegisterViewModel>((
    ref,
  ) {
    return RegisterViewModel();
  });
  // Define a provider for FirebaseService
  static final firebaseServiceProvider = Provider<FirebaseService>((ref) {
    return FirebaseService();
  });

  static final taskServiceProvider = Provider<TaskService>((ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return TaskService(firestoreService: firebaseService);
  });

  static final mainViewModel = StateNotifierProvider<MainViewModel, int>((ref) {
    return MainViewModel();
  });

  static final tasksProvider = FutureProvider<List<Task>>((ref) async {
    final tasks =
        await ref.read(ProductProviderItems.taskServiceProvider).getAllTasks();
    return tasks.map((task) {
      return Task(
        title: task.title,
        description: task.description,
        date: task.date,
        category: task.category,
        priority: task.priority,
      );
    }).toList();
  });

  static final filterCriteriaProvider =
      StateNotifierProvider<FilterViewModel, FilterCriteria>(
    (ref) => FilterViewModel(),
  );
}
