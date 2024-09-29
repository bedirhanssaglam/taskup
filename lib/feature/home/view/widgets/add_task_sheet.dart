import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/date_time/date_time_picker.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:widget/widget.dart';

final class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await BottomSheetBase.show<void>(
      context: context,
      builder: (context) => const AddTaskBottomSheet(),
    );
  }

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  int? _selectedPriority;

  @override
  Widget build(BuildContext context) {
    final keyboardPadding = MediaQuery.of(context).viewInsets.bottom;

    return Material(
      borderRadius: const AppBorderRadius.onlyTop(),
      child: Padding(
        padding: EdgeInsets.only(bottom: keyboardPadding),
        child: Container(
          height: .4.sh,
          width: 1.sw,
          padding: const AppPadding.largeAll(),
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: const AppBorderRadius.onlyTop(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocaleText(
                  LocaleKeys.addTask_addTaskText,
                  style: context.textTheme.titleLarge,
                ),
                WidgetSizes.spacingMx.verticalSpace,
                AppTextField(
                  hintText: LocaleKeys.addTask_title.locale,
                  autofocus: true,
                ),
                WidgetSizes.spacingSs.verticalSpace,
                AppTextField(
                  hintText: LocaleKeys.addTask_description.locale,
                  maxLines: 5,
                  textInputAction: TextInputAction.done,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _selectDateTime(context);
                          },
                          icon: Assets.icons.timer.colored(
                            context.colorScheme.onBackground,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _showPriorityDialog(context);
                          },
                          icon: Assets.icons.tag.colored(
                            context.colorScheme.onBackground,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.icons.flag.colored(
                            context.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Assets.icons.send.colored(
                        context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final selectedDate = await DateTimePicker.pickDate(context);
    if (selectedDate == null) {
      log('Tarih seçilmedi.');
      return;
    }

    final selectedTime = await DateTimePicker.pickTime(context);
    if (selectedTime == null) {
      log('Saat seçilmedi.');
      return;
    }

    final finalDateTime = DateTimePicker.combineDateAndTime(
      selectedDate,
      selectedTime,
    );
    log('Selected date and time: $finalDateTime');
  }

  Future<void> _showPriorityDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: LocaleText(LocaleKeys.addTask_taskPriority),
          backgroundColor: context.colorScheme.background,
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const AppPadding.mediumAll(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    final priority = index + 1;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedPriority = priority;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedPriority == priority
                              ? context.colorScheme.primary
                              : context.colorScheme.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.flag.colored(
                                _selectedPriority == priority
                                    ? context.colorScheme.background
                                    : context.colorScheme.primary,
                              ),
                              Text(
                                '$priority',
                                style: TextStyle(
                                  color: _selectedPriority == priority
                                      ? context.colorScheme.background
                                      : context.colorScheme.primary,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            AppTextButton(
              text: LocaleKeys.addTask_save,
              onPressed: Navigator.of(context).pop,
            ),
          ],
        );
      },
    );
  }
}
