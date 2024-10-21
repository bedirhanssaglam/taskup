// ignore_for_file: use_build_context_synchronously

part of '../splash_view.dart';

mixin _SplashViewMixin on ConsumerState<SplashView> {
  String? initialRoute;
  AppState get appState => ref.watch(AuthProviderItems.appStateProvider);

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_setInitialRoute);
  }

  Future<void> _setInitialRoute() async {
    final cacheManager = HiveCacheManager();
    final user = await cacheManager.getData(CachePaths.user.value);
    if (user != null) {
      initialRoute = AppRoutes.main;
      await Navigator.pushReplacementNamed(context, AppRoutes.main);
    } else {
      final passStarting = await cacheManager.getData(CachePaths.passStarting.value) as bool?;
      if (passStarting ?? false) {
        final passOnboarding = await cacheManager.getData(CachePaths.passOnboarding.value) as bool?;
        if (passOnboarding ?? false) {
          initialRoute = AppRoutes.login;
        } else {
          initialRoute = AppRoutes.onboarding;
        }
      } else {
        initialRoute = AppRoutes.starting;
      }
      if (mounted) await Navigator.pushReplacementNamed(context, initialRoute!);
    }
  }
}
