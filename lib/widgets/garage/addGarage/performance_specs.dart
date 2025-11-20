import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:flutter_application_2/widgets/garage/addGarage/performance_specs.dart';
import 'package:flutter_application_2/widgets/garage/addGarage/vehicle_sidebar.dart'
    show VehicleSideBar;
import 'package:flutter_application_2/widgets/profile/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformanceSpecs extends StatefulWidget {
  const PerformanceSpecs({super.key});

  @override
  State<PerformanceSpecs> createState() => _MainFormState();
}

class _MainFormState extends State<PerformanceSpecs> {
  final TextEditingController topspeedController = TextEditingController();
  final TextEditingController numberplateController = TextEditingController();
  final TextEditingController nickhereController = TextEditingController();
  final TextEditingController horsepowerController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController torqueController = TextEditingController();
  // Selected values
  String? selectedMake;
  String? selectedModal;
  String? selectedCity;
  bool reminderEnabled = true;
  // Add this variable in your State class
  String? stillOwnCar;
  // Sample data
  final List<String> make = List.generate(20, (index) => "Make ${index + 1}");
  final List<String> modal = List.generate(20, (index) => "Modal ${index + 1}");
  final List<String> cities = List.generate(20, (index) => "City ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onLogoTap: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
        onProfileTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const ProfilePage())),
      ),
      backgroundColor: const Color(0xFF0D111A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              "Luxury Car Detailing",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            // Border line below heading
            Container(
              height: 1,
              width: double.infinity,
              color: const Color(0xFF999999),
            ),
            const SizedBox(height: 20),

            // Sidebar
            VehicleSideBar(step: 2),

            const SizedBox(height: 20),

            // Example content below sidebar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF171C29),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // align text to left
                children: [
                  Text(
                    "Performance Spec",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "Showcase your car’s performance numbers.",
                    style: GoogleFonts.poppins(
                      fontSize: 16, // smaller for description
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Torque",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            TextField(
                              controller: torqueController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter here',
                                hintStyle: TextStyle(
                                  color: Color(0xFF838383),
                                  fontSize: 14,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Unit",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(
                              height: 50,
                              child: DropdownButtonFormField2<String>(
                                value: selectedModal,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                hint: const Text(
                                  "Select Unit",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                items: ["Nm", "Lb ft"]
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedModal = value;
                                  });
                                },
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 100, // small since only 2 options
                                  decoration: BoxDecoration(
                                    color: Color(0xFF171C29),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "0-62 Time",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            TextField(
                              controller: timeController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter here',
                                hintStyle: TextStyle(
                                  color: Color(0xFF838383),
                                  fontSize: 14,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Unit",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(
                              height: 50,
                              child: DropdownButtonFormField2<String>(
                                value: selectedModal,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                hint: const Text(
                                  "Select Unit",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                items: ["KMH", "MPH"]
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedModal = value;
                                  });
                                },
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 100, // small since only 2 options
                                  decoration: BoxDecoration(
                                    color: Color(0xFF171C29),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Top Speed",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            TextField(
                              controller: topspeedController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter here',
                                hintStyle: TextStyle(
                                  color: Color(0xFF838383),
                                  fontSize: 14,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Unit",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(
                              height: 50,
                              child: DropdownButtonFormField2<String>(
                                value: selectedModal,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                hint: const Text(
                                  "Select Unit",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                items: ["KMH", "MPH"]
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedModal = value;
                                  });
                                },
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 100, // small since only 2 options
                                  decoration: BoxDecoration(
                                    color: Color(0xFF171C29),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Horsepower",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ), // small space between label and field
                            TextField(
                              controller: horsepowerController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                height: 1.2, // tight line height
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter here',
                                hintStyle: TextStyle(
                                  color: Color(0xFF838383),
                                  fontSize: 14,
                                ),
                                isDense:
                                    true, // reduces vertical space inside TextField
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ), // fine-tuned
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // buttons
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/arrow-left.png',
                                width: 16,
                                height: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Cancel",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Navigate to Performance Specs page
                          },

                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: GoogleFonts.inter(
                                  color: Color(0xFF171C29),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Image.asset(
                                'images/arrow-right-blue.png',
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
