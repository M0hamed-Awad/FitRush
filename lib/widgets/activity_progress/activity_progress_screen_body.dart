import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit_states.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/styles/styles.dart';
import 'package:fit_rush_app/widgets/activity_progress/week_chart.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityProgressScreenBody extends StatelessWidget {
  const ActivityProgressScreenBody({super.key});

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
          return _buildWeekChartBody(
            lastSevenDaysSteps: state.steps,
            context: context,
          );
        } else {
          return AppSizes.kEmptyWidget;
        }
      },
    );
  }

  Padding _buildWeekChartBody({
    required List<int> lastSevenDaysSteps,
    required BuildContext context,
  }) {
    final int totalSteps = lastSevenDaysSteps.fold(
      0,
      (sum, value) => sum + value,
    );

    return Padding(
      padding: AppSizes.kPadding8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildActivityDateText(context),
            _buildActivityTotalAmountRow(context, totalSteps: totalSteps),
            AppSizes.kSizeH24,
            Padding(
              padding: AppSizes.kPadding8,
              child: WeekChart(lastSevenDaysSteps: lastSevenDaysSteps),
            ),
            _buildLastSevenDaysActivities(
              context,
              weeklySteps: lastSevenDaysSteps,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastSevenDaysActivities(
    BuildContext context, {
    required List<int> weeklySteps,
  }) {
    return Container(
      margin: AppSizes.kMarginTop16,
      child: Column(
        spacing: AppSizes.kSpacing8,
        children: _buildWeeklyActivityCards(
          context: context,
          weeklySteps: weeklySteps,
        ),
      ),
    );
  }

  List<Widget> _buildWeeklyActivityCards({
    required BuildContext context,
    required List<int> weeklySteps,
  }) {
    final now = DateTime.now();

    return List.generate(7, (index) {
      final date = now.subtract(Duration(days: index)); // newest first
      final dateString =
          "${_getWeekday(date.weekday)}, ${date.day} ${_getMonthName(date.month)}";
      return _buildDayActivityCard(
        dateString: dateString,
        totalAmount: weeklySteps[6 - index], // access steps in reverse order
        dataType: "Steps",
        context: context,
      );
    });
  }

  String _getWeekday(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[weekday - 1];
  }

  Widget _buildDayActivityCard({
    required String dateString,
    required int totalAmount,
    required String dataType,
    required BuildContext context,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: _buildDayActivityCardBody(
            dateString: dateString,
            totalAmount: totalAmount,
            dataType: dataType,
            context: context,
          ),
        ),
      ),
    );
  }

  Widget _buildDayActivityCardBody({
    required String dateString,
    required int totalAmount,
    required String dataType,
    required BuildContext context,
  }) {
    return Padding(
      padding: AppSizes.kPadding16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.kSpacing4,
        children: [
          Text(dateString, style: AppTextStyles.kActivityTextDate),
          Text(
            "$totalAmount $dataType",
            style: AppTextStyles.kActivityTextData,
          ),
        ],
      ),
    );
  }

  Row _buildActivityTotalAmountRow(
    BuildContext context, {
    required int totalSteps,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppSizes.kSpacing8,
      children: [
        Icon(Icons.directions_run_rounded, color: AppColors.kBlueColor),
        Text(
          "$totalSteps Steps",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Text _buildActivityDateText(BuildContext context) {
    final now = DateTime.now();
    final past = now.subtract(
      const Duration(days: 6),
    ); // 7 days total including today

    final month = _getMonthName(now.month); // Custom month name function
    final startDay = past.day;
    final endDay = now.day;

    final dateRange = "$startDay–$endDay $month";

    return Text(dateRange, style: Theme.of(context).textTheme.bodyLarge);
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
