import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_page.dart';

import 'package:flutter_application_2/screens/Leaderboord.dart';
import 'package:flutter_application_2/screens/my_garage.dart';
import 'package:flutter_application_2/screens/community.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
               color: Color(0x33FFFFFF), // color of the border
              width: 1.5, // thickness of the border
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor:
              Colors.black, 

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_crash),
              label: "Leaderboord",
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
