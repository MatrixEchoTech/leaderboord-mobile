import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleSideBar extends StatelessWidget {
  final int step; // current step (1-based)

  const VehicleSideBar({super.key, required this.step});

  static const List<String> stepTitles = [
    'Basic Information',
    'Performance Specs',
    'Technical Details',
    'Additional Details',
    'Sale Information',
  ];

  static const List<String> stepDescriptions = [
    'Tell us the essentials about your car to start building your profile.',
    "Showcase your car's performance numbers.",
    'Add more technical information to complete your car profile.',
    'Provide practical details that matter for ownership and comparisons.',
    'Ready to showcase?',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: double.infinity,
      color: const Color(0xFF171C29),
      child: Column(
        children: List.generate(stepTitles.length, (idx) {
          final s = idx + 1;
          final isCompleted = step > s;
          final isCurrent = step == s;

          final circleColor = isCurrent || isCompleted
              ? Colors.white
              : const Color(0xFF23283A);
          final textColor = isCurrent
              ? const Color(0xFF171C29)
              : isCompleted
              ? Colors.white
              : const Color(0xFF999999);
          final lineColor = step > s ? Colors.white : const Color(0xFF23283A);

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? Colors.white
                            : const Color(0xFF23283A), // white bg for active
                        border: Border.all(
                          color: isCompleted || isCurrent
                              ? Colors.white
                              : const Color(0xFF444444),
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white, // white tick for completed
                              )
                            : Text(
                                '$s',
                                style: TextStyle(
                                  color: isCurrent
                                      ? const Color(0xFF171C29)
                                      : Colors.white, // dark text for active
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),

                    // Line
                    if (s != stepTitles.length)
                      Container(width: 2, height: 56, color: lineColor   ,margin: const EdgeInsets.only(top: 5)), // small space from circle),
                  ],
                ),
                const SizedBox(width: 12),
                // Title + Description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stepTitles[idx],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: isCurrent || isCompleted
                              ? Colors.white
                              : const Color(0xFF999999),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        stepDescriptions[idx],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: isCurrent || isCompleted
                              ? Colors.white
                              : const Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
