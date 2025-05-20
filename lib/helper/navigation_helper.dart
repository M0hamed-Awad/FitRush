import 'package:flutter/material.dart';

class NavigationHelper {
  static void push({
    required Widget destination,
    required BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  static void pushNamed({
    required String routeName,
    required BuildContext context,
  }) {
    Navigator.pushNamed(context, routeName);
  }

  static void pushReplacement({
    required Widget destination,
    required BuildContext context,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
