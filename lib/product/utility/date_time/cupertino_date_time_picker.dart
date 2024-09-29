part of 'date_time_picker.dart';

final class _CupertinoDatePickerWidget extends StatelessWidget {
  const _CupertinoDatePickerWidget({
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                onPressed: Navigator.of(context).pop,
                child: LocaleText(
                  LocaleKeys.cancelText.locale,
                ),
              ),
              CupertinoButton(
                onPressed: Navigator.of(context).pop,
                child: LocaleText(
                  LocaleKeys.addTask_chooseTime.locale,
                ),
              ),
            ],
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day - 1,
              ),
              onDateTimeChanged: onDateTimeChanged,
            ),
          ),
        ],
      ),
    );
  }
}
