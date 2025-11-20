import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:flutter_application_2/widgets/garage/addGarage/performance_specs.dart';
import 'package:flutter_application_2/widgets/garage/addGarage/vehicle_sidebar.dart'
    show VehicleSideBar;
import 'package:flutter_application_2/widgets/profile/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _MainFormState();
}

class _MainFormState extends State<BasicInformation> {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController numberplateController = TextEditingController();
  final TextEditingController nickhereController = TextEditingController();

  // Selected values
  String? selectedMake;
  String? selectedModal;
    String? selectedColor;
  String? selectedCity;
  bool reminderEnabled = true;
  // Add this variable in your State class
  String? stillOwnCar;
  // Sample data
  final List<String> make = List.generate(20, (index) => "Make ${index + 1}");
  final List<String> modal = List.generate(20, (index) => "Modal ${index + 1}");
  final List<String> color = List.generate(20, (index) => "Color ${index + 1}");

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
            VehicleSideBar(step: 1),

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
                    "Basic Information",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "Tell us the essentials about your car to start building your profile.",
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
                              "Make",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              height: 50,
                              child: DropdownButtonFormField2<String>(
                                value: selectedMake,
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
                                  "Select Country",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                items: make
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
                                    selectedMake = value;
                                    selectedModal = null;
                                  });
                                },
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 200,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF171C29),
                                  ),
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
                              "Modal",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
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
                                  "Select ",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                items: modal
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
                                  maxHeight: 200,
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
                              "Year",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextField(
                              controller: yearController,
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
                              "Color",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
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
                                  "Select Color",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                items: color
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
                                    selectedColor = value;
                                  });
                                },
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 200,
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
                              "Number Plate",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextField(
                              controller: numberplateController,
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
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nickname",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextField(
                              controller: nickhereController,
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Do you still own this car?",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              height: 50,
                              child: DropdownButtonFormField2<String>(
                                value: stillOwnCar,
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                hint: const Text(
                                  "Select Option",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                items: ['Yes', 'No']
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
                                    stillOwnCar = value;
                                  });
                                },
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 150,
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
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // space between text and switch
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // center vertically
                    children: [
                      Text(
                        "Make this vehicle Private?",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: reminderEnabled,
                          onChanged: (v) => setState(() => reminderEnabled = v),
                          activeThumbColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          trackColor: WidgetStateProperty.resolveWith<Color>((
                            states,
                          ) {
                            if (states.contains(MaterialState.selected)) {
                              return Color(0xFFCB3CFF); // track color when ON
                            }
                            return Color(0xFF374151); // track color when OFF
                          }),
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PerformanceSpecs(),
                              ),
                            );
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
