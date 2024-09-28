part of '../home_view.dart';

final class _AddTaskButton extends StatelessWidget {
  const _AddTaskButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: context.colorScheme.primary,
      child: const Icon(Icons.add),
    );
  }
}
