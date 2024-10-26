part of '../settings_view.dart';

final class _SettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SettingsAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: LocaleText(
        LocaleKeys.bottomNavBar_settings,
        style: context.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
