import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:flutter/material.dart';

class DailyStatsCard<T extends num> extends StatefulWidget {
  final String text;
  final Future<T?> Function() fetchDataMethod;

  const DailyStatsCard({
    super.key,
    required this.text,
    required this.fetchDataMethod,
  });

  @override
  State<DailyStatsCard> createState() => _DailyStatsCardState();
}

class _DailyStatsCardState<T extends num> extends State<DailyStatsCard> {
  T? _data;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final fetchedData = await widget.fetchDataMethod() as T?;

      setState(() {
        _data = fetchedData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CustomLoadingIndicator())
        : _buildCardBody();
  }

  Widget _buildCardBody() {
    if (_errorMessage != null) {
      return FailWidget(errorMessage: _errorMessage ?? "", onRetry: _fetchData);
    } else {
      return Expanded(
        child: Card(
          color: kSecondaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: _buildCardBodyColumn(),
          ),
        ),
      );
    }
  }

  Column _buildCardBodyColumn() {
    return Column(
      children: [
        Text(
          _formatValue(_data),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.text,
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
