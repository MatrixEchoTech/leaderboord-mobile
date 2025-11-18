import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/garage/garage_car.dart';

import 'package:flutter_application_2/widgets/garage/garage_profile_box.dart';
import 'package:flutter_application_2/widgets/garage/my_garage_header.dart';

class MyGarage extends StatelessWidget {
  const MyGarage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset("/images/newLogo.png", height: 30)),
      body: ListView(
        children: const [
          MyGarageHeader(),
          GarageProfileBox(
            profileImage: "/images/user2.png",
            userName: "You",
            memberYear: "2025",
            totalCars: 5,
          ),
       GarageTabsPage()
        ],
      ),
    ); 
  } 
} 