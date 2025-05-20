import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit_states.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fit_rush_app/widgets/home/mini_week_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeekActivitySummaryCard extends StatefulWidget {
  const WeekActivitySummaryCard({super.key});

  @override
  State<WeekActivitySummaryCard> createState() =>
      _WeekActivitySummaryCardState();
}

class _WeekActivitySummaryCardState extends State<WeekActivitySummaryCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastSevenDaysHealthCubit, LastSevenDaysHealthState>(
      builder: (context, state) {
        if (state is LastSevenDaysHealthFailed) {
          return FailWidget(
            errorMessage: state.errorMessage,
            onRetry:
                () => context.read<LastSevenDaysHealthCubit>().fetchWeekData(),
          );
        } else if (state is LastSevenDaysHealthLoaded) {
          return _buildWeekActivitySummaryCard(
            weekSteps: state.steps,
            weekCalories: state.calories,
          );
        } else {
          return AppSizes.kEmptyWidget;
        }
      },
    );
  }

  Widget _buildWeekActivitySummaryCard({
    required List<num> weekSteps,
    required List<num> weekCalories,
  }) {
    return GestureDetector(
      onTap: _handleOnCardClicked,
      child: Card(
        child: _buildWeekActivitySummaryCardBody(
          weekSteps: weekSteps,
          weekCalories: weekCalories,
        ),
      ),
    );
  }

  void _handleOnCardClicked() {
    NavigationHelper.pushNamed(
      routeName: kActivityProgressScreenRouteName,
      context: context,
    );
  }

  Widget _buildWeekActivitySummaryCardBody({
    required List<num> weekSteps,
    required List<num> weekCalories,
  }) {
    return Padding(
      padding: AppSizes.kPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "Your Progress",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            "Last 7 Days",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          MiniWeekLineChart(weekSteps: weekSteps, weekCalories: weekCalories),
        ],
      ),
    );
  }
}
