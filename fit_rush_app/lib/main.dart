import 'package:fit_rush_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FitRushApp());
}

class FitRushApp extends StatelessWidget {
  const FitRushApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitRush',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
