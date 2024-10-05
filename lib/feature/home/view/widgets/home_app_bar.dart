part of '../home_view.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({
    required this.userFullName,
    required this.onFilterTapped,
    required this.onLogoutTapped,
  });

  final String? userFullName;
  final VoidCallback onFilterTapped;
  final VoidCallback onLogoutTapped;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.hello.localeArgs([userFullName ?? '']),
        style: context.textTheme.titleLarge,
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: onFilterTapped,
          icon: Assets.icons.filter.colored(context.colorScheme.primary),
        ),
        IconButton(
          onPressed: onLogoutTapped,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
