import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit_states.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fit_rush_app/widgets/home/fitness_rings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyActivityProgressRings extends StatefulWidget {
  const DailyActivityProgressRings({super.key});

  @override
  State<DailyActivityProgressRings> createState() =>
      _DailyActivityProgressRingsState();
}

class _DailyActivityProgressRingsState
    extends State<DailyActivityProgressRings> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayHealthCubit, TodayHealthState>(
      builder: (context, state) {
        if (state is TodayHealthLoading) {
          return const Center(child: CustomLoadingIndicator());
        } else if (state is TodayHealthFailed) {
          return FailWidget(
            errorMessage: state.errorMessage,
            onRetry: () => context.read<TodayHealthCubit>().fetchTodayData(),
          );
        } else if (state is TodayHealthLoaded) {
          return _buildDailyProgressRings(
            steps: state.steps,
            calories: state.calories,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Container _buildDailyProgressRings({
    required int steps,
    required double calories,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        spacing: 16,
        children: [
          FitnessRings(steps: steps, calories: calories),
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
