import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ----------------------------------
///  LOCAL SPECIFICATIONS LIST
/// ----------------------------------
class TechnicalSpec {
  final String title;
  final String value;

  TechnicalSpec({required this.title, required this.value});
}

List<TechnicalSpec> technicalSpecs = [
  TechnicalSpec(title: "Engine Size", value: "1.0L 1"),
  TechnicalSpec(title: "Cylinders", value: "1"),
  TechnicalSpec(title: "Induction", value: "Naturally Aspirated"),
  TechnicalSpec(title: "Transmission", value: "Manual"),
  TechnicalSpec(title: "Drivetrain", value: "Rwd"),
  TechnicalSpec(title: "Fuel Type", value: "Petrol"),
  TechnicalSpec(title: "Weight", value: "111 kg"),
  TechnicalSpec(title: "Seats", value: "4"),
  TechnicalSpec(title: "Doors", value: "2"),
];

/// ----------------------------------
///  MAIN MODAL
/// ----------------------------------
class TechnicalDetailsModal extends StatelessWidget {
  const TechnicalDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    /// ✔ On small screens → full width  
    /// ✔ On large screens → center with max-width 600
 final double modalWidth = width < 600 ? width : 600.0;

    return Scaffold(
      backgroundColor: const Color(0xFF171C29),

      body: Center(
        child: Container(
          width: modalWidth,
          padding: const EdgeInsets.all(16),

          child: SingleChildScrollView(
            child: Column(
              children: [
                /// TITLE BEFORE GRID
                Text(
                  "Full Technical Details",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 12),

                /// SPEC BOXES
                for (final item in technicalSpecs) ...[
                  _buildDetailBox(item),
                  const SizedBox(height: 12),
                ],

                const SizedBox(height: 8),

                /// BACK BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A1330),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: Color(0xFF444444), // border #444444
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0),
                          child: Image.asset(
                            "images/arrow-right.png",
                            width: 16,
                            height: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Back",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ----------------------------------
  ///  INDIVIDUAL BOX COMPONENT
  /// ----------------------------------
  Widget _buildDetailBox(TechnicalSpec item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0x33293047), // bg #29304733
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF374151), // gray-700
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item.title,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF858585),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            item.value,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
