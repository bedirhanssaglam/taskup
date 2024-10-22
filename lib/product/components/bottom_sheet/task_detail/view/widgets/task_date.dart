part of '../task_detail_bottom_sheet.dart';

final class _TaskDate extends StatelessWidget {
  const _TaskDate({
    required this.date,
  });

  final Timestamp? date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.icons.calendar.colored(context.colorScheme.primary),
        WidgetSizes.spacingXxs.horizontalSpace,
        Text(
          date?.convertDate ?? '',
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
