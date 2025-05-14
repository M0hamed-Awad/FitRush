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
    return Padding(
      padding: AppSizes.kPadding8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildActivityDateText(context),
            _buildActivityTotalAmountRow(context),
            AppSizes.kSizeH24,
            Padding(
              padding: AppSizes.kPadding8,
              child: WeekChart(lastSevenDaysSteps: lastSevenDaysSteps),
            ),
            _buildLastSevenDaysActivities(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLastSevenDaysActivities(BuildContext context) {
    return Container(
      margin: AppSizes.kMarginTop16,
      child: Column(
        spacing: AppSizes.kSpacing8,
        children: _buildLastSevenDaysList(context),
      ),
    );
  }

  List<Widget> _buildLastSevenDaysList(BuildContext context) {
    return [
      _buildDayActivityCard(
        dateString: "Monday, 5 May",
        totalAmount: 0,
        dataType: "Steps",
        context: context,
      ),
      _buildDayActivityCard(
        dateString: "Tuesday, 6 May",
        totalAmount: 164,
        dataType: "Steps",
        context: context,
      ),
      _buildDayActivityCard(
        dateString: "Wednesday, 7 May",
        totalAmount: 4,
        dataType: "Steps",
        context: context,
      ),
      _buildDayActivityCard(
        dateString: "Thursday, 8 May",
        totalAmount: 4480,
        dataType: "Steps",
        context: context,
      ),
      _buildDayActivityCard(
        dateString: "Friday, 9 May",
        totalAmount: 402,
        dataType: "Steps",
        context: context,
      ),
      _buildDayActivityCard(
        dateString: "Saturday, 10 May",
        totalAmount: 389,
        dataType: "Steps",
        context: context,
      ),
      _buildDayActivityCard(
        dateString: "Sunday, 11 May",
        totalAmount: 139,
        dataType: "Steps",
        context: context,
      ),
    ];
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

  Row _buildActivityTotalAmountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppSizes.kSpacing8,
      children: [
        Icon(Icons.directions_run_rounded, color: AppColors.kBlueColor),
        Text(
          "5,651 Steps",
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
    return Text("5-11 May", style: Theme.of(context).textTheme.bodyLarge);
  }
}
