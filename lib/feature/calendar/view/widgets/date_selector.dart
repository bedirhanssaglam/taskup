import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/tap_area/tap_area.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/date_time_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    required this.currentDate,
    required this.onDateSelected,
    super.key,
  });

  final DateTime currentDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime _visibleMonth;
  late DateTime _selectedDate;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _visibleMonth = DateTime(widget.currentDate.year, widget.currentDate.month);
    _selectedDate = widget.currentDate;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateMonth(int monthOffset) {
    setState(() {
      _visibleMonth =
          DateTime(_visibleMonth.year, _visibleMonth.month + monthOffset);
      _selectedDate = DateTime(_visibleMonth.year, _visibleMonth.month);
      widget.onDateSelected(_selectedDate);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  List<DateTime> _generateMonthDates(DateTime month) {
    final start = DateTime(month.year, month.month);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    return List.generate(
        daysInMonth, (index) => start.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final dates = _generateMonthDates(_visibleMonth);

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
              Text(
                _visibleMonth.formatMonthAndYear,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
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
              final isSelected = date.isSameDate(_selectedDate);
              return TapArea(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                    widget.onDateSelected(date);
                  });
                },
                child: _DateTile(date: date, isSelected: isSelected),
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
            style: context.textTheme.bodyMedium?.copyWith(
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
