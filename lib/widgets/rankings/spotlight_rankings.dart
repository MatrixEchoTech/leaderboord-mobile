import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpotlightRankings extends StatelessWidget {
  const SpotlightRankings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Spotlight Rankings",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "See how your car stacks up against the competition.",
            style: GoogleFonts.poppins(
              fontSize: 13, 
              fontWeight: FontWeight.w400,
              color: Color(0xFFC7C7C7),
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
