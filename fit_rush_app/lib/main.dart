import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FitRushApp());
}

class FitRushApp extends StatelessWidget {
  const FitRushApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodayHealthCubit()..fetchTodayData()),
        BlocProvider(create: (context) => LastSevenDaysHealthCubit()..fetchWeekData()),
        BlocProvider(create: (context) => HealthPermissionsCubit()..requestPermissionsOnce()),
      ],
      child: MaterialApp(
        title: 'FitRush',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
