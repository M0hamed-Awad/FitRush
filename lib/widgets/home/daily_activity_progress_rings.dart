import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/styles/styles.dart';
import 'package:fit_rush_app/widgets/home/fitness_rings.dart';
import 'package:flutter/material.dart';

class DailyActivityProgressRings extends StatelessWidget {
  final int currentStepsCount, stepsGoalCount;
  final double currentCaloriesBurned, caloriesBurnedGoal;

  const DailyActivityProgressRings({
    super.key,
    required this.currentStepsCount,
    required this.currentCaloriesBurned,
    required this.stepsGoalCount,
    required this.caloriesBurnedGoal,
  });

  @override
  Widget build(BuildContext context) {
    return _buildDailyProgressRings(
      currentStepsCount: currentStepsCount,
      stepsGoalCount: stepsGoalCount,
      currentCaloriesBurned: currentCaloriesBurned,
      caloriesBurnedGoal: caloriesBurnedGoal,
      context: context,
    );
  }

  Container _buildDailyProgressRings({
    required int currentStepsCount,
    required int stepsGoalCount,
    required double currentCaloriesBurned,
    required double caloriesBurnedGoal,
    required BuildContext context,
  }) {
    return Container(
      margin: AppSizes.kMarginBottom20,
      child: Column(
        spacing: AppSizes.kSpacing16,
        children: [
          FitnessRings(
            currentStepsCount: currentStepsCount,
            currentCaloriesBurned: currentCaloriesBurned,
            stepsGoalCount: stepsGoalCount,
            caloriesBurnedGoal: caloriesBurnedGoal,
          ),
          _buildRingsIconsRow(context),
        ],
      ),
    );
  }

  Row _buildRingsIconsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: AppSizes.kSpacing32,
      children: [_buildStepsIconRow(context), _buildCaloriesIconRow(context)],
    );
  }

  Row _buildCaloriesIconRow(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.local_fire_department_rounded,
          color: AppColors.kAccentOrangeColor,
        ),
        Text("Calories", style: AppTextStyles.kRingsDataText),
      ],
    );
  }

  Row _buildStepsIconRow(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.directions_run_rounded, color: AppColors.kBlueColor),
        Text("Steps", style: AppTextStyles.kRingsDataText),
      ],
    );
  }
}
