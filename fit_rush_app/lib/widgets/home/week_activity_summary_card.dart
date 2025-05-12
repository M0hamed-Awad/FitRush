import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit_states.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/views/screens/activity_progress_screen.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
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
        if (state is LastSevenDaysHealthLoading) {
          return const Center(child: CustomLoadingIndicator());
        } else if (state is LastSevenDaysHealthFailed) {
          return FailWidget(
            errorMessage: state.errorMessage,
            onRetry:
                () => context.read<LastSevenDaysHealthCubit>().fetchWeekData(),
          );
        } else if (state is LastSevenDaysHealthLoaded) {
          return _buildWeekActivitySummaryCard(weekSteps: state.steps);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildWeekActivitySummaryCard({required List<int> weekSteps}) {
    return GestureDetector(
      onTap: _handleOnCardClicked,
      child: Card(
        color: kSecondaryColor,
        child: _buildWeekActivitySummaryCardBody(weekSteps: weekSteps),
      ),
    );
  }

  void _handleOnCardClicked() {
    NavigationHelper.push(
      destination: ActivityProgressScreen(),
      context: context,
    );
  }

  Widget _buildWeekActivitySummaryCardBody({required List<int> weekSteps}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "Your Progress",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kTextColorDark,
            ),
          ),
          Text(
            "Last 7 Days",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          MiniWeekLineChart(weeklySteps: weekSteps),
        ],
      ),
    );
  }
}
