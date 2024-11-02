part of '../dashboard_view.dart';

final class _TaskSummaries extends StatelessWidget {
  const _TaskSummaries({
    required this.doingCount,
    required this.upcomingCount,
    required this.overdueCount,
    required this.completedCount,
  });

  final int doingCount;
  final int upcomingCount;
  final int overdueCount;
  final int completedCount;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.4 / 1,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _SummaryCard(
          title: TaskStatistics.inProgress.text,
          count: doingCount,
          color: TaskStatistics.inProgress.color,
          onTap: () {},
        ),
        _SummaryCard(
          title: TaskStatistics.toDo.text,
          count: upcomingCount,
          color: TaskStatistics.toDo.color,
          onTap: () {},
        ),
        _SummaryCard(
          title: TaskStatistics.pastDate.text,
          count: overdueCount,
          color: TaskStatistics.pastDate.color,
          onTap: () {},
        ),
        _SummaryCard(
          title: TaskStatistics.completed.text,
          count: completedCount,
          color: TaskStatistics.completed.color,
          onTap: () {},
        ),
      ],
    );
  }
}
