part of '../onboarding_view.dart';

mixin _OnboardingViewMixin on ConsumerState<OnboardingView> {
  final PageController _pageController = PageController();

  OnboardingViewModel get _onboardingViewModel => ref.read(
        AuthProviderItems.onboardingViewModel.notifier,
      );

  int get currentPage => ref.watch(AuthProviderItems.onboardingViewModel);

  void setPage(int page) => _onboardingViewModel.setPage(page);

  void previousPage() {
    _onboardingViewModel.previousPage();
    _pageController.previousPage(
      duration: Durations.medium2,
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    _onboardingViewModel.nextPage();
    _pageController.nextPage(
      duration: Durations.medium2,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
