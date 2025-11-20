import 'package:flutter/material.dart';

class CarFeatures extends StatelessWidget {
  const CarFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0A0A0B), // background color
    
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset("assets/images/bg-2.png", fit: BoxFit.cover),
            
          ),

          Positioned.fill(child: Container(color: Colors.transparent)),

          // Scrollable single column
          SingleChildScrollView(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCard(
                  title: "Add to Garage",
                  titleBorderColor: Colors.blue.shade700,
                  description:
                      "Save cars in your personal garage with photos, specs, and mods.",
                  stat: "200,000 🏎️",
                  statLabel: "CARS ADDED TO GARAGE",
                ),
                const SizedBox(height: 20),
                _buildCard(
                  title: "Compete on Leaderboard",
                  titleBorderColor: Colors.blue.shade400,
                  description:
                      "Climb objective and subjective leaderboords — fastest lap, best mod, crowd fave.",
                  stat: "24 🏁",
                  statLabel: "TOTAL CATEGORIES",
                ),
                const SizedBox(height: 20),
                _buildCard2(
                  title: "Event Timeline",
                  titleBorderColor: Colors.green.shade700,
                  description:
                      "Coordinate any changes history of your car in here, so you can track your car journey.",
                ),
                const SizedBox(height: 20),
                _buildCard(
                  title: "Roast & Roastback",
                  titleBorderColor: Colors.green.shade700,
                  description:
                      "Post, roast, and react in the feed — healthy banter backed by community votes.",
                  stat: "99+ 🔥",
                  statLabel: "ROASTED POSTS",
                ),
                 const SizedBox(height: 20),
                _buildCard2(
                  title: "Set Reminders",
                  titleBorderColor: Colors.green.shade700,
                  description:
                      "so you don't miss the events",
                ),
                const SizedBox(height: 20),
                _buildCard(
                  title: "Message & Chat",
                  titleBorderColor: Colors.purple.shade400,
                  description:
                      "Coordinate meets, trade parts, and show off with built-in chat.",
                  stat: "24 🏁",
                  statLabel: "TOTAL CATEGORIES",
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }

 // ------------------ Card Widget with stat ------------------
Widget _buildCard({
  required String title,
  required Color titleBorderColor,
  required String description,
  required String stat,
  required String statLabel,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(25, 15, 20,25),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.28),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: titleBorderColor, width: 3),
            ),
          ),
          padding: const EdgeInsets.only(left: 6, bottom: 4),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),

        const SizedBox(height: 12),   //  MORE SPACE BELOW TITLE

        // Description
        Text(
          description,
          style: const TextStyle(color: Color(0xFFC4C4C4), fontSize: 13),
        ),

        const SizedBox(height: 14),   //  MORE SPACE BELOW DESCRIPTION

        // Stat Row
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xFF1FCFF1),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              stat,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),

        const SizedBox(height: 10),   // ⭐ MORE SPACE BELOW STAT

        Text(
          statLabel.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
  );
}


  // ------------------ Card Widget without stat ------------------
  Widget _buildCard2({
    required String title,
    required Color titleBorderColor,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(25, 15, 20,25),
      decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.28),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with colored left border
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: titleBorderColor, width: 3),
              ),
            ),
            padding: const EdgeInsets.only(left: 6, bottom: 4),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Description
          Text(
            description,
            style: const TextStyle(color: Color(0xFFC4C4C4), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
