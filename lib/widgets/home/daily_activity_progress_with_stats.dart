import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit_states.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fit_rush_app/widgets/home/daily_activity_progress_rings.dart';
import 'package:fit_rush_app/widgets/home/daily_activity_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyActivityProgressWithStats extends StatelessWidget {
  final int stepsGoalCount;
  final double caloriesBurnedGoal;
  const DailyActivityProgressWithStats({
    super.key,
    this.stepsGoalCount = 5000,
    this.caloriesBurnedGoal = 300,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayHealthCubit, TodayHealthState>(
      builder: (context, state) {
        if (state is TodayHealthLoading) {
          return _buildLoadingIndicator();
        } else if (state is TodayHealthFailed) {
          return FailWidget(
            errorMessage: state.errorMessage,
            onRetry: () => context.read<TodayHealthCubit>().fetchTodayData(),
          );
        } else if (state is TodayHealthLoaded) {
          return _buildMainContentBody(state: state);
        } else {
          return AppSizes.kEmptyWidget;
        }
      },
    );
  }

  Center _buildLoadingIndicator() {
    return const Center(
      child: SizedBox(width: 40, height: 40, child: CustomLoadingIndicator()),
    );
  }

  Column _buildMainContentBody({required TodayHealthLoaded state}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: AppSizes.kSpacing16,
      children: [
        // Daily Goal Progress
        DailyActivityProgressRings(
          stepsGoalCount: stepsGoalCount,
          currentStepsCount: state.steps,
          caloriesBurnedGoal: caloriesBurnedGoal,
          currentCaloriesBurned: state.calories,
        ),

        // Daily Stats Cards
        DailyActivityStats(
          stepsCount: state.steps,
          calories: state.calories,
          activeMinutes: state.activeMinutes,
          distance: state.distance,
        ),
      ],
    );
  }
}
