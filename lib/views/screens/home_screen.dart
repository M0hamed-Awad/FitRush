import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit.dart';
import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit_states.dart';
import 'package:fit_rush_app/views/screens/profile_screen.dart';
import 'package:fit_rush_app/widgets/add_activity/add_activity_screen_body.dart';
import 'package:fit_rush_app/widgets/common/custom_bottom_navigation_bar.dart';
import 'package:fit_rush_app/widgets/common/custom_drawer.dart';
import 'package:fit_rush_app/widgets/common/custom_loading_indicator.dart';
import 'package:fit_rush_app/widgets/common/fail_widget.dart';
import 'package:fit_rush_app/widgets/home/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages to navigate to
  final List<Widget> _pages = [
    HomeScreenBody(),
    AddActivityScreenBody(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage("assets/images/Logo-V2-red.png"),
          width: 40,
          height: 40,
        ),
        actions: [Icon(Icons.settings_rounded)],
      ),
      body: _buildHomeScreenBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: CustomDrawer(),
    );
  }

  BlocBuilder<HealthPermissionsCubit, HealthPermissionsState>
  _buildHomeScreenBody() {
    return BlocBuilder<HealthPermissionsCubit, HealthPermissionsState>(
      builder: (context, state) {
        if (state is HealthPermissionsLoading) {
          return Center(child: CustomLoadingIndicator());
        } else if (state is HealthPermissionsDenied) {
          return _buildOnPermissionsDeniedWidget(state, context);
        } else if (state is HealthPermissionsGranted) {
          return IndexedStack(index: _selectedIndex, children: _pages);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Center _buildOnPermissionsDeniedWidget(
    HealthPermissionsDenied state,
    BuildContext context,
  ) {
    return Center(
      child: FailWidget(
        errorMessage: "Permission denied: ${state.errorMessage}",
        onRetry: () {
          BlocProvider.of<HealthPermissionsCubit>(
            context,
          ).requestPermissionsOnce();
        },
      ),
    );
  }
}
