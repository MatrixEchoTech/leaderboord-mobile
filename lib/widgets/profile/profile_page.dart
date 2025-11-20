import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController newDataController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // Selected values
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  bool reminderEnabled = true;
  // Sample data
  final List<String> countries = List.generate(
    20,
    (index) => "Country ${index + 1}",
  );
  final List<String> states = List.generate(
    20,
    (index) => "State ${index + 1}",
  );
  final List<String> cities = List.generate(20, (index) => "City ${index + 1}");

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171C29),
      appBar: customAppBar(
        onLogoTap: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
        onProfileTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const ProfilePage())),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Keep your personal information up to date",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/user2.png"),
                      ),
                      Positioned(
                        bottom: -17,
                        right: -20,
                        child: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset(
                              "images/camera-button.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Recommended size: 400x400px, Max 2MB",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFCFCFCF),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Basic Info
            Text(
              "Basic Information",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Name & Email
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF999999),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        controller: nameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter name',
                          hintStyle: TextStyle(
                            color: Color(0xFF838383),
                            fontSize: 14,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
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
                        "Email Address",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF999999),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        controller: emailController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter email address',
                          hintStyle: TextStyle(
                            color: Color(0xFF838383),
                            fontSize: 14,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Country & State in one row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country",
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
                          value: selectedCountry,
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
                          items: countries
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCountry = value;
                              selectedState = null;
                            });
                          },
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                            decoration: BoxDecoration(color: Color(0xFF171C29)),
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
                        "State",
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
                          value: selectedState,
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
                            "Select State",
                            style: TextStyle(color: Colors.white38),
                          ),
                          items: states
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                            });
                          },
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                            decoration: BoxDecoration(color: Color(0xFF171C29)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // City row, half width
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City",
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
                          value: selectedCity,
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
                            "Select City",
                            style: TextStyle(color: Colors.white38),
                          ),
                          items: cities
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                            decoration: BoxDecoration(color: Color(0xFF171C29)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Container()), // Empty for layout balance
              ],
            ),
            const SizedBox(height: 40),

            // Basic Info
            Text(
              "Change Password",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Current Password",
              style: GoogleFonts.poppins(
                color: Color(0xFF999999),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              controller: newDataController,
              decoration: const InputDecoration(
                hintText: "Enter here",
                hintStyle: TextStyle(color: Colors.white38),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),

            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Password",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF999999),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        controller: nameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter here',
                          hintStyle: TextStyle(
                            color: Color(0xFF838383),
                            fontSize: 13,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm New Password",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF999999),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        controller: emailController,
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
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Basic Info
            Text(
              "Preferences",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT SIDE (Texts)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recieve Email Notification ",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "You will get email for every update.",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA3A3A3),
                        ),
                      ),
                    ],
                  ),
                ),

                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: reminderEnabled,
                    onChanged: (v) => setState(() => reminderEnabled = v),
                    activeThumbColor: Colors.white, // thumb color when ON
                    inactiveThumbColor: Colors.white, // thumb color when OFF
                    trackColor: WidgetStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.blueAccent; // track color when ON
                      }
                      return Color(0xFF374151); // track color when OFF
                    }),
                    overlayColor: WidgetStateProperty.all(
                      Colors.transparent,
                    ), // removes ripple/overlay
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Buttons
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF171C29),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Profile Saved!")),
                      );
                    },
                    child: Text(
                      "Save Changes",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF171C29),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
