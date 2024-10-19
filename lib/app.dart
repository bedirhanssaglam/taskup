import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';
import 'package:task_management/product/init/navigation/navigation_service.dart';
import 'package:task_management/product/init/theme/manager/dark_theme_manager.dart';
import 'package:task_management/product/init/theme/manager/light_theme_manager.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';
import 'package:task_management/product/state/app/app_state.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';
import 'package:task_management/product/utility/enums/cache_paths.dart';
import 'package:task_management/product/utility/mixins/app_provider_mixin.dart';

part 'app_mixin.dart';

final class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App>
    with AppProviderMixin<App>, _AppMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      navigatorKey: NavigationService().navigatorKey,
      initialRoute: initialRoute,
      theme: LightThemeManager().themeData,
      darkTheme: DarkThemeManager().themeData,
      themeMode: themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
