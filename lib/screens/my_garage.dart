import 'package:flutter/material.dart';

import 'package:flutter_application_2/widgets/garage/garage_car_tabs.dart';
import 'package:flutter_application_2/widgets/garage/garage_profile_box.dart';
import 'package:flutter_application_2/widgets/garage/my_garage_header.dart';


class MyGarage extends StatelessWidget {
  const MyGarage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView(
        children: const [
          MyGarageHeader(),
          GarageProfileBox(
            profileImage: "/images/user2.png",
            userName: "You",
            memberYear: "2025",
            totalCars: 5,
          ),
          // Now the tabs can scroll as part of the page
          SizedBox(
            height: 500, // give some height for TabBarView
            child: GarageTabsPage(),
          ),
        ],
      ),
    );
  }
}
