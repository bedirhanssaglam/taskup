import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task_management/product/utility/enums/task_statistics.dart';

final class PieChartWidget extends StatefulWidget {
  const PieChartWidget({
    required this.completedPercentage,
    required this.inProgressPercentage,
    required this.overduePercentage,
    required this.upcomingPercentage,
    super.key,
  });

  final double completedPercentage;
  final double inProgressPercentage;
  final double overduePercentage;
  final double upcomingPercentage;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  final ValueNotifier<int> touchedIndexNotifier = ValueNotifier<int>(-1);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: touchedIndexNotifier,
      builder: (context, touchedIndex, child) {
        return PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndexNotifier.value = -1;
                  return;
                }
                touchedIndexNotifier.value =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              },
            ),
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 40,
            sections: showingSections(touchedIndex),
          ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections(int touchedIndex) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 14.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: TaskStatistics.inProgress.color,
            value: widget.inProgressPercentage,
            title: '${widget.inProgressPercentage.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: TaskStatistics.completed.color,
            value: widget.completedPercentage,
            title: '${widget.completedPercentage.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: TaskStatistics.pastDate.color,
            value: widget.overduePercentage,
            title: '${widget.overduePercentage.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: TaskStatistics.toDo.color,
            value: widget.upcomingPercentage,
            title: '${widget.upcomingPercentage.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  @override
  void dispose() {
    touchedIndexNotifier.dispose();
    super.dispose();
  }
}
