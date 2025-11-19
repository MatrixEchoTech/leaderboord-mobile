import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GarageProfileBox extends StatelessWidget {
  final String userName;
  final String memberYear;
  final int totalCars;
  final String profileImage;

  const GarageProfileBox({
    super.key,
    this.userName = "You",
    this.memberYear = "2025",
    required this.totalCars,
    this.profileImage = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF171C29),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ---------------- PROFILE IMAGE ----------------
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black87,
                  image: profileImage.isNotEmpty
                      ? DecorationImage(
                          image: AssetImage(profileImage),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: profileImage.isEmpty
                    ? const Icon(Icons.person, color: Colors.white, size: 40)
                    : null,
              ),
            ),

            const SizedBox(height: 12),

            // ---------------- USER NAME ----------------
            Text(
              userName,
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            // ---------------- MEMBER INFO ----------------
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Member since $memberYear  ",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFFBDBDBD),
                    ),
                  ),
                  TextSpan(
                    text: "$totalCars Cars Total",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF4C98F1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ---------------- BUTTONS ROW 1 ----------------
            Row(
              children: [
                Expanded(
                  child: _imageButton("Add a Vehicle", "/images/add.png"),
                ),
                const SizedBox(width: 12),

            
                Expanded(
                  child: _materialIconButton(
                    "Visibility (Public)",
                    Icons.public,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------------- BUTTONS ROW 2 ----------------
            Row(
              children: [
            
                Expanded(
                  child: _materialIconButton(
                    "Edit Profile",
                    Icons.edit_square,
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: _imageButton(
                    "Share Garage",
                    "/images/share.png",
                    isBlue: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- BUTTON WITH IMAGE (original) ----------------
  Widget _imageButton(String label, String iconPath, {bool isBlue = false}) {
    return SizedBox(
      height: 36,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isBlue ? const Color(0xFF4C98F1) : Colors.white,
          foregroundColor: isBlue ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 16,
              height: 16,
              color: isBlue ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: isBlue ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- BUTTON WITH MATERIAL ICON 
  Widget _materialIconButton(String label, IconData icon) {
    return SizedBox(
      height: 36,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: Colors.black),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
