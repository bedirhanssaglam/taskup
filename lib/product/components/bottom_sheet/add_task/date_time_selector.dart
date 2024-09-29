// ignore_for_file: use_build_context_synchronously

part of 'add_task_sheet.dart';

final class _DateTimeSelector extends StatelessWidget {
  const _DateTimeSelector({required this.onDateTimeSelected});
  final void Function(DateTime) onDateTimeSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _changeSelectedDate(context),
      icon: Assets.icons.timer.colored(context.colorScheme.onBackground),
    );
  }

  Future<void> _changeSelectedDate(BuildContext context) async {
    final selectedDate = await DateTimePicker.pickDate(context);
    if (selectedDate != null) {
      final selectedTime = await DateTimePicker.pickTime(context);
      if (selectedTime != null) {
        final finalDateTime = DateTimePicker.combineDateAndTime(
          selectedDate,
          selectedTime,
        );
        onDateTimeSelected(finalDateTime);
      }
    }
  }
}
