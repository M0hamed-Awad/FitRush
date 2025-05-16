import 'package:fit_rush_app/cubits/user_cubit/user_cubit.dart';
import 'package:fit_rush_app/cubits/user_cubit/user_cubit_states.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/widgets/profile/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.settings_rounded)]),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.user == null) {
            return AppSizes.kEmptyWidget;
          } else {
            return ProfileScreenBody(user: state.user);
          }
        },
      ),
    );
  }
}
