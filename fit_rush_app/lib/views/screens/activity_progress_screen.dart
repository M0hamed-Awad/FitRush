import 'package:fit_rush_app/widgets/activity_progress/activity_progress_screen_body.dart';
import 'package:flutter/material.dart';

class ActivityProgressScreen extends StatelessWidget {
  const ActivityProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Activity",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [Icon(Icons.add_rounded)],
      ),
      body: ActivityProgressScreenBody(),
    );
  }
}
