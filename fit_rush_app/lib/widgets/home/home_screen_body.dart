import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit_states.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit_states.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/views/screens/landing_screen.dart';
import 'package:fit_rush_app/widgets/common/custom_progress_bar.dart';
import 'package:fit_rush_app/widgets/home/daily_activity_progress_rings.dart';
import 'package:fit_rush_app/widgets/home/daily_activity_stats.dart';
import 'package:fit_rush_app/widgets/home/daily_motivation_card.dart';
import 'package:fit_rush_app/widgets/home/week_activity_summary_card.dart';
import 'package:fit_rush_app/widgets/home/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: AppSizes.kPadding8Bottom64,
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            // Logged In User
            if (state.user != null) {
              int todaySteps = 0;
              double todayCalories = 0;

              BlocBuilder<TodayHealthCubit, TodayHealthState>(
                builder: (context, state) {
                  if (state is TodayHealthLoaded) {
                    todaySteps = state.steps;
                    todaySteps = state.steps;
                  }
                  return AppSizes.kEmptyWidget;
                },
              );

              final double goalDayProgressPercent =
                  _calculateDayProgressPercent(
                    currentSteps: todaySteps,
                    goalStepsCount: state.user!.dailyGoal.goalStepsCount,
                    currentCaloriesBurned: todayCalories,
                    goalCaloriesBurned:
                        state.user!.dailyGoal.goalCaloriesBurned,
                  );

              final int remainingStepsTowardsDailyGoal =
                  state.user!.dailyGoal.goalStepsCount - todaySteps;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 28,
                children: [
                  // Welcome card
                  WelcomeCard(),
                  // Goal Overall Progress bar
                  _buildGoalOverallProgressBar(
                    goalProgressPercent: goalDayProgressPercent,
                  ),

                  // Daily Goal Progress
                  DailyActivityProgressRings(),

                  // Daily Stats Cards
                  DailyActivityStats(),

                  // Weekly Activity Summary Card
                  WeekActivitySummaryCard(),

                  // Goal Overall Progress bar
                  _buildDailyGoalProgressBar(
                    context,
                    goalProgressPercent: goalDayProgressPercent,
                    currentStepCount: todaySteps,
                  ),

                  // Daily Motivation Card
                  DailyMotivationCard(
                    remainingStepsTowardsGoal: remainingStepsTowardsDailyGoal,
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      logout(context);
                    },
                    child: Text("Logout"),
                  ),
                ],
              );
            } else {
              return AppSizes.kEmptyWidget;
            }
          },
        ),
      ),
    );
  }

  Widget _buildGoalOverallProgressBar({required double goalProgressPercent}) {
    return CustomProgressBar(
      percent: goalProgressPercent,
      title: "Overall Progress",
    );
  }

  Widget _buildDailyGoalProgressBar(
    BuildContext context, {
    required double goalProgressPercent,
    required int currentStepCount,
  }) {
    return Container(
      margin: AppSizes.kMarginV16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          CustomProgressBar(
            percent: goalProgressPercent,
            title: "Daily Goal Progress",
          ),
          Padding(
            padding: AppSizes.kPaddingH12,
            child: Text(
              "$currentStepCount / 5000",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  double _calculateDayProgressPercent({
    required int currentSteps,
    required int goalStepsCount,
    required double currentCaloriesBurned,
    required double goalCaloriesBurned,
  }) {
    if (goalStepsCount == 0 || goalCaloriesBurned == 0) return 0;

    double stepsPercent = (currentSteps / goalStepsCount);
    double caloriesPercent = (currentCaloriesBurned / goalCaloriesBurned);

    stepsPercent = stepsPercent.clamp(0.0, 1.0);
    caloriesPercent = caloriesPercent.clamp(0.0, 1.0);

    double totalProgress = (stepsPercent + caloriesPercent) / 2;
    return totalProgress;
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kIsLoggedInFlag, false);

    context.read<UserCubit>().clearUser();

    NavigationHelper.pushReplacement(
      destination: const LandingScreen(),
      context: context,
    );
  }
}
