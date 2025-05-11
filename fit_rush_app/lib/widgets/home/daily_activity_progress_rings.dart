import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/services/health_service.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fit_rush_app/widgets/home/fitness_rings.dart';
import 'package:flutter/material.dart';

class DailyActivityProgressRings extends StatefulWidget {
  const DailyActivityProgressRings({super.key});

  @override
  State<DailyActivityProgressRings> createState() =>
      _DailyActivityProgressRingsState();
}

class _DailyActivityProgressRingsState
    extends State<DailyActivityProgressRings> {
  int? _steps;
  double? _calories;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _fetchData<T>({
    required Future<T?> Function() fetchDataMethod,
    required bool isSteps,
  }) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final data = await fetchDataMethod();

      setState(() {
        if (isSteps) {
          _steps = data as int;
        } else {
          _calories = data as double;
        }
        _isLoading = false;
      });

      if (data == null) {
        setState(() {
          _errorMessage = 'Failed to get steps. Check permissions!';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  void _fetchAllData() {
    _fetchData(fetchDataMethod: HealthService.getTodayCalories, isSteps: false);
    _fetchData(fetchDataMethod: HealthService.getTodaySteps, isSteps: true);
  }

  @override
  void initState() {
    super.initState();
    _fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CustomLoadingIndicator())
        : _buildDailyProgressRings();
  }

  Container _buildDailyProgressRings() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        spacing: 16,
        children: [
          if (_errorMessage != null)
            FailWidget(
              errorMessage: _errorMessage ?? "",
              onRetry: () {
                _fetchAllData();
              },
            )
          else
            FitnessRings(steps: _steps ?? 0, calories: _calories ?? 0),
          _buildRingsIconsRow(),
        ],
      ),
    );
  }

  Row _buildRingsIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 32,
      children: [_buildStepsIconRow(), _buildCaloriesIconRow()],
    );
  }

  Row _buildCaloriesIconRow() {
    return Row(
      children: [
        Icon(Icons.local_fire_department_rounded, color: kAccentOrangeColor),
        Text(
          "Calories",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kTextColorDark,
          ),
        ),
      ],
    );
  }

  Row _buildStepsIconRow() {
    return Row(
      children: [
        Icon(Icons.directions_run_rounded, color: kBlueColor),
        Text(
          "Steps",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kTextColorDark,
          ),
        ),
      ],
    );
  }
}
