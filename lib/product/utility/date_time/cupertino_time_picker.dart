part of 'date_time_picker.dart';

final class _CupertinoTimePickerWidget extends StatelessWidget {
  const _CupertinoTimePickerWidget({
    required this.onDateTimeChanged,
  });

  final void Function(DateTime) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: const EdgeInsets.only(top: 6),
      color: context.colorScheme.background,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CupertinoButton(
              onPressed: Navigator.of(context).pop,
              child: LocaleText(LocaleKeys.addTask_save),
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: onDateTimeChanged,
            ),
          ),
        ],
      ),
    );
  }
}
