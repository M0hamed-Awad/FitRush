import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/widgets/activity_progress/activity_progress_screen_body.dart';
import 'package:flutter/material.dart';

class ActivityProgressScreen extends StatelessWidget {
  const ActivityProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          "My Activity",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: kTextColorDark,
          ),
        ),
        titleSpacing: 16,
        actions: [Icon(Icons.add_rounded, size: 24)],
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
      body: ActivityProgressScreenBody(),
    );
  }
}
