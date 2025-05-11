import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/services/health_service.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekChart extends StatefulWidget {
  const WeekChart({super.key});

  @override
  State<WeekChart> createState() => _WeekChartState();
}

class _WeekChartState extends State<WeekChart> {
  List<int> _weeklySteps = [];
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _fetchLast7DaysSteps() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final weeklySteps = await HealthService.getLast7DaysSteps();

      setState(() {
        _weeklySteps = weeklySteps;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchLast7DaysSteps();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> weekdays = _generateLast7DaysLabels();

    if (_isLoading) {
      return Center(child: CustomLoadingIndicator());
    }

    if (_errorMessage != null) {
      return FailWidget(
        errorMessage: _errorMessage ?? "Error",
        onRetry: _fetchLast7DaysSteps,
      );
    }

    if (_weeklySteps.isEmpty) {
      return Center(child: Text("No steps data available."));
    }

    final int maxSteps = _weeklySteps.reduce((a, b) => a > b ? a : b);
    final int stepInterval = 2000;

    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 20),
      child: BarChart(
        BarChartData(
          backgroundColor: kSecondaryColor,
          alignment: BarChartAlignment.spaceAround, // stick to chart edges
          maxY: maxSteps.toDouble() + 1000,
          barGroups: List.generate(7, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: _weeklySteps[index].toDouble(),
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(4),
                  width: 14,
                  borderSide: BorderSide.none,
                ),
              ],
            );
          }),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
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
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: stepInterval.toDouble(),
                reservedSize: 30,
                getTitlesWidget: (value, _) {
                  if (value % stepInterval == 0 && value <= maxSteps + 1000) {
                    return Text(
                      (value == 0) ? "" : value.toInt().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 8, color: kBlueColor),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: (maxSteps + 100).toDouble(),
                dashArray: [6, 4],
                color: kBlueColor,
                strokeWidth: 1,
                label: HorizontalLineLabel(
                  show: true,
                  alignment: Alignment.topCenter,
                  labelResolver: (_) => '$maxSteps',
                  style: TextStyle(fontSize: 10, color: kPrimaryColor),
                ),
              ),
            ],
          ),
          barTouchData: BarTouchData(enabled: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
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
