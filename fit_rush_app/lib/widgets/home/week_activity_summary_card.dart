import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/screens/activity_progress_screen.dart';
import 'package:fit_rush_app/services/health_service.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fit_rush_app/widgets/home/mini_week_line_chart.dart';
import 'package:flutter/material.dart';

class WeekActivitySummaryCard extends StatefulWidget {
  const WeekActivitySummaryCard({super.key});

  @override
  State<WeekActivitySummaryCard> createState() =>
      _WeekActivitySummaryCardState();
}

class _WeekActivitySummaryCardState extends State<WeekActivitySummaryCard> {
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

    return GestureDetector(
      onTap: () {
        NavigationHelper.push(
          destination: ActivityProgressScreen(),
          context: context,
        );
      },
      child: Card(
        color: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                "Your Progress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kTextColorDark,
                ),
              ),
              Text(
                "Last 7 Days",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              MiniWeekLineChart(weeklySteps: _weeklySteps),
            ],
          ),
        ),
      ),
    );
  }
}
