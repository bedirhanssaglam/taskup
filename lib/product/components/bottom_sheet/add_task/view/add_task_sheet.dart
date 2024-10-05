// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/home/view_model/home_view_model.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view_model/add_task_status.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view_model/add_task_view_model.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/dialog/category.dart';
import 'package:task_management/product/components/dialog/category_dialog.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/service/speech_recognation/speech_recognation_service.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/date_time/date_time_picker.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:widget/widget.dart';

part '../../../dialog/date_time_selector.dart';
part '../../../dialog/priority_dialog.dart';
part 'add_task_mixin.dart';

final class AddTaskBottomSheet extends ConsumerStatefulWidget {
  const AddTaskBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await BottomSheetBase.show<void>(
      context: context,
      builder: (context) => const AddTaskBottomSheet(),
    );
  }

  @override
  ConsumerState<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends ConsumerState<AddTaskBottomSheet>
    with _AddTaskMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const AppBorderRadius.onlyTop(),
      child: Padding(
        padding: EdgeInsets.only(bottom: context.keyboardPadding),
        child: Container(
          height: 350.w,
          width: 1.sw,
          padding: const AppPadding.largeAll(),
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: const AppBorderRadius.onlyTop(),
          ),
          child: SingleChildScrollView(
            child: addTaskState.status.isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocaleText(
                        LocaleKeys.addTask_addTaskText,
                        style: context.textTheme.titleLarge,
                      ),
                      WidgetSizes.spacingMx.verticalSpace,
                      AppTextField(
                        controller: titleController,
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
                              onPressed: () =>
                                  speechService.listenVoice((String result) {
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
                                onDateTimeSelected: (DateTime dateTime) {
                                  selectedDateTime = dateTime;
                                },
                              ),
                              IconButton(
                                key: const Key('tag'),
                                onPressed: () async {
                                  selectedCategory =
                                      await showCategoryDialog(context);
                                },
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
                            onPressed: () async {
                              final task = Task(
                                title: titleController.text,
                                description: descriptionNotifier.value,
                                date: Timestamp.fromDate(selectedDateTime!),
                                category: Category(
                                  name: selectedCategory!.name.locale,
                                  color: selectedCategory!.color,
                                  icon: selectedCategory!.icon,
                                ),
                                priority: priorityNotifier.value.toString(),
                                createdAt: Timestamp.now(),
                              );
                              await addTask(task);

                              Navigator.of(context).pop();
                            },
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

  Future<Category?> showCategoryDialog(BuildContext context) async {
    return showDialog<Category>(
      context: context,
      builder: (BuildContext context) {
        return const CategoryDialog();
      },
    );
  }
}
