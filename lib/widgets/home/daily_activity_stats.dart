import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/widgets/home/daily_stats_card.dart';
import 'package:flutter/material.dart';

class DailyActivityStats extends StatelessWidget {
  final int stepsCount, activeMinutes;
  final double calories, distance;

  const DailyActivityStats({
    super.key,
    required this.stepsCount,
    required this.calories,
    required this.activeMinutes,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return _buildDataStatsCards();
  }

  Column _buildDataStatsCards() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.kSpacing8,
      children: [
        _buildFirstRow(stepsCount: stepsCount, calories: calories),
        _buildSecondRow(activeMinutes: activeMinutes, distance: distance),
      ],
    );
  }

  Row _buildFirstRow({required int stepsCount, required double calories}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: AppSizes.kSpacing8,
      children: [
        DailyStatsCard<int>(text: "Steps", data: stepsCount),
        DailyStatsCard<double>(text: "Calories", data: calories),
      ],
    );
  }

  Row _buildSecondRow({required int activeMinutes, required double distance}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: AppSizes.kSpacing8,
      children: [
        DailyStatsCard<int>(text: "Mins", data: activeMinutes),
        DailyStatsCard<double>(text: "Meters", data: distance),
      ],
    );
  }
}
