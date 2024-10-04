import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';

final class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    this.padding = 2,
    this.height = .07,
    this.width = 1,
    this.child,
  });

  final Widget? child;
  final double height;
  final double width;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding.w),
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.onSurfaceVariant.withOpacity(.1),
        highlightColor: context.colorScheme.outlineVariant.withOpacity(.3),
        child: child ??
            Card(
              color: context.colorScheme.primary,
              child: SizedBox(
                height: height.sh,
                width: width.sw,
              ),
            ),
      ),
    );
  }
}
