import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/garage/car_journey.dart';
import 'package:flutter_application_2/widgets/garage/car_specs.dart';
import 'package:flutter_application_2/widgets/garage/comments_garage.dart';
import 'package:flutter_application_2/widgets/modals/add_event_modal.dart';
import 'package:flutter_application_2/widgets/modals/car_journey_modal.dart';
import 'package:flutter_application_2/widgets/modals/make_change_modal.dart';
import 'package:flutter_application_2/widgets/modals/technical_detail_modal.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_appbar.dart';
import '../profile/profile_page.dart';

class CarDetailPage extends StatefulWidget {
  final String carName;
  final String mainImage;
  final List<String> thumbnails;

  const CarDetailPage({
    super.key,
    required this.carName,
    required this.mainImage,
    required this.thumbnails,
  });

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  late String currentMainImage;

  @override
  void initState() {
    super.initState();
    currentMainImage = widget.mainImage;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: customAppBar(
        onLogoTap: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
        onProfileTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const ProfilePage())),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Car Image with border
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF444444), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.asset(
                      currentMainImage,
                      width: screenWidth - 32,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    // Top-left "See Car Journey" overlay
                    Positioned(
                      top: 12,
                      left: 12,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CarJourneyModal(),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0A1330),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: const Color(0xFF444444)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'images/refresh.png',
                                width: 18,
                                height: 18,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                "See Car Journey",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: widget.thumbnails.map((thumb) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentMainImage = thumb;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF444444)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        thumb,
                        width: 70,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            Text(
              widget.carName,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.0,
                letterSpacing: 0,
              ),
            ),

            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF171C29),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF444444)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'images/user2.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Owner name and role
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fernand (Owner)",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          letterSpacing: 0, // tracking: normal
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "2d 4h ago", // Timestamp
                        style: GoogleFonts.poppins(
                          color: const Color(
                            0x66FFFFFF,
                          ), // semi-transparent white
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(), // pushes the tag to the end

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFE5F5FC,
                      ), // background color #E5F5FC
                      border: Border.all(
                        color: const Color(0xFF017AAD),
                      ), // border #017AAD
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "For Sale",
                      style: GoogleFonts.lato(
                        color: const Color(0xFF017AAD),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // spacing after the container
            Text(
              "Top Category on Leaderboord",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                // First card
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: const Color(0x33293047), // #29304733
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // center content
                      children: [
                        Image.asset(
                          "images/lovely.png",
                          width: 16,
                          height: 16,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Most Liked Cars",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Second card
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Color(0x33293047), // #29304733
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // center content
                      children: [
                        Image.asset(
                          "images/eye.png",
                          width: 16,
                          height: 16,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Best Looking Car",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // spacing after the container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Quick Specs
                  Text(
                    "Quick specs",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),

                  // Right side
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const TechnicalDetailsModal(),
                            fullscreenDialog:
                                true, // makes it appear as a modal
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // ensures it takes only the space it needs
                        children: [
                          Flexible(
                            child: Text(
                              "See full technical details",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // prevents overflow
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            "images/arrow-right.png",
                            width: 14,
                            height: 14,
                            fit:
                                BoxFit.contain, // ensures full image is visible
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const CarSpecGrid(),

            const SizedBox(height: 20),
            Text(
              "Price",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff999999),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\$111.00",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                /// Make a Change Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MakeChangeModal(
                          onSubmit: () {
                            Navigator.of(
                              context,
                            ).pop(); // simply close modal on submit
                          },
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A1330),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: Color(0xFF444444),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    "Make a Change",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// Add Event Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AddEventModal(
                          onSubmit: () {
                            Navigator.of(
                              context,
                            ).pop(); // simply close modal on submit
                          },
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: Color(0xFF444444), // border color
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    "Add Event",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0A1330),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const CommentsGarage(),
            const SizedBox(height: 45),
            CarJourney(),
          ],
        ),
      ),
    );
  }
}
