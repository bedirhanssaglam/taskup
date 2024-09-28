part of '../login_view.dart';

final class _LoginError extends StatelessWidget {
  const _LoginError({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetSizes.spacingM.verticalSpace,
        Text(
          errorMessage,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.error,
          ),
        ),
      ],
    );
  }
}
