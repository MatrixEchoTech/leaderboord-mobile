import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreLeaderboard extends StatelessWidget {
  const ExploreLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300, // Mobile-friendly height
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg-3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text
              Text(
                "It's time to join the thousands of creators, artists Car.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Helvetica",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),

              // Mobile Button
              SizedBox(
                width: double.infinity, // full width
               
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                  child: Text(
                    "Explore Leaderboords",
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
