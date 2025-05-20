import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit_states.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit_states.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/widgets/common/custom_progress_bar.dart';
import 'package:fit_rush_app/widgets/home/daily_activity_progress_with_stats.dart';
import 'package:fit_rush_app/widgets/home/daily_motivation_card.dart';
import 'package:fit_rush_app/widgets/home/history_navigate_card.dart';
import 'package:fit_rush_app/widgets/home/week_activity_summary_card.dart';
import 'package:fit_rush_app/widgets/home/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHomeScreenBody();
  }

  SafeArea _buildHomeScreenBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: AppSizes.kPadding8Bottom64,
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            // Logged In User
            if (userState.user != null) {
              return BlocBuilder<TodayHealthCubit, TodayHealthState>(
                builder: (context, healthState) {
                  int todaySteps = 0;
                  double todayCalories = 0;

                  if (healthState is TodayHealthLoaded) {
                    todaySteps = healthState.steps;
                    todayCalories = healthState.calories;
                  }

                  final double goalDayProgressPercent =
                      _calculateDayProgressPercent(
                        currentSteps: todaySteps,
                        goalStepsCount:
                            userState.user!.dailyGoal.goalStepsCount,
                        currentCaloriesBurned: todayCalories,
                        goalCaloriesBurned:
                            userState.user!.dailyGoal.goalCaloriesBurned,
                      );

                  final int remainingStepsTowardsDailyGoal =
                      userState.user!.dailyGoal.goalStepsCount - todaySteps;

                  return _buildBodyColumn(
                    context,
                    goalDayProgressPercent: goalDayProgressPercent,
                    todaySteps: todaySteps,
                    remainingStepsTowardsDailyGoal:
                        remainingStepsTowardsDailyGoal,
                    goalStepsCount: userState.user!.dailyGoal.goalStepsCount,
                    goalCaloriesBurned:
                        userState.user!.dailyGoal.goalCaloriesBurned,
                  );
                },
              );
            } else {
              return AppSizes.kEmptyWidget;
            }
          },
        ),
      ),
    );
  }

  Column _buildBodyColumn(
    BuildContext context, {
    required double goalDayProgressPercent,
    required int todaySteps,
    required int remainingStepsTowardsDailyGoal,
    required int goalStepsCount,
    required double goalCaloriesBurned,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.kSpacing8,
      children: _buildBodyColumnChildren(
        context,
        goalDayProgressPercent: goalDayProgressPercent,
        todaySteps: todaySteps,
        remainingStepsTowardsDailyGoal: remainingStepsTowardsDailyGoal,
        goalStepsCount: goalStepsCount,
        goalCaloriesBurned: goalCaloriesBurned,
      ),
    );
  }

  List<Widget> _buildBodyColumnChildren(
    BuildContext context, {
    required double goalDayProgressPercent,
    required int todaySteps,
    required int remainingStepsTowardsDailyGoal,
    required int goalStepsCount,
    required double goalCaloriesBurned,
  }) {
    return [
      // Welcome card
      WelcomeCard(),

      // Goal Overall Progress bar
      _buildDailyGoalProgressBar(
        context,
        goalProgressPercent: goalDayProgressPercent,
        currentStepCount: todaySteps,
      ),

      // Daily Goal Progress & Stats Cards
      DailyActivityProgressWithStats(
        stepsGoalCount: goalStepsCount,
        caloriesBurnedGoal: goalCaloriesBurned,
      ),

      AppSizes.kSizeH20,

      // Weekly Activity Summary Card
      WeekActivitySummaryCard(),

      AppSizes.kSizeH12,

      // History
      HistoryNavigateCard(
        onTap: () {
          NavigationHelper.pushNamed(
            routeName: kAddActivityScreenRouteName,
            context: context,
          );
        },
      ),

      AppSizes.kSizeH12,

      // Daily Motivation Card
      DailyMotivationCard(
        remainingStepsTowardsGoal: remainingStepsTowardsDailyGoal,
      ),
    ];
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
            percent: double.parse((goalProgressPercent).toStringAsFixed(1)),
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
}
