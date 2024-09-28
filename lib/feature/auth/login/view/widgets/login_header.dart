part of '../login_view.dart';

final class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetSizes.spacingXxl12.verticalSpace,
        Assets.icons.appIcon.show(),
        RichText(
          text: TextSpan(
            style: context.textTheme.headlineLarge,
            children: [
              const TextSpan(
                text: 'Welcome to ',
              ),
              TextSpan(
                text: 'taskup!',
                style: context.textTheme.headlineLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
