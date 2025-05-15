import 'package:fit_rush_app/widgets/profile/goal_text_field.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  final double height, weight;
  const UserDataWidget({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: GridView.count(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 4,
        childAspectRatio: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          GoalTextField(label: "Height", data: height),
          GoalTextField(label: "Weight", data: weight),
          GoalTextField(label: "BMI", data: 25),
        ],
      ),
    );
  }
}
