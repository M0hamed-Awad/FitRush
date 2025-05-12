import 'package:fit_rush_app/constants.dart';
import 'package:flutter/material.dart';

class DailyStatsCard<T extends num> extends StatelessWidget {
  final String text;
  final T? data;

  const DailyStatsCard({super.key, required this.text, required this.data});

  @override
  Widget build(BuildContext context) {
    return _buildCardBody();
  }

  Widget _buildCardBody() {
    return Expanded(
      child: Card(
        color: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: _buildCardBodyColumn(),
        ),
      ),
    );
  }

  Column _buildCardBodyColumn() {
    return Column(
      children: [
        Text(
          _formatValue(data),
          // _formatValue(),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: kTextColorDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
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
