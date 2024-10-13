part of '../dashboard_view.dart';

final class _DashboardAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _DashboardAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: LocaleText(
        LocaleKeys.dashboard_title,
        style: context.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
