// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/components/bottom_sheet/language/language_bottom_sheet.dart';
import 'package:task_management/product/components/dialog/delete_account_dialog.dart';
import 'package:task_management/product/components/dialog/log_out_dialog.dart';
import 'package:task_management/product/components/list_section/adaptive_list_section.dart';
import 'package:task_management/product/components/list_section/app_list_tile.dart';
import 'package:task_management/product/components/snackbar/app_snack_bar.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/init/localization/product_localization.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';
import 'package:task_management/product/utility/enums/locale_enums.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/mixins/app_provider_mixin.dart';

part './mixin/settings_view_mixin.dart';
part './widgets/delete_and_log_out_section.dart';
part './widgets/help_and_about_section.dart';
part './widgets/settings_app_bar.dart';

final class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView>
    with AppProviderMixin<SettingsView>, _SettingsViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SettingsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptiveListSection(
              headerText: LocaleKeys.settings_generalSettings,
              footerText: LocaleKeys.settings_customizeUserInterface,
              children: [
                AppListTile(
                  onTap: () {
                    LanguageBottomSheet.show(
                      context,
                      title: LocaleKeys.settings_displayLanguage,
                      onTurkishTapped: () {
                        ProductLocalization.updateLanguage(
                          context,
                          value: Locales.tr,
                        );
                        Navigator.pop(context);
                        mainViewModel.changePage(0);
                      },
                      onEnglishTapped: () {
                        ProductLocalization.updateLanguage(
                          context,
                          value: Locales.en,
                        );
                        Navigator.pop(context);
                        mainViewModel.changePage(0);
                      },
                    );
                  },
                  title: LocaleKeys.settings_language,
                  leading: Icons.language,
                  leadingColor: context.colorScheme.primary,
                  trailing: const CupertinoListTileChevron(),
                  additionalInfoText: ProductLocalization.getCurrentLanguage(
                    context,
                  ),
                ),
                AppListTile(
                  title: LocaleKeys.settings_darkTheme,
                  leading: Icons.brightness_4_outlined,
                  leadingColor: context.colorScheme.outline,
                  trailing: Switch.adaptive(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      mainViewModel.changePage(0);
                      appThemeViewModel.toggleTheme();
                    },
                  ),
                ),
                AppListTile(
                  title: LocaleKeys.settings_soundEffects,
                  leading: Icons.music_note,
                  leadingColor: context.colorScheme.inversePrimary,
                  trailing: Switch.adaptive(
                    value: soundEffect,
                    onChanged: (value) {
                      mainViewModel.changePage(0);
                      soundEffectViewModel.toggleSoundEffect();
                      AppSnackBar.show(
                        context,
                        text: LocaleKeys.settings_soundEffectsPreferenceUpdated,
                      );
                    },
                  ),
                ),
              ],
            ),
            const _HelpAndAboutSection(),
            _DeleteAndLogOutSection(
              onDeleteAccountTap: () async {
                final isConfirm = await DeleteAccountDialog.show(context);
                if (isConfirm ?? false) {
                  await deleteUser();
                  await context.navigateToStartingView();
                }
              },
              onLogOutTap: () async {
                final isConfirm = await LogOutDialog.show(context);
                if (isConfirm ?? false) {
                  await logOut();
                  await context.navigateToStartingView();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
