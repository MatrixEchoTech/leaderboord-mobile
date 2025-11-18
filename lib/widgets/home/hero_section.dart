import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/auth_screens/sign_in.dart';
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
       constraints: BoxConstraints(
      minHeight: 50, // prevents shrinking
    ),
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
                  fontSize: 30,
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
                  fontSize: 30,
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
                  fontSize: 30,
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
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.white,
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
                  SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                       onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55),
                        ),
                      ),
                      child: Text(
                        "Create Your Garage",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
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
