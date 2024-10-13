part of '../dashboard_view.dart';

final class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.count,
    required this.color,
    required this.onTap,
  });

  final String title;
  final int count;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TapArea(
      onTap: onTap,
      child: Container(
        height: .1.sh,
        padding: const AppPadding.bigAll(),
        decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count.toString(),
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            WidgetSizes.spacingXs.verticalSpace,
            LocaleText(
              title,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
