import 'package:easy_localization/easy_localization.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/auth/login/view/login_view.dart';
import 'package:task_management/feature/home/view/home_view.dart';
import 'package:task_management/product/init/theme/manager/dark_theme_manager.dart';
import 'package:task_management/product/init/theme/manager/light_theme_manager.dart';
import 'package:task_management/product/utility/enums/app_status.dart';
import 'package:task_management/product/utility/mixins/app_provider_mixin.dart';

final class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with AppProviderMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppStatus>(
        state: appState.status,
        onGeneratePages: _onGeneratePages,
      ),
      theme: LightThemeManager().themeData,
      darkTheme: DarkThemeManager().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }

  static List<Page<dynamic>> _onGeneratePages(
    AppStatus state,
    List<Page<dynamic>> pages,
  ) {
    switch (state) {
      case AppStatus.authenticated:
        return [LoginView.view()];
      case AppStatus.unauthenticated:
        return [HomeView.view()];
    }
  }
}
