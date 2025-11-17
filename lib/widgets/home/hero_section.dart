import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundContainer extends StatelessWidget {
  final double? height;
  final double? width;

  const BackgroundContainer({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 400,
      width: width ?? double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),

              // ---------------- Leaderboard ----------------
              Text(
                "Leaderboord",
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              // ---------------- Title 1 ----------------
              Text(
                "Create Your Garage",
                style: GoogleFonts.manrope(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              // ---------------- Title 2 ----------------
              Text(
                "Add Your Vehicles",
                style: GoogleFonts.manrope(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              // ---------------- Title 3 ----------------
              Text(
                "Compete & Win",
                style: GoogleFonts.manrope(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ---------------- Description ----------------
              Text(
                "Create your own digital garage, showcase your cars, log every event, modification and milestone, stay on top of maintenance, and most importantly, see how your vehicles rank across the leaderboords.",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: const Color(0xFFC4C4C4),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 20),

              // ---------------- Buttons Row ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55),
                        ),
                      ),
                      child: Text(
                        "Join the Competition",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.purple;
                            }
                            return Colors.transparent;
                          },
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        side: WidgetStateProperty.all(
                          const BorderSide(color: Colors.white),
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 20,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55),
                          ),
                        ),
                      ),
                      child: Text(
                        "Create Your Garage",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
