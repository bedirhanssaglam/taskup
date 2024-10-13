part of '../dashboard_view.dart';

final class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
  });

  final String title;
  final String value;
  final String percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .45.sw,
      padding: const AppPadding.mediumAll(),
      decoration: BoxDecoration(
        color: context.colorScheme.outlineVariant,
        borderRadius: AppBorderRadius.circularBig(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocaleText(
            title,
            style: context.textTheme.bodyMedium,
          ),
          WidgetSizes.spacingXs.verticalSpace,
          Text(
            value,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
