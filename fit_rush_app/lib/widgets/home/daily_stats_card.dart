import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/styles/styles.dart';
import 'package:flutter/material.dart';

class DailyStatsCard<T extends num> extends StatelessWidget {
  final String text;
  final T? data;

  const DailyStatsCard({super.key, required this.text, required this.data});

  @override
  Widget build(BuildContext context) {
    return _buildCardBody(context);
  }

  Widget _buildCardBody(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: AppSizes.kPaddingH16V8,
          child: _buildCardBodyColumn(context),
        ),
      ),
    );
  }

  Column _buildCardBodyColumn(BuildContext context) {
    return Column(
      children: [
        Text(_formatValue(data), style: AppTextStyles.kStatsTextTitle),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  String _formatValue(T? value) {
    if (value == null) return '—';
    if (value is double) {
      return value.toStringAsFixed(1);
    } else {
      return value.toString();
    }
  }
}
