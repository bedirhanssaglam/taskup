part of '../calendar_view.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    required this.currentDate,
    required this.onDateSelected,
    super.key,
  });
  final DateTime currentDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    final dates = List<DateTime>.generate(
      30,
      (index) => DateTime.now().add(Duration(days: index)),
    );

    return Column(
      children: [
        Padding(
          padding: const AppPadding.smallAll(),
          child: Text(
            currentDate.formatMonthAndYear,
            style: context.textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSelected = date.isSameDate(currentDate);
              return TapArea(
                onTap: () => onDateSelected(date),
                child: _DateTile(date: date, isSelected: isSelected),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({
    required this.date,
    required this.isSelected,
  });

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.circularMedium(),
        color: isSelected
            ? context.colorScheme.primary
            : context.colorScheme.outlineVariant,
      ),
      padding: const AppPadding.mediumAll(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.formatDayOfWeek,
            style: context.textTheme.bodyLarge?.copyWith(
              color: isSelected
                  ? context.colorScheme.background
                  : context.colorScheme.onBackground,
            ),
          ),
          WidgetSizes.spacingXSs.verticalSpace,
          Text(
            date.formatDayOfMonth,
            style: context.textTheme.bodyLarge?.copyWith(
              color: isSelected
                  ? context.colorScheme.background
                  : context.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
