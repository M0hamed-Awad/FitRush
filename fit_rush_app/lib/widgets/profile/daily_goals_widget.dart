import 'package:fit_rush_app/widgets/profile/goal_text_field.dart';
import 'package:flutter/material.dart';

class DailyGoalsWidget extends StatelessWidget {
  final int stepsGoal;
  final double caloriesGoal;
  const DailyGoalsWidget({
    super.key,
    required this.stepsGoal,
    required this.caloriesGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 32,
        children: [
          Expanded(child: GoalTextField(label: "Steps", data: stepsGoal)),
          Expanded(child: GoalTextField(label: "Calories", data: caloriesGoal)),
        ],
      ),
    );
  }
}
