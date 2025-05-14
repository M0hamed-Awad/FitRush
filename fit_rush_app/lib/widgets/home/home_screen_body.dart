import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/widgets/common/custom_progress_bar.dart';
import 'package:fit_rush_app/widgets/home/daily_activity_progress_rings.dart';
import 'package:fit_rush_app/widgets/home/daily_activity_stats.dart';
import 'package:fit_rush_app/widgets/home/daily_motivation_card.dart';
import 'package:fit_rush_app/widgets/home/week_activity_summary_card.dart';
import 'package:fit_rush_app/widgets/home/welcome_card.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: AppSizes.kPadding8Bottom64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 28,
          children: [
            // Welcome card
            WelcomeCard(),
            // Goal Overall Progress bar
            _buildGoalOverallProgressBar(),

            // Daily Goal Progress
            DailyActivityProgressRings(),

            // Daily Stats Cards
            DailyActivityStats(),

            // Weekly Activity Summary Card
            WeekActivitySummaryCard(),

            // Goal Overall Progress bar
            _buildDailyGoalProgressBar(context),

            // Daily Motivation Card
            DailyMotivationCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalOverallProgressBar() {
    return CustomProgressBar(percent: 0.7, title: "Overall Progress");
  }

  Widget _buildDailyGoalProgressBar(BuildContext context) {
    return Container(
      margin: AppSizes.kMarginV16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          CustomProgressBar(percent: 0.9, title: "Daily Goal Progress"),
          Padding(
            padding: AppSizes.kPaddingH12,
            child: Text(
              "4500 / 5000",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
