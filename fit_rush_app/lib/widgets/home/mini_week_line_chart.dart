import 'package:fit_rush_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MiniWeekLineChart extends StatelessWidget {
  final List<int> weeklySteps;

  const MiniWeekLineChart({super.key, required this.weeklySteps});

  @override
  Widget build(BuildContext context) {
    final maxY = weeklySteps.reduce((a, b) => a > b ? a : b).toDouble();
    final weekdays = _generateLast7DaysLabels();

    return _buildLineChart(maxY, weekdays);
  }

  Widget _buildLineChart(double maxY, List<String> weekdays) {
    return SizedBox(
      height: 80,
      child: LineChart(
        LineChartData(
          backgroundColor: kBackgroundColor,
          maxY: maxY + 1000,
          minY: 0,
          lineBarsData: [_buildLineChartBarData()],
          titlesData: _buildChartTitles(weekdays),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          extraLinesData: _buildChartVerticalDividers(),
        ),
      ),
    );
  }

  ExtraLinesData _buildChartVerticalDividers() {
    return ExtraLinesData(
      verticalLines: List.generate(weeklySteps.length - 1, (index) {
        return VerticalLine(
          // Position of vertical line between days
          x: (index + 1).toDouble(),
          color: Colors.grey,
          strokeWidth: 1,
          dashArray: [4, 4],
        );
      }),
    );
  }

  FlTitlesData _buildChartTitles(List<String> weekdays) {
    return FlTitlesData(
      bottomTitles: _buildChartBottomTitles(weekdays),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  AxisTitles _buildChartBottomTitles(List<String> weekdays) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 28,
        getTitlesWidget: (value, _) {
          int index = value.toInt();
          if (index >= 0 && index < weekdays.length) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                weekdays[index],
                style: const TextStyle(fontSize: 10),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      spots: List.generate(
        weeklySteps.length,
        (index) => FlSpot(index.toDouble(), weeklySteps[index].toDouble()),
      ),
      isCurved: true,
      barWidth: 2,
      color: kBlueColor,
      dotData: FlDotData(show: true),
    );
  }

  List<String> _generateLast7DaysLabels() {
    final today = DateTime.now();
    return List.generate(7, (i) {
      final date = today.subtract(Duration(days: i));
      return _getWeekdayName(date.weekday);
    }).reversed.toList();
  }

  String _getWeekdayName(int weekdayNumber) {
    const names = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return names[weekdayNumber - 1];
  }
}
