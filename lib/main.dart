import 'package:firebase_core/firebase_core.dart';
import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/firebase_options.dart';
import 'package:fit_rush_app/styles/themes.dart';
import 'package:fit_rush_app/views/screens/activity_progress_screen.dart';
import 'package:fit_rush_app/views/screens/add_activity_screen.dart';
import 'package:fit_rush_app/views/screens/activities_history_screen.dart';
import 'package:fit_rush_app/views/screens/home_screen.dart';
import 'package:fit_rush_app/views/screens/landing_screen.dart';
import 'package:fit_rush_app/views/screens/login_screen.dart';
import 'package:fit_rush_app/views/screens/profile_screen.dart';
import 'package:fit_rush_app/views/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FitRushApp());
}

class FitRushApp extends StatelessWidget {
  const FitRushApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodayHealthCubit()..fetchTodayData()),
        BlocProvider(
          create: (context) => LastSevenDaysHealthCubit()..fetchWeekData(),
        ),
        BlocProvider(
          create:
              (context) => HealthPermissionsCubit()..requestPermissionsOnce(),
        ),

        BlocProvider(create: (context) => UserCubit()),
      ],
      child: MaterialApp(
        title: 'FitRush',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: LandingScreen(),
        routes: {
          "/landing": (context) => LandingScreen(),
          "/home": (context) => HomeScreen(),
          "/addActivity": (context) => AddActivityScreen(),
          "/activityProgress": (context) => ActivityProgressScreen(),
          "/activityHistory": (context) => ActivitiesHistoryScreen(),
          "/login": (context) => LoginScreen(),
          "/signup": (context) => SignUpScreen(),
          "/profile": (context) => ProfileScreen(),
        },
      ),
    );
  }
}
