part of '../tasks_view.dart';

final class _AddTaskButton extends StatelessWidget {
  const _AddTaskButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => AddTaskBottomSheet.show(context),
      backgroundColor: context.colorScheme.primary,
      child: const Icon(Icons.add),
    );
  }
}
