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
    if (appState.status.isAuthenticated) {
      initialRoute = AppRoutes.main;
    } else {
      final cacheManager = HiveCacheManager();
      final passStarting =
          await cacheManager.getData(CachePaths.passStarting.value) as bool?;
      if (passStarting ?? false) {
        final passOnboarding = await cacheManager
            .getData(CachePaths.passOnboarding.value) as bool?;
        if (passOnboarding ?? false) {
          initialRoute = AppRoutes.login;
        } else {
          initialRoute = AppRoutes.onboarding;
        }
      } else {
        initialRoute = AppRoutes.starting;
      }
    }
    if (mounted) await Navigator.pushReplacementNamed(context, initialRoute!);
  }
}
