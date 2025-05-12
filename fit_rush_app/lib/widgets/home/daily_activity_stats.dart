import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit_states.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fit_rush_app/widgets/home/daily_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyActivityStats extends StatelessWidget {
  const DailyActivityStats({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDailyActivityStatsBody();
  }

  Widget _buildDailyActivityStatsBody() {
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              _buildFirstRow(stepsCount: state.steps, calories: state.calories),
              _buildSecondRow(
                heartRate: state.heartRate,
                distance: state.distance,
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Row _buildFirstRow({required int stepsCount, required double calories}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        DailyStatsCard<int>(text: "Steps", data: stepsCount),
        DailyStatsCard<double>(text: "Calories", data: calories),
      ],
    );
  }

  Row _buildSecondRow({required double heartRate, required double distance}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        DailyStatsCard<double>(text: "BPM (avg)", data: heartRate),
        DailyStatsCard<double>(text: "Meters", data: distance),
      ],
    );
  }
}
