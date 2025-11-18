import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("/images/user2.png"), // your profile image
            ),
            const SizedBox(height: 20),
            // Profile heading
            const Text(
              "Your Name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
