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

    return AspectRatio(
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
    );
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
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Indicator(
          color: Color(0xFF6C63FF),
          text: LocaleKeys.dashboard_inProgress,
        ),
        Padding(
          padding: AppPadding.smallVertical(),
          child: Indicator(
            color: Color(0xFFEA7C30),
            text: LocaleKeys.dashboard_thingsToDo,
          ),
        ),
        Indicator(
          color: Color(0xFFEB5757),
          text: LocaleKeys.dashboard_pastDates,
        ),
        Padding(
          padding: AppPadding.smallVertical(),
          child: Indicator(
            color: Color(0xFF27AE60),
            text: LocaleKeys.dashboard_completed,
          ),
        ),
      ],
    );
  }
}
