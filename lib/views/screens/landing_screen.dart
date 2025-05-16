import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/views/screens/home_screen.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/landing/landing_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  Future<Widget> _determineStartScreen(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(kIsLoggedInFlag) ?? false;

    if (isLoggedIn) {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        // Firebase session expired or signed out
        await prefs.setBool(kIsLoggedInFlag, false);
        return const LandingScreenBody();
      }

      final uid = firebaseUser.uid;

      final db = AppDatabase.instance;

      final userQuery = db.select(db.usersTable)
        ..where((tbl) => tbl.uid.equals(uid));
      final user = await userQuery.getSingleOrNull();

      if (user != null) {
        // Restore the user in Cubit
        context.read<UserCubit>().setUser(user);
        return const HomeScreen();
      } else {
        // Drift DB got wiped? Treat as new user
        await prefs.setBool(kIsLoggedInFlag, false);
        return const LandingScreenBody();
      }
    }
    return const LandingScreenBody();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _determineStartScreen(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: CustomLoadingIndicator()));
        }
        return snapshot.data!;
      },
    );
  }
}
