import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit_states.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: AppSizes.kBorderRadius12),
      child: Padding(
        padding: AppSizes.kPadding16,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FitRush",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSizes.kSizeH4,
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      final username =
                          (state.user == null) ? "_" : state.user?.name;
                      return RichText(
                        text: TextSpan(
                          text: "Welcome back,\n",
                          style: TextStyle(
                            color: AppColors.kGreyColor,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: username,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/4140/4140048.png',
                  ),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
