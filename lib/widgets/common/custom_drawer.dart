import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/views/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            SizedBox(height: 60),
            // Logo
            Image(
              image: AssetImage("assets/images/Logo-V2-red.png"),
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            // Divider
            Divider(
              color: AppColors.kGreyColor,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            // Filler to push logout to the bottom
            Expanded(child: Container()),
            // Logout button
            ListTile(
              leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.onSurface),
              title: Text(
                'Logout',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () async {
                logout(context);
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kIsLoggedInFlag, false);

    context.read<UserCubit>().clearUser();

    NavigationHelper.pushReplacement(
      destination: const LandingScreen(),
      context: context,
    );
  }
}
