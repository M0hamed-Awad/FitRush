import 'package:fit_rush_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FitnessRings extends StatelessWidget {
  final int steps;
  final double calories;
  final int stepsGoal;
  final int caloriesGoal;

  const FitnessRings({
    super.key,
    required this.steps,
    required this.calories,
    this.stepsGoal = 5000,
    this.caloriesGoal = 350,
  });

  @override
  Widget build(BuildContext context) {
    // Clamp to set the Percent Range from 0 to 1
    final double stepsPercent = (steps / stepsGoal).clamp(0.0, 1.0);
    final double caloriesPercent = (calories / caloriesGoal).clamp(0.0, 1.0);

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
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: kAccentOrangeColor,
      backgroundColor: const Color.fromRGBO(255, 106, 43, 0.1),
    );
  }

  CircularPercentIndicator _buildStepsRing(double stepsPercent) {
    return CircularPercentIndicator(
      radius: 110.0,
      lineWidth: 18.0,
      percent: stepsPercent,
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: kBlueColor,
      backgroundColor: const Color.fromRGBO(33, 150, 243, 0.1),
    );
  }

  Center _buildRingsTextWidgets() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text(
            "$steps",
            style: TextStyle(
              fontSize: 28,
              color: kBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$calories",
            style: TextStyle(
              fontSize: 22,
              color: kAccentOrangeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
