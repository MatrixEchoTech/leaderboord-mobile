import 'package:flutter/material.dart';

import 'package:flutter_application_2/widgets/rankings/spotlight_rankings.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
          SpotlightRankings(),
    
        ],
      )
    );
  }
}
