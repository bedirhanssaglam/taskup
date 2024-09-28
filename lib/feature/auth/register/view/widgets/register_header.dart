part of '../register_view.dart';

final class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetSizes.spacingXxl7.verticalSpace,
        Assets.icons.appIcon.show(),
        LocaleText(
          LocaleKeys.register_title,
          style: context.textTheme.headlineSmall,
        ),
        WidgetSizes.spacingXxl.verticalSpace,
      ],
    );
  }
}
