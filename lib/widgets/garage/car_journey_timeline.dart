import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JourneyEventCard extends StatelessWidget {
  final String? imagePath; // optional image
  final String date; // mandatory
  final String title; // mandatory
  final String description; // mandatory
  final TextEditingController notesController; // last input

  const JourneyEventCard({
    super.key,
    this.imagePath,
    required this.date,
    required this.title,
    required this.description,
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF131A26),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF1E2942)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // OPTIONAL IMAGE
          if (imagePath != null) ...[
            ClipRRect(
              child: Image.asset(
                imagePath!,
                height: 118,
                width: 217,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
          ],

          // DATE
          Text(
            date,
            style: GoogleFonts.lato(
              color: Color(0xFFD5D5D5),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 6),

          // TITLE
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          // DESCRIPTION
          Text(
            description,
            style: GoogleFonts.lato(
              color: Color(0xFFD5D5D5),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 38),

          Text(
            "Comments",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // USER IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "images/user2.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 12),

              // USERNAME + COMMENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      "This is really great work!",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFD5D5D5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 38),
          // INPUT FIELD
          Row(
            children: [
              
              Expanded(
                child: SizedBox(
                  height: 32, // FIXED HEIGHT
                  child: TextField(
                    controller: notesController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Type something ...",
                      hintStyle: const TextStyle(
                        color: Color(0XFFAEB9E1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF171C29),

                      // Remove inside padding so height stays exact
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF343B4F)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // SEND BUTTON
              GestureDetector(
                onTap: () {
                  print("Send pressed");
                  print(notesController.text);
                },
                child: Container(
                  width: 42,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/send-2.png",
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
