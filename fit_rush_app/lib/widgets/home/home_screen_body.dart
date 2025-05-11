import 'package:fit_rush_app/constants.dart';
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
        padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 64),
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
            _buildDailyGoalProgressBar(),

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

  Widget _buildDailyGoalProgressBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          CustomProgressBar(percent: 0.9, title: "Daily Goal Progress"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "4500 / 5000",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextColorDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
