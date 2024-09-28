part of '../register_view.dart';

final class _RegisterError extends StatelessWidget {
  const _RegisterError({
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
