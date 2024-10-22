import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/service/auth/auth_service.dart';
import 'package:task_management/product/state/app/app_state.dart';
import 'package:task_management/product/state/app/app_view_model.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';
import 'package:task_management/product/state/providers/product_provider_items.dart';
import 'package:task_management/product/state/theme/app_theme_view_model.dart';

mixin AppProviderMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  AuthService get authService => ref.read(
        AuthProviderItems.authServiceProvider,
      );

  AppViewModel get appViewModel => ref.read(
        AuthProviderItems.appStateProvider.notifier,
      );

  AppState get appState => ref.watch(AuthProviderItems.appStateProvider);

  AppThemeViewModel get appThemeViewModel => ref.read(
        ProductProviderItems.appThemeViewModel.notifier,
      );

  ThemeMode get themeMode => ref.watch(ProductProviderItems.appThemeViewModel);
}
