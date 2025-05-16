import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/styles/styles.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final ActivityHistoryTableData activity;

  const HistoryCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final dateStr = activity.date.toLocal().toString().split(' ')[0];
    final steps = activity.steps ?? 0;
    final calories = activity.calories;
    final distanceKm = (activity.distance ?? 0) / 1000;
    final duration = activity.duration;
    final notes = activity.notes;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date: $dateStr", style: AppTextStyles.kActivityTextDate),
            const SizedBox(height: 8),
            Text("Steps: $steps", style: AppTextStyles.kActivityTextData),
            Text(
              "Calories: ${calories.toStringAsFixed(2)}",
              style: AppTextStyles.kActivityTextData,
            ),
            if (distanceKm > 0)
              Text(
                "Distance: ${distanceKm.toStringAsFixed(2)} km",
                style: AppTextStyles.kActivityTextData,
              ),
            if (duration != null)
              Text(
                "Duration: $duration min",
                style: AppTextStyles.kActivityTextData,
              ),
            if (notes != null && notes.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Notes: $notes",
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
