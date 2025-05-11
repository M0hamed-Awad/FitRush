import 'package:fit_rush_app/services/health_service.dart';
import 'package:fit_rush_app/widgets/home/daily_stats_card.dart';
import 'package:flutter/material.dart';

class DailyActivityStats extends StatelessWidget {
  const DailyActivityStats({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDailyActivityStatsBody();
  }

  Column _buildDailyActivityStatsBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [_buildFirstRow(), _buildSecondRow()],
    );
  }

  Row _buildSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        DailyStatsCard(
          text: "BPM (avg)",
          fetchDataMethod: HealthService.getTodaysAverageHeartRate,
        ),
        DailyStatsCard(
          text: "Meters",
          fetchDataMethod: HealthService.getTodayDistance,
        ),
      ],
    );
  }

  Row _buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        DailyStatsCard(
          text: "Steps",
          fetchDataMethod: HealthService.getTodaySteps,
        ),
        DailyStatsCard(
          text: "Calories",
          fetchDataMethod: HealthService.getTodayCalories,
        ),
      ],
    );
  }
}
