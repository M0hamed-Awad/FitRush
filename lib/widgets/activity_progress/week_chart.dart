import 'package:fit_rush_app/styles/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekChart extends StatelessWidget {
  final List<num> lastSevenDaysData;
  final bool isSteps;
  const WeekChart({
    super.key,
    required this.lastSevenDaysData,
    required this.isSteps,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> weekdays = _generateLast7DaysLabels();

    final num maxDataAmount = lastSevenDaysData.reduce((a, b) => a > b ? a : b);
    final int stepInterval = 2000;

    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 20),
      child: BarChart(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
        BarChartData(
          backgroundColor: AppColors.kLightGreyColor,
          alignment: BarChartAlignment.spaceAround,
          maxY: maxDataAmount.toDouble() + 1000,
          barGroups: _buildBardGroupsList(),
          titlesData: _buildGraphTitles(
            weekdays,
            stepInterval,
            maxDataAmount.toInt(),
          ),
          extraLinesData: _buildHorizontalGraphLines(
            maxDataAmount: maxDataAmount.toInt(),
            context,
          ),
          barTouchData: BarTouchData(enabled: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  FlTitlesData _buildGraphTitles(
    List<String> weekdays,
    int stepInterval,
    int maxSteps,
  ) {
    return FlTitlesData(
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: _buildBottomTitles(weekdays),
      rightTitles: _buildRightTitles(stepInterval, maxSteps),
    );
  }

  AxisTitles _buildRightTitles(int stepInterval, int maxSteps) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: stepInterval.toDouble(),
        reservedSize: 30,
        getTitlesWidget: (value, _) {
          if (value % stepInterval == 0 && value <= maxSteps + 1000) {
            return Text(
              (value == 0) ? "" : value.toInt().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8,
                color:
                    isSteps
                        ? AppColors.kBlueColor
                        : AppColors.kAccentOrangeColor,
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  AxisTitles _buildBottomTitles(List<String> weekdays) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, _) {
          int index = value.toInt();
          if (index < 0 || index >= weekdays.length) {
            return SizedBox.shrink();
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1,
                height: 6,
                color: Colors.grey, // vertical ruler tick
              ),
              SizedBox(height: 4),
              Text(weekdays[index], style: TextStyle(fontSize: 10)),
            ],
          );
        },
        reservedSize: 30,
      ),
    );
  }

  ExtraLinesData _buildHorizontalGraphLines(
    BuildContext context, {
    required int maxDataAmount,
  }) {
    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: (maxDataAmount + 100).toDouble(),
          dashArray: [6, 4],
          color: isSteps ? AppColors.kBlueColor : AppColors.kAccentOrangeColor,
          strokeWidth: 1,
          label: HorizontalLineLabel(
            show: true,
            alignment: Alignment.topCenter,
            labelResolver: (_) => '$maxDataAmount',
            style: TextStyle(fontSize: 10, color: AppColors.kNeutralDarkColor),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildBardGroupsList() {
    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: lastSevenDaysData[index].toDouble(),
            color:
                isSteps ? AppColors.kBlueColor : AppColors.kAccentOrangeColor,
            borderRadius: BorderRadius.circular(4),
            width: 14,
            borderSide: BorderSide.none,
          ),
        ],
      );
    });
  }

  List<String> _generateLast7DaysLabels() {
    final today = DateTime.now();
    return List.generate(7, (i) {
      final date = today.subtract(Duration(days: i)); // Today - i
      return _getWeekdayName(date.weekday);
    }).reversed.toList(); // Make Sunday (today) the last one
  }

  String _getWeekdayName(int weekdayNumber) {
    const names = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return names[weekdayNumber - 1];
  }
}