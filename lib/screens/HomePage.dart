import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/Home/CarFeatures.dart';
import 'package:flutter_application_2/components/Home/HeroSection.dart';
import 'package:flutter_application_2/components/Home/Passion.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: ListView(  
        children: const [
          BackgroundContainer(),
          CarFeatures(),
    Passion()
        ],
      ),
    );
  }
}
