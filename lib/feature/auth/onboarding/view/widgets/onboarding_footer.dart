part of '../onboarding_view.dart';

final class _OnboardingFooter extends StatelessWidget {
  const _OnboardingFooter({
    required this.currentPage,
    required this.nextPage,
    required this.previousPage,
  });

  final int currentPage;
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: AppConstants.onboardingItems
                .map(
                  (widget) => AnimatedContainer(
                    duration: Durations.medium2,
                    margin: EdgeInsets.only(right: 3.w),
                    height: 5.h,
                    width: AppConstants.onboardingItems.indexOf(widget) ==
                            currentPage
                        ? 24.w
                        : 12.w,
                    decoration: BoxDecoration(
                      color: AppConstants.onboardingItems.indexOf(widget) ==
                              currentPage
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurfaceVariant,
                      borderRadius: AppBorderRadius.circularSmall(),
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: currentPage > 0,
                child: AppTextButton(
                  onPressed: previousPage,
                  text: LocaleKeys.back,
                ),
              ),
              AppTextButton(
                onPressed: () {
                  if (currentPage < AppConstants.onboardingItems.length - 1) {
                    nextPage();
                  } else {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  }
                },
                text: currentPage == AppConstants.onboardingItems.length - 1
                    ? LocaleKeys.letsDoIt
                    : LocaleKeys.next,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
