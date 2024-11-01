part of '../settings_view.dart';

mixin _SettingsViewMixin on ConsumerState<SettingsView> {
  Future<void> logOut() async {
    await ref.read(AuthProviderItems.authServiceProvider).logOut();
  }

  Future<void> deleteUser() async {
    await ref.read(AuthProviderItems.authServiceProvider).deleteUser();
  }
}
