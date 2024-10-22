import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/state/providers/product_provider_items.dart';
import 'package:task_management/product/utility/extensions/image_extensions.dart';

final class AppLogo extends ConsumerWidget {
  const AppLogo({
    super.key,
    this.height = 150,
  });

  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(ProductProviderItems.appThemeViewModel);
    return (themeMode == ThemeMode.dark
            ? Assets.images.appIconDark
            : Assets.images.appIconLight)
        .show(
      height: height.h,
    );
  }
}
