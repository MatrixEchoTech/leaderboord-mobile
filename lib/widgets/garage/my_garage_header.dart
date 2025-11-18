import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGarageHeader extends StatelessWidget {
  final String parent;
  final String current;

  const MyGarageHeader({
    super.key,
    this.parent = "My Garage",
    this.current = "Garage Detail",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Breadcrumb text
          Row(
            children: [
              Text(
                parent,
                style: GoogleFonts.inter(
                  color: Color(0xFF999999),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_right_alt,
                size: 18,
                color: Colors.white54,
              ),
              const SizedBox(width: 6),
              Text(
                current,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// Underline
          Container(width: double.infinity, height: 1, color: Colors.white),
        ],
      ),
    );
  }
}
