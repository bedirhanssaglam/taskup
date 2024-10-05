part of '../home_view.dart';

final class _EmptyTaskWidget extends StatelessWidget {
  const _EmptyTaskWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.emptyTask.show(),
          LocaleText(
            LocaleKeys.home_whatDoYouWantToDoToday,
            style: context.textTheme.titleLarge,
          ),
          LocaleText(
            LocaleKeys.home_tapPlusButton,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
