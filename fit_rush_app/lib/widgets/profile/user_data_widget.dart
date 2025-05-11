import 'package:fit_rush_app/widgets/profile/goal_text_field.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return

    Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: GridView.count(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 4,
        childAspectRatio: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          GoalTextField(label: "Height", data: 175),
          GoalTextField(label: "Weight", data: 75),
          GoalTextField(label: "BMI", data: 25),
        ],
      ),
    );
  }
}