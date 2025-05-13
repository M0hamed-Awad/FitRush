import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health/health.dart';

class HealthService {
  static final Health _healthInstance = Health();

  static Future<bool> requestHealthPermissions() async {
    // Configure Health Package
    await _healthInstance.configure();

    // Check if Permissions Granted
    return await _checkForPermissions();
  }

  static Future<bool> _checkForPermissions() async {
    List<HealthDataType> types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      Platform.isIOS
          ? HealthDataType.DISTANCE_WALKING_RUNNING
          : HealthDataType.DISTANCE_DELTA,

      HealthDataType.HEART_RATE,
    ];
    const permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    // Checks if the Required Permissions is Granted or NOT (for the given health data types).
    final hasPermission = await _healthInstance.hasPermissions(types) ?? false;

    if (!hasPermission) {
      // Request the Required Permissions from user When Permissions is NOT Granted
      final authorized = await _healthInstance.requestAuthorization(
        types,
        permissions: permissions,
      );
      debugPrint('[PERMISSIONS] Authorized: $authorized');
      return authorized;
    } else {
      debugPrint('[PERMISSIONS] Already granted');
      return true;
    }
  }



  static Future<int?> getTodaysSteps() async {
    try {
      final now = DateTime.now();
      final midnight = DateTime(now.year, now.month, now.day);
      // endTime.subtract(Duration(days: 1));

      debugPrint('[DEBUG] Fetching steps from: $midnight to $now');

      final rawData = await _healthInstance.getHealthDataFromTypes(
        startTime: midnight,
        endTime: now,
        types: [HealthDataType.STEPS],
      );
      debugPrint('[DEBUG] Raw step data: ${rawData.length} entries');
      debugPrint('[DEBUG] Raw data: $rawData');

      final steps = await _healthInstance.getTotalStepsInInterval(
        midnight,
        now,
      );

      debugPrint('[DEBUG] Total Steps: $steps');

      return steps;
    } catch (e) {
      debugPrint('[ERROR] Step fetch failed: ${e.toString()}');
      return null;
    }
  }

  static Future<double?> getTodaysCalories() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    List<HealthDataPoint> data = await _healthInstance.getHealthDataFromTypes(
      startTime: midnight,
      endTime: now,
      types: [HealthDataType.ACTIVE_ENERGY_BURNED],
    );

    double totalCalories = data.fold(
      0.0,
      (sum, point) => sum + (point.value as double),
    );

    debugPrint('[DEBUG] Total Calories: $totalCalories');

    return totalCalories;
  }

  static Future<double?> getTodaysDistanceCovered() async {
    final (startTime, endTime) = _getTodaysInterval();

    List<HealthDataPoint> data = await _healthInstance.getHealthDataFromTypes(
      startTime: startTime,
      endTime: endTime,
      types: [HealthDataType.DISTANCE_DELTA],
    );

    double totalDistance = data.fold(
      0.0,
      (sum, point) => sum + (point.value as NumericHealthValue).numericValue,
    );

    double roundedDistance = double.parse(totalDistance.toStringAsFixed(2));

    debugPrint('[DEBUG] Total Distance: $roundedDistance');

    return roundedDistance;
  }

  static Future<double?> getTodaysAverageHeartRate() async {
    final (startTime, endTime) = _getTodaysInterval();

    final heartRateData = await _healthInstance.getHealthDataFromTypes(
      startTime: startTime,
      endTime: endTime,
      types: [HealthDataType.HEART_RATE],
    );

    // removing duplicates
    final cleanedData = _healthInstance.removeDuplicates(heartRateData);

    // Filter only valid heart rate values and calculate average
    final values =
        cleanedData
            .where((point) => point.value is double || point.value is int)
            .map((point) => (point.value as num).toDouble())
            .toList();

    if (values.isEmpty) return null;

    final average = (values.reduce((a, b) => a + b)) / (values.length);

    debugPrint('[DEBUG] Average Heart Rate: $average');

    return average;
  }

  static (DateTime, DateTime) _getTodaysInterval() {
    final now = DateTime.now();
    return (DateTime(now.year, now.month, now.day), now);
  }

  static Future<List<int>> getLast7DaysSteps() async {
    List<int> lastSevenDaysSteps = [];

    try {
      final now = DateTime.now();

      for (int i = 6; i >= 0; i--) {
        final dayStart = DateTime(now.year, now.month, now.day).subtract(
          Duration(days: i),
        ); // sets the start of a specific day at 00:00
        final dayEnd = dayStart.add(
          Duration(days: 1),
        ); // the next day at 00:00 (so it's a full 24-hour period)

        final steps = await _healthInstance.getTotalStepsInInterval(
          dayStart,
          dayEnd,
        );

        lastSevenDaysSteps.add(steps ?? 0); // if null, fallback to 0
      }

      debugPrint('[DEBUG] Last 7 days Steps: $lastSevenDaysSteps');
      return lastSevenDaysSteps;
    } catch (e) {
      debugPrint('[ERROR] Fetching weekly steps failed: $e');
      return List.filled(7, 0); // fallback list of 0s
    }
  }

  static Future<List<double>> getLastSevenDaysCalories() async {
    List<double> lastSevenDayCalories = [];

    try {
      final now = DateTime.now();

      for (int i = 6; i >= 0; i--) {
        final dayStart = DateTime(
          now.year,
          now.month,
          now.day,
        ).subtract(Duration(days: i));
        final dayEnd = dayStart.add(Duration(days: 1));

        List<HealthDataPoint> data = await _healthInstance
            .getHealthDataFromTypes(
              startTime: dayStart,
              endTime: dayEnd,
              types: [HealthDataType.ACTIVE_ENERGY_BURNED],
            );

        double totalCalories = data.fold(
          0.0,
          (sum, point) => sum + (point.value as double),
        );

        debugPrint('[DEBUG] Total Calories: $totalCalories');

        lastSevenDayCalories.add(totalCalories);
      }

      debugPrint('[DEBUG] Last 7 days Calories: $lastSevenDayCalories');
      return lastSevenDayCalories;
    } catch (e) {
      debugPrint('[ERROR] Fetching weekly Calories failed: $e');
      return List.filled(7, 0);
    }
  }
}
