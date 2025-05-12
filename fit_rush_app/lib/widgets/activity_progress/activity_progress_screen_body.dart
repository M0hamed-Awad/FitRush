import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit.dart';
import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit_states.dart';
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
          return _buildWeekChartBody(lastSevenDaysSteps: state.steps);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Padding _buildWeekChartBody({required List<int> lastSevenDaysSteps}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildActivityDateText(),
            _buildActivityTotalAmountRow(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WeekChart(lastSevenDaysSteps: lastSevenDaysSteps),
            ),
            _buildLastSevenDaysActivities(),
          ],
        ),
      ),
    );
  }

  Widget _buildLastSevenDaysActivities() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(spacing: 8, children: _buildLastSevenDaysList()),
    );
  }

  List<Widget> _buildLastSevenDaysList() {
    return [
      _buildDayActivityCard(
        dateString: "Monday, 5 May",
        totalAmount: 0,
        dataType: "Steps",
      ),
      _buildDayActivityCard(
        dateString: "Tuesday, 6 May",
        totalAmount: 164,
        dataType: "Steps",
      ),
      _buildDayActivityCard(
        dateString: "Wednesday, 7 May",
        totalAmount: 4,
        dataType: "Steps",
      ),
      _buildDayActivityCard(
        dateString: "Thursday, 8 May",
        totalAmount: 4480,
        dataType: "Steps",
      ),
      _buildDayActivityCard(
        dateString: "Friday, 9 May",
        totalAmount: 402,
        dataType: "Steps",
      ),
      _buildDayActivityCard(
        dateString: "Saturday, 10 May",
        totalAmount: 389,
        dataType: "Steps",
      ),
      _buildDayActivityCard(
        dateString: "Sunday, 11 May",
        totalAmount: 139,
        dataType: "Steps",
      ),
    ];
  }

  Widget _buildDayActivityCard({
    required String dateString,
    required int totalAmount,
    required String dataType,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: kSecondaryColor,
          child: _buildDayActivityCardBody(
            dateString: dateString,
            totalAmount: totalAmount,
            dataType: dataType,
          ),
        ),
      ),
    );
  }

  Widget _buildDayActivityCardBody({
    required String dateString,
    required int totalAmount,
    required String dataType,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            dateString,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            "$totalAmount $dataType",
            style: TextStyle(
              color: kTextColorDark,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildActivityTotalAmountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Icon(Icons.directions_run_rounded, color: kBlueColor),
        Text(
          "5,651 Steps",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Text _buildActivityDateText() {
    return Text(
      "5-11 May",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: kTextColorDark,
      ),
    );
  }
}
