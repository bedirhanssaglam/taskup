import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/app.dart';
import 'package:task_management/product/init/app_initialize.dart';
import 'package:task_management/product/init/localization/product_localization.dart';
import 'package:widget/widget.dart';

Future<void> main() async {
  await AppInitialize.initialize();

  runApp(
    ProductLocalization(
      child: const ProviderScope(child: _MyApp()),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const AppResponsive(
        child: App(),
      ),
    );
  }
}
