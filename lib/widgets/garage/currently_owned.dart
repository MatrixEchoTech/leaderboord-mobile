import 'package:flutter/material.dart';

class GarageCarCard extends StatelessWidget {
  final String imagePath;
  final String carName;
  final int horsepower;
  final String zeroToSixty;
  final int torque;
  final String topSpeed;

  const GarageCarCard({
    super.key,
    required this.imagePath,
    required this.carName,
    required this.horsepower,
    required this.zeroToSixty,
    required this.torque,
    required this.topSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF13131A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF444444), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Replace the image + car name section with this:
          Stack(
            children: [
              // Car Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Car Name overlay
              Positioned(
                left: 16,
                right: 16,
                bottom: 44,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    carName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Like, Comment, and Share row
              Positioned(
                left: 16,
                right: 16,
                bottom: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side: Like & Comment
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'images/like.png',
                              width: 33,
                              height: 29,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Image.asset(
                              'images/comment.png',
                              width: 33,
                              height: 29,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Right side: Share
                    Image.asset(
                      'images/share-2.png',
                      width: 33,
                      height: 29,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              // Top right: Edit & Delete buttons with rounded background
              Positioned(
                top: 12,
                right: 12,
                child: Row(
                  children: [
                    // Edit button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // Rounded background
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit, // Material edit icon
                          size: 16,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Edit action
                        },
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Delete button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // Rounded background
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete, // Material delete icon
                          size: 16,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Delete action
                        },
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // First row of stats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: StatBox(
                    iconPath: 'images/horsepower.png',
                    label: 'Horsepower',
                    value: horsepower.toString(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: StatBox(
                    iconPath: 'images/timer.png',
                    label: '0-60 mph',
                    value: zeroToSixty,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Second row of stats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: StatBox(
                    iconPath: 'images/torque.png',
                    label: 'Torque',
                    value: torque.toString(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: StatBox(
                    iconPath: 'images/top-speed.png',
                    label: 'Top Speed',
                    value: topSpeed,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // See Details Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF13131A),
                      side: const BorderSide(
                        color: Color(0xFF444444),
                      ), // border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "See Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          'images/arrow-right.png',
                          width: 12,
                          height: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Share Button
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF444444)),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF13131A),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Image.asset(
                      'images/share.png', // your share icon
                      width: 16,
                      height: 16,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// Single stat box
class StatBox extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final String? valueUnit;

  const StatBox({
    required this.iconPath,
    required this.label,
    required this.value,
    this.valueUnit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0x33293047),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Color(0xFF4C98F1), fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                valueUnit != null ? '$value $valueUnit' : value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
