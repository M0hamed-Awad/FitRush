import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit.dart';
import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit_states.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:fit_rush_app/views/screens/add_activity_screen.dart';
import 'package:fit_rush_app/views/screens/profile_screen.dart';
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
  final List<Widget> _pages = [HomeScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    NavigationHelper.push(destination: _pages[index], context: context);
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
      ),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
      body: _buildHomeScreenBody(),
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
          return HomeScreenBody();
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

  FloatingActionButton _buildFab() {
    return FloatingActionButton(
      onPressed: () {
        NavigationHelper.push(
          destination: AddActivityScreen(),
          context: context,
        );
      },
      shape: RoundedRectangleBorder(borderRadius: AppSizes.kBorderRadius40),
      backgroundColor: AppColors.kPrimaryColor,
      foregroundColor: AppColors.kSecondaryColorLight,
      child: Icon(Icons.add_rounded, size: 32),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: _buildBottomNavBarBody(),
    );
  }

  Row _buildBottomNavBarBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBottomNavItem(Icons.home_rounded, "Home", 0),
        AppSizes.kSizeW40, // Space for the FAB
        _buildBottomNavItem(Icons.person_rounded, "Profile", 1),
      ],
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: _buildBottomNavItemBody(icon, index, label),
    );
  }

  Column _buildBottomNavItemBody(IconData icon, int index, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color:
              _selectedIndex == index
                  ? AppColors.kPrimaryColor
                  : Theme.of(context).colorScheme.onSurface,
        ),
        AppSizes.kSizeH4,
        Text(
          label,
          style: TextStyle(
            color:
                _selectedIndex == index
                    ? AppColors.kPrimaryColor
                    : Theme.of(context).colorScheme.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
