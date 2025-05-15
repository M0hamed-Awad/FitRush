import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/views/screens/add_activity_screen.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              NavigationHelper.push(
                destination: AddActivityScreen(),
                context: context,
              );
            },
            icon: Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: ActivityProgressScreenBody(),
    );
  }
}
