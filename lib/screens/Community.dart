import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Image.asset(
          "/images/newLogo.png",   // your image
          height:30,
        ),
      ),
      body: const Center(
        child: Text(
          "Settings Page Content Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
