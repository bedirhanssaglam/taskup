part of '../settings_view.dart';

final class _DeleteAndLogOutSection extends StatelessWidget {
  const _DeleteAndLogOutSection({
    required this.onDeleteAccountTap,
    required this.onLogOutTap,
  });

  final VoidCallback onDeleteAccountTap;
  final VoidCallback onLogOutTap;

  @override
  Widget build(BuildContext context) {
    return AdaptiveListSection(
      children: [
        AppListTile(
          onTap: onDeleteAccountTap,
          title: LocaleKeys.settings_deleteAccount,
          leading: Icons.close,
          leadingColor: context.colorScheme.onSurfaceVariant,
          trailing: const CupertinoListTileChevron(),
        ),
        AppListTile(
          onTap: onLogOutTap,
          title: LocaleKeys.settings_logOut,
          leading: Icons.logout,
          leadingColor: context.colorScheme.error,
          trailing: const CupertinoListTileChevron(),
        ),
      ],
    );
  }
}
