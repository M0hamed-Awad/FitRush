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

class ActivityProgressScreenBody extends StatefulWidget {
  const ActivityProgressScreenBody({super.key});

  @override
  State<ActivityProgressScreenBody> createState() =>
      _ActivityProgressScreenBodyState();
}

class _ActivityProgressScreenBodyState
    extends State<ActivityProgressScreenBody> {
  bool _isSteps = true;
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
            lastSevenDaysData: _isSteps ? state.steps : state.calories,
            context: context,
          );
        } else {
          return AppSizes.kEmptyWidget;
        }
      },
    );
  }

  Padding _buildWeekChartBody({
    required List<num> lastSevenDaysData,
    required BuildContext context,
  }) {
    final num totalSteps = lastSevenDaysData.fold(
      0,
      (sum, value) => sum + value,
    );

    return Padding(
      padding: AppSizes.kPadding8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildScreenTitleWidget(totalSteps: totalSteps, context),
            AppSizes.kSizeH24,
            Padding(
              padding: AppSizes.kPadding8,
              child: WeekChart(
                lastSevenDaysData: lastSevenDaysData,
                isSteps: _isSteps,
              ),
            ),
            _buildLastSevenDaysActivities(
              context,
              weeklySteps: lastSevenDaysData,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenTitleWidget(
    BuildContext context, {
    required num totalSteps,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _isSteps = !_isSteps;
            });
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 22,
          ),
        ),
        Column(
          children: [
            _buildActivityDateText(context),
            _buildActivityTotalAmountRow(context, totalDataAmount: totalSteps),
          ],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _isSteps = !_isSteps;
            });
          },
          icon: Icon(
            Icons.arrow_forward_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildLastSevenDaysActivities(
    BuildContext context, {
    required List<num> weeklySteps,
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
    required List<num> weeklySteps,
  }) {
    final now = DateTime.now();

    return List.generate(7, (index) {
      final date = now.subtract(Duration(days: index)); // newest first
      final dateString =
          "${_getWeekday(date.weekday)}, ${date.day} ${_getMonthName(date.month)}";
      return _buildDayActivityCard(
        dateString: dateString,
        totalAmount: weeklySteps[6 - index], // access steps in reverse order
        dataType: _isSteps ? "Steps" : "Calories",
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
    required num totalAmount,
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
    required num totalAmount,
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
            "${totalAmount.toInt()} $dataType",
            style: AppTextStyles.kActivityTextData,
          ),
        ],
      ),
    );
  }

  Row _buildActivityTotalAmountRow(
    BuildContext context, {
    required num totalDataAmount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppSizes.kSpacing8,
      children: [
        Icon(
          _isSteps
              ? Icons.directions_run_rounded
              : Icons.local_fire_department_rounded,
          color: _isSteps ? AppColors.kBlueColor : AppColors.kAccentOrangeColor,
        ),
        Text(
          "${totalDataAmount.toInt()} ${_isSteps ? "Steps" : "Calories"}",
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