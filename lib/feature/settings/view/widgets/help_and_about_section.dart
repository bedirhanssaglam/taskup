part of '../settings_view.dart';

final class _HelpAndAboutSection extends StatelessWidget {
  const _HelpAndAboutSection();

  @override
  Widget build(BuildContext context) {
    return AdaptiveListSection(
      children: [
        AppListTile(
          onTap: () {},
          title: LocaleKeys.settings_helpAndFeedback,
          leading: Icons.message,
          leadingColor: context.colorScheme.secondary,
          trailing: const CupertinoListTileChevron(),
        ),
        AppListTile(
          onTap: () {},
          title: LocaleKeys.settings_about,
          leading: Icons.info_outline,
          leadingColor: context.colorScheme.surfaceTint,
          trailing: const CupertinoListTileChevron(),
          additionalInfoText: 'v1.0.0',
        ),
      ],
    );
  }
}
