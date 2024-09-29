part of '../bottom_sheet/add_task/view/add_task_sheet.dart';

final class _PriorityDialog extends StatelessWidget {
  const _PriorityDialog({
    required this.selectedPriority,
    required this.onPrioritySelected,
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
                          borderRadius: AppBorderRadius.circularSmall(),
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
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: selectedPriority == priority
                                      ? context.colorScheme.background
                                      : context.colorScheme.primary,
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
