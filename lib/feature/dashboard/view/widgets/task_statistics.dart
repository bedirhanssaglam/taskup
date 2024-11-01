// ignore_for_file: omit_local_variable_types

part of '../dashboard_view.dart';

final class _TaskStatistics extends StatelessWidget {
  const _TaskStatistics({
    required this.completedCount,
    required this.inProgressCount,
    required this.overdueCount,
    required this.upcomingCount,
  });

  final int completedCount;
  final int inProgressCount;
  final int overdueCount;
  final int upcomingCount;

  @override
  Widget build(BuildContext context) {
    final int totalCount =
        completedCount + inProgressCount + overdueCount + upcomingCount;
    final double completedPercentage =
        totalCount > 0 ? (completedCount / totalCount) * 100 : 0;
    final double inProgressPercentage =
        totalCount > 0 ? (inProgressCount / totalCount) * 100 : 0;
    final double overduePercentage =
        totalCount > 0 ? (overdueCount / totalCount) * 100 : 0;
    final double upcomingPercentage =
        totalCount > 0 ? (upcomingCount / totalCount) * 100 : 0;

    return totalCount != 0
        ? AspectRatio(
            aspectRatio: 2,
            child: Row(
              children: <Widget>[
                WidgetSizes.spacingMx.verticalSpace,
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: PieChartWidget(
                      completedPercentage: completedPercentage,
                      inProgressPercentage: inProgressPercentage,
                      overduePercentage: overduePercentage,
                      upcomingPercentage: upcomingPercentage,
                    ),
                  ),
                ),
                WidgetSizes.spacingXl.horizontalSpace,
                _StatisticsIndicators(
                  completedPercentage: completedPercentage,
                  inProgressPercentage: inProgressPercentage,
                  overduePercentage: overduePercentage,
                  upcomingPercentage: upcomingPercentage,
                ),
                WidgetSizes.spacingMx.horizontalSpace,
              ],
            ),
          )
        : const _EmptyStatisticWidget();
  }
}

final class _StatisticsIndicators extends StatelessWidget {
  const _StatisticsIndicators({
    required this.completedPercentage,
    required this.inProgressPercentage,
    required this.overduePercentage,
    required this.upcomingPercentage,
  });
  final double completedPercentage;
  final double inProgressPercentage;
  final double overduePercentage;
  final double upcomingPercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Indicator(
          color: TaskStatistics.inProgress.color,
          text: TaskStatistics.inProgress.text,
        ),
        Padding(
          padding: const AppPadding.smallVertical(),
          child: Indicator(
            color: TaskStatistics.toDo.color,
            text: TaskStatistics.toDo.text,
          ),
        ),
        Indicator(
          color: TaskStatistics.pastDate.color,
          text: TaskStatistics.pastDate.text,
        ),
        Padding(
          padding: const AppPadding.smallVertical(),
          child: Indicator(
            color: TaskStatistics.completed.color,
            text: TaskStatistics.completed.text,
          ),
        ),
      ],
    );
  }
}

final class _EmptyStatisticWidget extends StatelessWidget {
  const _EmptyStatisticWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.emptyStatistic.show(
          height: WidgetSizes.spacingXxl12.h,
        ),
        WidgetSizes.spacingXs.verticalSpace,
        LocaleText(
          LocaleKeys.dashboard_addYourTasksAndSeeProgress,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
