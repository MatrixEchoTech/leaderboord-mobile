import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/garage/detail_car.dart';

class GarageCarCard extends StatefulWidget {
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
  State<GarageCarCard> createState() => _GarageCarCardState();
}

class _GarageCarCardState extends State<GarageCarCard> {
  bool showShareMenu = false;
  String? activeShareButton; // "top" or "bottom"

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF13131A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF444444), width: 1),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  // Car Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      widget.imagePath,
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
                    child: Text(
                      widget.carName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Like / Comment / Share icons
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left: like + comment
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
                                  "5",
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

                        // ⭐ TOP SHARE BUTTON
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeShareButton = "top";
                              showShareMenu = !showShareMenu;
                            });
                          },
                          child: Image.asset(
                            'images/share-2.png',
                            width: 33,
                            height: 29,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Edit + Delete buttons
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        const SizedBox(width: 8),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              size: 16,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Stats section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 13,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: StatBox(
                        iconPath: 'images/horsepower.png',
                        label: 'Horsepower',
                        value: widget.horsepower.toString(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: StatBox(
                        iconPath: 'images/timer.png',
                        label: '0-60 mph',
                        value: widget.zeroToSixty,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: StatBox(
                        iconPath: 'images/torque.png',
                        label: 'Torque',
                        value: widget.torque.toString(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: StatBox(
                        iconPath: 'images/top-speed.png',
                        label: 'Top Speed',
                        value: widget.topSpeed,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    // See Details Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CarDetailPage(
                                carName: widget.carName,
                                mainImage: widget.imagePath,
                                thumbnails: [
                                  widget.imagePath,
                                  'images/view1.png',
                                  'images/view2.png',
                                  'images/view3.png',
                                ],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF13131A),
                          side: const BorderSide(color: Color(0xFF444444)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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

                    // ⭐ BOTTOM SHARE BUTTON
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF13131A),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF444444)),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image.asset(
                          'images/share.png',
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            activeShareButton = "bottom";
                            showShareMenu = !showShareMenu;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),

          // ⭐ SHARE MENU POSITIONING LOGIC
          if (showShareMenu)
            Positioned(
              right: 16,
              bottom: activeShareButton == "top" ? 290 : 70,
              child: buildShareMenu(),
            ),
        ],
      ),
    );
  }

  // Popup UI
  Widget buildShareMenu() {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF171C29),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shareItem(Icons.link, "Copy link"),
          const SizedBox(height: 12),
          shareItem(Icons.share, "Share on Twitter"),
          const SizedBox(height: 12),
          shareItem(Icons.facebook, "Share on Facebook"),
        ],
      ),
    );
  }

  Widget shareItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() => showShareMenu = false);
      },
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}


// STAT BOX
class StatBox extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final String? valueUnit;

  const StatBox({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
    this.valueUnit,
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
                style:
                    const TextStyle(color: Color(0xFF4C98F1), fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                valueUnit != null ? "$value $valueUnit" : value,
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
