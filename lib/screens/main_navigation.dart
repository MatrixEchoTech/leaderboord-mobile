import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_page.dart';

import 'package:flutter_application_2/screens/Leaderboord.dart';
import 'package:flutter_application_2/screens/my_garage.dart';
import 'package:flutter_application_2/screens/community.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:flutter_application_2/widgets/profile/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    AboutPage(),
    MyGarage(),
    SettingsPage(),
  ];

  void _goToTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      appBar: customAppBar(
        onLogoTap: () {
          _goToTab(0); // Switch to Home tab
        },

        onProfileTap: () {
          _goToTab(4); // Switch to Profile tab inside _screens
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: const Color(0x33FFFFFF), width: 1.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_crash),
              label: "Leaderboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.garage),
              label: "My Garage",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Community",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
