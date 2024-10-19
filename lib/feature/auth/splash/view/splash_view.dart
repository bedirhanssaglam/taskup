import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/components/loading/app_loading.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';
import 'package:task_management/product/state/app/app_state.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';
import 'package:task_management/product/utility/enums/cache_paths.dart';

part './mixin/splash_view_mixin.dart';

final class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> with _SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLoading(),
      ),
    );
  }
}
