import 'package:fit_rush_app/styles/sizes.dart';
import 'package:flutter/material.dart';

class DailyMotivationCard extends StatelessWidget {
  final int remainingStepsTowardsGoal;
  const DailyMotivationCard({super.key, required this.remainingStepsTowardsGoal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppSizes.kPaddingH4V8,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Every step counts!\n",
            style: TextStyle(
              fontSize: 18,
              height: 2,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            children: [
              TextSpan(text: "You are only "),
              TextSpan(
                text: "$remainingStepsTowardsGoal Steps ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              TextSpan(text: "away from your GOAL! "),
            ],
          ),
        ),
      ),
    );
  }
}
