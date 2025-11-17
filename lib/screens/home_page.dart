import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home/car_features.dart';
import 'package:flutter_application_2/widgets/home/hero_section.dart';
import 'package:flutter_application_2/widgets/home/passion.dart';

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
        children: const [BackgroundContainer(), CarFeatures(), PassionSection() ],
      ),
    );
  }
}
