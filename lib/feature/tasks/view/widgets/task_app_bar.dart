part of '../tasks_view.dart';

final class _TaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _TaskAppBar({
    required this.onFilterTapped,
  });

  final VoidCallback onFilterTapped;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: LocaleText(
        LocaleKeys.bottomNavBar_tasks,
        style: context.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onFilterTapped,
          icon: Assets.icons.filter.colored(context.colorScheme.primary),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
