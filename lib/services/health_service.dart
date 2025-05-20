import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthService {
  static final Health _healthInstance = Health();

  static final DateTime _currentDayTime = DateTime.now();
  static final DateTime _startOfTodayTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  static Future<bool> requestHealthPermissions() async {
    // Configure Health Package
    await _healthInstance.configure();

    // Check if Permissions Granted
    return await _checkForPermissions();
  }

  static Future<bool> _checkForPermissions() async {
    List<HealthDataType> types = [
      HealthDataType.STEPS,
      Platform.isIOS
          ? HealthDataType.DISTANCE_WALKING_RUNNING
          : HealthDataType.DISTANCE_DELTA,

      HealthDataType.HEART_RATE,
      HealthDataType.TOTAL_CALORIES_BURNED,
      HealthDataType.WORKOUT,
    ];

    final permissions = types.map((type) => HealthDataAccess.READ).toList();

    await Permission.activityRecognition.request();
    await Permission.sensors.request();
    await Permission.location.request();

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

  // =========================================================================//
  // Today's Data //
  // =========================================================================//

  // Today's Steps
  static Future<int?> getTodaysSteps() async {
    try {
      debugPrint("[DEBUG] Fetching Today's Steps...");

      final steps = await _healthInstance.getTotalStepsInInterval(
        _startOfTodayTime,
        _currentDayTime,
      );

      debugPrint('[DEBUG] Total Steps: $steps');
      return steps;
    } catch (e) {
      debugPrint('[DEBUG ERROR] Step fetch failed: ${e.toString()}');
      return null;
    }
  }

  // Today's Calories
  static Future<double?> getTodaysCalories() async {
    try {
      debugPrint("[DEBUG] Fetching Today's Calories...");

      final totalCalories = await _getTodayTotalDataValue(
        types: [HealthDataType.TOTAL_CALORIES_BURNED],
      );

      debugPrint('[DEBUG] Total Calories: $totalCalories');
      return totalCalories?.toDouble();
    } catch (e) {
      debugPrint('[DEBUG ERROR] Fetching today\'s calories failed: $e');
      return null;
    }
  }

  // Today's Distance Covered
  static Future<double?> getTodaysDistanceCovered() async {
    try {
      debugPrint("[DEBUG] Fetching Today's Distance Covered...");

      final totalDistance = await _getTodayTotalDataValue(
        types: [
          Platform.isIOS
              ? HealthDataType.DISTANCE_WALKING_RUNNING
              : HealthDataType.DISTANCE_DELTA,
        ],
      );

      debugPrint('[DEBUG] Total Distance: $totalDistance');
      return totalDistance?.toDouble();
    } catch (e) {
      debugPrint('[DEBUG ERROR] Fetching today\'s distance covered failed: $e');
      return null;
    }
  }

  // Today's Average Heart Rate
  static Future<double?> getTodaysAverageHeartRate() async {
    try {
      debugPrint("[DEBUG] Fetching Today's Average Heart Rate...");

      List<HealthDataPoint> data = await _getTodayHealthDataPoints(
        types: [HealthDataType.HEART_RATE],
      );

      // Get Heart Rate Average
      final average = _getTodayAverageHeartRate(healthDataPoints: data);

      debugPrint('[DEBUG] Average Heart Rate: $average');

      return average;
    } catch (e) {
      debugPrint(
        '[DEBUG ERROR] Fetching today\'s Average Heart Rate failed: $e',
      );
      return null;
    }
  }

  // =========================================================================//
  // Last 7 Days Data
  // =========================================================================//

  // Last 7 Days Steps
  static Future<List<num>> getLast7DaysSteps() async {
    try {
      List<num> lastSevenDaysSteps = await _getLastNDaysData(
        numberOfDays: 7,
        types: [HealthDataType.STEPS],
      );

      debugPrint('[DEBUG] Last 7 days Steps: $lastSevenDaysSteps');
      return lastSevenDaysSteps;
    } catch (e) {
      debugPrint('[DEBUG ERROR] Fetching weekly steps failed: $e');
      return List.filled(7, 0); // fallback list of 0s
    }
  }

  // Last 7 Days Calories
  static Future<List<num>> getLast7DaysCalories() async {
    try {
      List<num> lastSevenDayCalories = await _getLastNDaysData(
        numberOfDays: 7,
        types: [HealthDataType.TOTAL_CALORIES_BURNED],
      );

      debugPrint('[DEBUG] Last 7 days Calories: $lastSevenDayCalories');
      return lastSevenDayCalories;
    } catch (e) {
      debugPrint('[DEBUG ERROR] Fetching weekly Calories failed: $e');
      return List.filled(7, 0);
    }
  }

  // =========================================================================//
  // Helper Functions  //
  // =========================================================================//

  // General

  static double _extractDoubleValueFromNumericValue(HealthValue value) {
    if (value is NumericHealthValue) {
      return value.numericValue.toDouble();
    }
    return 0.0; // Fallback for Non a Numeric Values
  }

  static num _getTotalValueFromHealthDataPoints({
    required List<HealthDataPoint> healthDataPoints,
  }) {
    num totalValue = healthDataPoints
        .map((point) => _extractDoubleValueFromNumericValue(point.value))
        .fold(0.0, (sum, val) => sum + val);

    return totalValue;
  }

  // Get Interval of Days Data

  static Future<List<num>> _getLastNDaysData({
    required int numberOfDays,
    required List<HealthDataType> types,
  }) async {
    List<num> lastNDayData = [];

    for (int i = numberOfDays - 1; i >= 0; i--) {
      final dayStart = _startOfTodayTime.subtract(Duration(days: i));

      // sets the start of a specific day at 00:00
      final dayEnd = dayStart.add(Duration(days: 1));

      // the next day at 00:00
      final dayData = await _getSpecificDayTotalData(
        types: types,
        startTime: dayStart,
        endTime: dayEnd,
      );

      lastNDayData.add(dayData?.toDouble() ?? 0.0); // fallback list of 0s
    }

    return lastNDayData;
  }

  // Get Specific Day Data

  static Future<num?> _getSpecificDayTotalData({
    required List<HealthDataType> types,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    final todaysData = await _getSpecificDayHealthDataPoints(
      types: types,
      startTime: startTime,
      endTime: endTime,
    );

    num totalTodaysData = _getTotalValueFromHealthDataPoints(
      healthDataPoints: todaysData,
    );

    if (totalTodaysData is double) {
      totalTodaysData = double.parse(totalTodaysData.toStringAsFixed(1));
    }

    return totalTodaysData;
  }

  static Future<List<HealthDataPoint>> _getSpecificDayHealthDataPoints({
    required List<HealthDataType> types,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    List<HealthDataPoint> data = await _healthInstance.getHealthDataFromTypes(
      startTime: startTime,
      endTime: endTime,
      types: types,
    );

    // removing duplicates
    final cleanedData = _healthInstance.removeDuplicates(data);

    return cleanedData;
  }

  // Get Today Data

  static Future<num?> _getTodayTotalDataValue({
    required List<HealthDataType> types,
  }) async {
    final todaysData = await _getSpecificDayTotalData(
      types: types,
      startTime: _startOfTodayTime,
      endTime: _currentDayTime,
    );

    return todaysData;
  }

  // only for heart rate
  static Future<List<HealthDataPoint>> _getTodayHealthDataPoints({
    required List<HealthDataType> types,
  }) async {
    final data = await _getSpecificDayHealthDataPoints(
      types: types,
      startTime: _startOfTodayTime,
      endTime: _currentDayTime,
    );

    return data;
  }

  static double? _getTodayAverageHeartRate({
    required List<HealthDataPoint> healthDataPoints,
  }) {
    // Filter only valid heart rate values and calculate average
    final values =
        healthDataPoints
            .map((point) => _extractDoubleValueFromNumericValue(point.value))
            .whereType<double>()
            .toList();

    // No data is available
    if (values.isEmpty) return null;

    // Calculate Average
    final average = (values.reduce((a, b) => a + b)) / (values.length);

    return average;
  }
}
