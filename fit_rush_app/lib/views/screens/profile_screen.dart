import 'package:fit_rush_app/widgets/profile/profile_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.settings_rounded)],
      ),
      body: ProfileScreenBody(),
    );
  }
}
