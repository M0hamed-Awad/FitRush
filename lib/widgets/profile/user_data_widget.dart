import 'package:fit_rush_app/models/bmi_model.dart';
import 'package:fit_rush_app/widgets/profile/goal_text_field.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  final double height, weight;
  final BmiModel? bmi;
  const UserDataWidget({
    super.key,
    required this.height,
    required this.weight,
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 4,
        childAspectRatio: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          GoalTextField(label: "Height", data: height),
          GoalTextField(label: "Weight", data: weight),
          GoalTextField(label: "BMI", data: bmi?.bmi ?? 0),
          GoalTextField(
            label: "BMI Status",
            data: bmi?.weightStatus ?? "Unknown",
          ),
        ],
      ),
    );
  }
}
