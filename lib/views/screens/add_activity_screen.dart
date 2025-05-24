import 'package:fit_rush_app/widgets/add_activity/add_activity_screen_body.dart';
import 'package:flutter/material.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Activity',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(child: AddActivityScreenBody()),
    );
  }
}