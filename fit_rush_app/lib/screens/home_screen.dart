import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/helper/navigation_helper.dart';
import 'package:fit_rush_app/screens/profile_screen.dart';
import 'package:fit_rush_app/widgets/home/home_screen_body.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image(
          image: AssetImage("assets/images/Logo-V2-red.png"),
          width: 40,
          height: 40,
        ),
        titleSpacing: 16,
      ),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
      body: HomeScreenBody(),
    );
  }

  FloatingActionButton _buildFab() {
    return FloatingActionButton(
      onPressed: () {
        // Handle FAB press
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      backgroundColor: kAccentOrangeColor,
      foregroundColor: kSecondaryColor,
      child: Icon(Icons.add_rounded, size: 32),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      color: kSecondaryColor,
      child: _buildBottomNavBarBody(),
    );
  }

  Row _buildBottomNavBarBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBottomNavItem(Icons.home_rounded, "Home", 0),
        SizedBox(width: 40), // Space for the FAB
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
          color: _selectedIndex == index ? kAccentOrangeColor : kTextColorDark,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color:
                _selectedIndex == index ? kAccentOrangeColor : kTextColorDark,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
