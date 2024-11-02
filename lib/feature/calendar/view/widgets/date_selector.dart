import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/feature/calendar/view/widgets/date_tile.dart';
import 'package:task_management/product/components/tap_area/tap_area.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/date_time_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class DateSelector extends StatefulWidget {
  const DateSelector({
    required this.currentDate,
    required this.onDateSelected,
    super.key,
  });

  final DateTime currentDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> with _DateSelectorMixin {
  @override
  Widget build(BuildContext context) {
    final dates = _visibleMonthNotifier.value.generateMonthDates;

    return Column(
      children: [
        Padding(
          padding: const AppPadding.smallAll(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconCircle(
                Icons.arrow_back_ios_new_outlined,
                context.colorScheme.primary,
                () => _updateMonth(-1),
              ),
              ValueListenableBuilder<DateTime>(
                valueListenable: _visibleMonthNotifier,
                builder: (context, visibleMonth, child) {
                  return Text(
                    visibleMonth.formatMonthAndYear,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              _buildIconCircle(
                Icons.arrow_forward_ios_outlined,
                context.colorScheme.primary,
                () => _updateMonth(1),
              ),
            ],
          ),
        ),
        SizedBox(
          height: WidgetSizes.spacingXxl10.w,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            padding: const AppPadding.smallVertical(),
            itemBuilder: (context, index) {
              final date = dates[index];
              return ValueListenableBuilder<DateTime>(
                valueListenable: _selectedDateNotifier,
                builder: (context, selectedDate, child) {
                  final isSelected = date.isSameDate(selectedDate);
                  return TapArea(
                    onTap: () {
                      _selectedDateNotifier.value = date;
                      widget.onDateSelected(date);
                    },
                    child: DateTile(date: date, isSelected: isSelected),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildIconCircle(IconData icon, Color color, VoidCallback onPressed) {
    return IconButton.filled(
      onPressed: onPressed,
      iconSize: 25.h,
      icon: Icon(icon, color: color),
      style: IconButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        shape: const CircleBorder(),
      ),
    );
  }
}

mixin _DateSelectorMixin on State<DateSelector> {
  late ValueNotifier<DateTime> _visibleMonthNotifier;
  late ValueNotifier<DateTime> _selectedDateNotifier;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _visibleMonthNotifier = ValueNotifier<DateTime>(
      DateTime(widget.currentDate.year, widget.currentDate.month),
    );
    _selectedDateNotifier = ValueNotifier<DateTime>(widget.currentDate);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _visibleMonthNotifier.dispose();
    _selectedDateNotifier.dispose();
    super.dispose();
  }

  void _updateMonth(int monthOffset) {
    _visibleMonthNotifier.value = DateTime(
      _visibleMonthNotifier.value.year,
      _visibleMonthNotifier.value.month + monthOffset,
    );
    _selectedDateNotifier.value = DateTime(
      _visibleMonthNotifier.value.year,
      _visibleMonthNotifier.value.month,
    );
    widget.onDateSelected(_selectedDateNotifier.value);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        0,
        duration: Durations.medium2,
        curve: Curves.easeInOut,
      );
    });
  }
}
