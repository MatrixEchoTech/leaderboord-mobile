import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:flutter_application_2/widgets/garage/addGarage/vehicle_sidebar.dart'
    show VehicleSideBar;
import 'package:flutter_application_2/widgets/profile/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesInformation extends StatefulWidget {
  const SalesInformation({super.key});

  @override
  State<SalesInformation> createState() => _SalesInformation();
}

class _SalesInformation extends State<SalesInformation> {
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
            VehicleSideBar(step: 5),

            const SizedBox(height: 20),

            // Example content to demonstrate scrolling
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF171C29),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
             
              ),
            ),
          ],
        ),
      ),
    );
  }
}
