import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/garage/car_journey_timeline.dart';
import 'package:flutter_application_2/widgets/modals/add_event_modal.dart';
import 'package:google_fonts/google_fonts.dart';

class CarJourney extends StatelessWidget {
  const CarJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D111A),
        borderRadius: BorderRadius.circular(12),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// -----------------------
          /// HEADER ROW
          /// -----------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left side: Title + description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Car Journey",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Updates badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF171C29),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Color(0x334C98F1)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
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
                          "2",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Updates",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Add new event button
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AddEventModal(
                        onSubmit: () => Navigator.of(context).pop(),
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Add\nNew\nEvent",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
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
            description: "Engine oil and filter replaced at 15,200 km.",
            notesController: TextEditingController(),
          ),
                    const SizedBox(height: 20),
          JourneyEventCard(
            date: "15 Nov 2025",
            title: "Oil Change Completed",
            description: "Engine oil and filter replaced at 15,200 km.",
            notesController: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
