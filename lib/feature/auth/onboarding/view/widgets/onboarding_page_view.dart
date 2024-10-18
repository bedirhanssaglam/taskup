part of '../onboarding_view.dart';

final class _OnboardingPageView extends StatelessWidget {
  const _OnboardingPageView({
    required this.pageController,
    required this.onPageChanged,
  });

  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: AppConstants.onboardingItems.length,
      itemBuilder: (context, index) {
        final item = AppConstants.onboardingItems[index];
        return _OnboardingContent(
          imagePath: item.imagePath,
          title: item.title,
          description: item.description,
        );
      },
    );
  }
}

final class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final AssetGenImage imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imagePath.show(
          height: .4.sh,
        ),
        WidgetSizes.spacingXxl8.verticalSpace,
        LocaleText(
          title,
          style: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        WidgetSizes.spacingXxl.verticalSpace,
        Padding(
          padding: const AppPadding.normalHorizontal(),
          child: LocaleText(
            description,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
