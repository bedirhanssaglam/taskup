import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/utility/mixins/app_provider_mixin.dart';

final class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView>
    with AppProviderMixin<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch.adaptive(
          value: themeMode == ThemeMode.dark,
          onChanged: (value) {
            appThemeViewModel.toggleTheme();
          },
        ),
      ),
    );
  }
}
