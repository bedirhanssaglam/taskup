part of '../tasks_view.dart';

final class _TaskListShimmer extends StatelessWidget {
  const _TaskListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 12,
      padding: const AppPadding.smallAll(),
      itemBuilder: (context, index) => const ShimmerEffect(),
      separatorBuilder: (context, index) => WidgetSizes.spacingXs.verticalSpace,
    );
  }
}
