import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FitnessRings extends StatelessWidget {
  final int currentStepsCount, stepsGoalCount;
  final double currentCaloriesBurned, caloriesBurnedGoal;

  const FitnessRings({
    super.key,
    required this.currentStepsCount,
    required this.currentCaloriesBurned,
    required this.stepsGoalCount,
    required this.caloriesBurnedGoal,
  });

  @override
  Widget build(BuildContext context) {
    // Clamp to set the Percent Range from 0 to 1
    final double stepsPercent = (currentStepsCount / stepsGoalCount).clamp(
      0.0,
      1.0,
    );
    final double caloriesPercent = (currentCaloriesBurned / caloriesBurnedGoal)
        .clamp(0.0, 1.0);

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer Ring (Steps)
        _buildStepsRing(stepsPercent),
        // Inner Ring (Calories)
        _buildCaloriesRing(caloriesPercent),
        // Text in center
        _buildRingsTextWidgets(),
      ],
    );
  }

  CircularPercentIndicator _buildCaloriesRing(double caloriesPercent) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 14.0,
      percent: caloriesPercent,
      animation: true,
      animationDuration: 1000,
      curve: Curves.easeOut,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColors.kAccentOrangeColor,
      backgroundColor: const Color.fromRGBO(255, 106, 43, 0.1),
    );
  }

  CircularPercentIndicator _buildStepsRing(double stepsPercent) {
    return CircularPercentIndicator(
      radius: 110.0,
      lineWidth: 18.0,
      percent: stepsPercent,
      animation: true,
      animationDuration: 1000,
      curve: Curves.easeOut,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColors.kBlueColor,
      backgroundColor: const Color.fromRGBO(33, 150, 243, 0.1),
    );
  }

  Center _buildRingsTextWidgets() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSizes.kSpacing8,
        children: [
          Text(
            "$currentStepsCount",
            style: TextStyle(
              fontSize: 28,
              color: AppColors.kBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${currentCaloriesBurned.round().toInt()}",
            style: TextStyle(
              fontSize: 22,
              color: AppColors.kAccentOrangeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
