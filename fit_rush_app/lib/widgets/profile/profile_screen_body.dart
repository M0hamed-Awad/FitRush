import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/widgets/profile/daily_goals_widget.dart';
import 'package:fit_rush_app/widgets/profile/long_term_goals_widget.dart';
import 'package:fit_rush_app/widgets/profile/user_data_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: const Column(
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

          Divider(thickness: 2, height: 6),
          Text(
            "Long Term Goals",
            style: TextStyle(fontSize: 18, color: AppColors.kTextColorDark),
          ),

          LongTermGoalsWidget(),

          Divider(thickness: 2, height: 6),
          Text(
            "Daily Goals",
            style: TextStyle(fontSize: 18, color: AppColors.kTextColorDark),
          ),
          DailyGoalsWidget(),

          Divider(thickness: 2, height: 6),
          Text(
            "Your Data",
            style: TextStyle(fontSize: 18, color: AppColors.kTextColorDark),
          ),
          UserDataWidget(),
        ],
      ),
    );
  }
}
