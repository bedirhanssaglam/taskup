import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widget/src/utility/enums/design_size.dart';

/// Custom responsive for project
class AppResponsive extends StatelessWidget {
  const AppResponsive({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DesignSize.designSize.size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, _) => child,
    );
  }
}
