import 'package:firebase_core/firebase_core.dart';
import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/firebase_options.dart';
import 'package:fit_rush_app/styles/themes.dart';
import 'package:fit_rush_app/views/screens/landing_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'FitRush',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: LandingScreen(),
      ),
    );
  }
}
