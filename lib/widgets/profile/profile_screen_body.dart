import 'package:fit_rush_app/api/bmi_api_service.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit_states.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/models/bmi_model.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/widgets/profile/daily_goals_widget.dart';
import 'package:fit_rush_app/widgets/profile/user_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenBody extends StatefulWidget {
  final UsersTableData? user;

  const ProfileScreenBody({super.key, required this.user});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  BmiModel? bmi;

  @override
  void initState() {
    super.initState();
    callBmi();
  }

  Future<void> callBmi() async {
    final bmiService = BmiService();
    final result = await bmiService.getBmi(
      height: (widget.user?.height ?? 0).toInt(),
      weight: (widget.user?.weight ?? 0).toInt(),
    );
    debugPrint("[DEBUG] BMI: ${result.bmi}, Status: ${result.weightStatus}");

    setState(() {
      bmi = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.user == null) {
          return AppSizes.kEmptyWidget;
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kTextColorDark,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: CircleAvatar(
                    backgroundColor: AppColors.kPrimaryColor,
                    radius: 53,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/4140/4140048.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),

                // For Long Term Goals

                // Divider(thickness: 2, height: 6),
                // Text(
                //   "Long Term Goals",
                //   style: TextStyle(
                //     fontSize: 18,
                //     color: AppColors.kTextColorDark,
                //   ),
                // ),

                // LongTermGoalsWidget(),
                Divider(thickness: 2, height: 6),
                Text(
                  "Daily Goals",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.kTextColorDark,
                  ),
                ),
                DailyGoalsWidget(
                  stepsGoal: widget.user?.dailyGoal.goalStepsCount ?? 0,
                  caloriesGoal: widget.user?.dailyGoal.goalCaloriesBurned ?? 0,
                ),

                Divider(thickness: 2, height: 6),
                Text(
                  "Your Data",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.kTextColorDark,
                  ),
                ),
                UserDataWidget(
                  height: widget.user?.height ?? 0,
                  weight: widget.user?.weight ?? 0,
                  bmi: bmi,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
