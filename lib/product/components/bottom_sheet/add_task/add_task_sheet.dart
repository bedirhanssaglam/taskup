import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/date_time_selector.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/priority_dialog.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/service/speech_recognation/speech_recognation_service.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
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

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet>
    with _AddTaskMixin {
  @override
  Widget build(BuildContext context) {
    final keyboardPadding = MediaQuery.of(context).viewInsets.bottom;

    return Material(
      borderRadius: const AppBorderRadius.onlyTop(),
      child: Padding(
        padding: EdgeInsets.only(bottom: keyboardPadding),
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
                        icon: const Icon(Icons.mic_none),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        DateTimeSelector(
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
                            return PriorityDialog(
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

mixin _AddTaskMixin on State<AddTaskBottomSheet> {
  final ValueNotifier<String> descriptionNotifier = ValueNotifier<String>('');
  final ValueNotifier<int?> priorityNotifier = ValueNotifier<int?>(null);
  final SpeechRecognitionService speechService = SpeechRecognitionService();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descriptionController.text = descriptionNotifier.value;
    descriptionNotifier.addListener(() {
      descriptionController.text = descriptionNotifier.value;
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}
