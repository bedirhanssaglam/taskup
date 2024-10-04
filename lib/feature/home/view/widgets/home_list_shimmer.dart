part of '../home_view.dart';

final class _HomeListShimmer extends StatelessWidget {
  const _HomeListShimmer();

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
