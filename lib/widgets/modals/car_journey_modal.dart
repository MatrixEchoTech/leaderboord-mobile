import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/garage/car_journey_timeline.dart';
import 'package:google_fonts/google_fonts.dart';

class CarJourneyModal extends StatelessWidget {
  const CarJourneyModal({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isLargeScreen = screenWidth > 600;

    return Scaffold(
  backgroundColor: Color.fromARGB(255, 43, 54, 70),


      /// CLOSE WHEN CLICK OUTSIDE
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),

        child: Center(
          child: Padding(
            /// Top/Bottom spacing so modal sits center vertically
            padding: const EdgeInsets.symmetric(vertical: 30),

            child: GestureDetector(
              /// This prevents closing when tapping inside modal
              onTap: () {},

              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 600),

                /// Height is NOT full — naturally centered
                decoration: BoxDecoration(
                  color: const Color(0xFF0D111A),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Car Journey",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "A timeline of milestones, modifications, and updates for this car.",
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// --- Updates badge + Add button Row ---
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF171C29),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: const Color(0x334C98F1),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "2 Updates",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 16),

                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Add New Event",
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          JourneyEventCard(
                            imagePath: "/images/car1.png",
                            date: "12 Jan 2025",
                            title: "Oil Change Completed",
                            description:
                                "Engine oil and filter replaced at 15,200 km.",
                            notesController: TextEditingController(),
                          ),

                          const SizedBox(height: 12),

                          JourneyEventCard(
                            date: "15 Nov 2025",
                            title: "Wheel Alignment",
                            description:
                                "All tyres balanced + front alignment done.",
                            notesController: TextEditingController(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
