part of '../task_detail_bottom_sheet.dart';

final class _TaskDivider extends StatelessWidget {
  const _TaskDivider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetSizes.spacingXSs.verticalSpace,
        const Divider(),
        WidgetSizes.spacingXSs.verticalSpace,
      ],
    );
  }
}
