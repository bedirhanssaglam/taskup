part of '../task_detail_bottom_sheet.dart';

final class _TaskTitleAndDescription extends StatelessWidget {
  const _TaskTitleAndDescription({
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title ?? '',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
        ),
        WidgetSizes.spacingXxs.verticalSpace,
        Text(
          task.description ?? '',
          style: context.textTheme.bodyLarge,
          maxLines: 5,
        ),
      ],
    );
  }
}
