import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/service/speech_recognation/speech_recognation_service.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/date_time/date_time_picker.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:widget/widget.dart';

part 'add_task_mixin.dart';
part 'date_time_selector.dart';
part 'priority_dialog.dart';

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

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet>
    with _AddTaskMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const AppBorderRadius.onlyTop(),
      child: Padding(
        padding: EdgeInsets.only(bottom: context.keyboardPadding),
        child: Container(
          height: .45.sh,
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
                ValueListenableBuilder<String>(
                  valueListenable: descriptionNotifier,
                  builder: (context, description, child) {
                    return AppTextField(
                      hintText: LocaleKeys.addTask_description.locale,
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                      controller: descriptionController,
                      onChanged: (value) {
                        final cursorPosition =
                            descriptionController.selection.baseOffset;

                        descriptionNotifier.value = value;

                        descriptionController.selection =
                            TextSelection.fromPosition(
                          TextPosition(offset: cursorPosition),
                        );
                      },
                      suffixIcon: IconButton(
                        onPressed: () => speechService.toggleListening((
                          String result,
                        ) {
                          descriptionNotifier.value = result;
                        }),
                        icon: Icon(
                          Icons.mic_none,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _DateTimeSelector(
                          onDateTimeSelected: (DateTime dateTime) {},
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.icons.tag.colored(
                            context.colorScheme.onBackground,
                          ),
                        ),
                        ValueListenableBuilder<int?>(
                          valueListenable: priorityNotifier,
                          builder: (context, selectedPriority, child) {
                            return _PriorityDialog(
                              selectedPriority: selectedPriority,
                              onPrioritySelected: (priority) {
                                priorityNotifier.value = priority;
                              },
                            );
                          },
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
}
