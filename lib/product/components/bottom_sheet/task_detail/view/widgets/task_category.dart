part of '../task_detail_bottom_sheet.dart';

final class _TaskCategory extends StatelessWidget {
  const _TaskCategory({
    this.category,
  });

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const AppPadding.smallAll(),
          decoration: BoxDecoration(
            color: category?.color,
            borderRadius: AppBorderRadius.circularSmall(),
          ),
          child: category?.icon.show(height: WidgetSizes.spacingXl.h),
        ),
        WidgetSizes.spacingXxs.horizontalSpace,
        Text(
          category?.name ?? '',
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
