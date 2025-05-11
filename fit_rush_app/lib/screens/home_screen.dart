import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/widgets/home/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
      bottomNavigationBar: _buildBottomNavBar(),
      body: HomeScreenBody(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: kBackgroundColor,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kGreyColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
