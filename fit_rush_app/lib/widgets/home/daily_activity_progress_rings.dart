import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit.dart';
import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit_states.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/styles/styles.dart';
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
            context: context,
          );
        } else {
          return AppSizes.kEmptyWidget;
        }
      },
    );
  }

  Container _buildDailyProgressRings({
    required int steps,
    required double calories,
    required BuildContext context,
  }) {
    return Container(
      margin: AppSizes.kMarginV32,
      child: Column(
        spacing: AppSizes.kSpacing16,
        children: [
          FitnessRings(steps: steps, calories: calories),
          _buildRingsIconsRow(context),
        ],
      ),
    );
  }

  Row _buildRingsIconsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: AppSizes.kSpacing32,
      children: [_buildStepsIconRow(context), _buildCaloriesIconRow(context)],
    );
  }

  Row _buildCaloriesIconRow(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.local_fire_department_rounded,
          color: AppColors.kAccentOrangeColor,
        ),
        Text(
          "Calories",
          style:  AppTextStyles.kRingsDataText,
        ),
      ],
    );
  }

  Row _buildStepsIconRow(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.directions_run_rounded, color: AppColors.kBlueColor),
        Text("Steps", style: AppTextStyles.kRingsDataText),
      ],
    );
  }
}
