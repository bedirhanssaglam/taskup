import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

class PriorityDialog extends StatelessWidget {
  const PriorityDialog({
    required this.selectedPriority,
    required this.onPrioritySelected,
    super.key,
  });
  final int? selectedPriority;
  final void Function(int) onPrioritySelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showPriorityDialog(context),
      icon: Assets.icons.flag.colored(context.colorScheme.onBackground),
    );
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
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    final priority = index + 1;
                    return GestureDetector(
                      onTap: () {
                        onPrioritySelected(priority);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedPriority == priority
                              ? context.colorScheme.primary
                              : context.colorScheme.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.flag.colored(
                                selectedPriority == priority
                                    ? context.colorScheme.background
                                    : context.colorScheme.primary,
                              ),
                              Text(
                                '$priority',
                                style: TextStyle(
                                  color: selectedPriority == priority
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
