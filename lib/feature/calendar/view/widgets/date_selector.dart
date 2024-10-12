import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/tap_area/tap_area.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/date_time_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    required this.currentDate,
    required this.onDateSelected,
    required this.dates,
    required this.onMonthChanged,
    required this.isNextMonthAllowed,
    required this.isPreviousMonthAllowed,
    super.key,
  });
  final DateTime currentDate;
  final ValueChanged<DateTime> onDateSelected;
  final List<DateTime> dates;
  final ValueChanged<DateTime> onMonthChanged;
  final bool isNextMonthAllowed;
  final bool isPreviousMonthAllowed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Geri butonu sadece izin veriliyorsa aktif olacak
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: isPreviousMonthAllowed
                  ? () {
                      final previousMonth = DateTime(
                        currentDate.year,
                        currentDate.month - 1,
                      );
                      onMonthChanged(previousMonth);
                    }
                  : null, // Sınır dışında olduğunda buton devre dışı
            ),
            Padding(
              padding: const AppPadding.smallAll(),
              child: Text(
                currentDate.formatMonthAndYear,
                style: context.textTheme.headlineSmall,
              ),
            ),
            // İleri butonu sadece izin veriliyorsa aktif olacak
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: isNextMonthAllowed
                  ? () {
                      final nextMonth = DateTime(
                        currentDate.year,
                        currentDate.month + 1,
                      );
                      onMonthChanged(nextMonth);
                    }
                  : null, // Sınır dışında olduğunda buton devre dışı
            ),
          ],
        ),
        SizedBox(
          height: WidgetSizes.spacingXxl10.w,
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
        color: isSelected ? context.colorScheme.primary : context.colorScheme.outlineVariant,
      ),
      padding: const AppPadding.mediumAll(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.formatDayOfWeek,
            style: context.textTheme.bodyMedium?.copyWith(
              color: isSelected ? context.colorScheme.background : context.colorScheme.onBackground,
            ),
          ),
          WidgetSizes.spacingXSs.verticalSpace,
          Text(
            date.formatDayOfMonth,
            style: context.textTheme.bodyLarge?.copyWith(
              color: isSelected ? context.colorScheme.background : context.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
