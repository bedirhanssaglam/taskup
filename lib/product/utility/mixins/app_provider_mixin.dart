import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/service/auth/auth_service.dart';
import 'package:task_management/product/state/app_state.dart';
import 'package:task_management/product/state/app_view_model.dart';
import 'package:task_management/product/state/product_provider_items.dart';

mixin AppProviderMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  AuthService get authService => ref.read(
        ProductProviderItems.authServiceProvider,
      );

  AppViewModel get appViewModel => ref.read(
        ProductProviderItems.appStateProvider.notifier,
      );
  AppState get appState => ref.watch(ProductProviderItems.appStateProvider);
}
