import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/auth/login/view_model/login_state.dart';
import 'package:task_management/feature/auth/login/view_model/login_view_model.dart';
import 'package:task_management/feature/auth/register/view_model/register_state.dart';
import 'package:task_management/feature/auth/register/view_model/register_view_model.dart';
import 'package:task_management/feature/tasks/view_model/task_view_model.dart';

extension RiverpodExtensions on WidgetRef {
  /// Auths
  LoginViewModel get loginViewModel => read(loginViewModelProvider.notifier);
  LoginState get loginState => watch(loginViewModelProvider);

  RegisterViewModel get registerViewModel =>
      read(registerViewModelProvider.notifier);
  RegisterState get registerState => watch(registerViewModelProvider);

  /// Task
  TaskViewModel get taskViewModel => read(taskViewModelProvider.notifier);
}
