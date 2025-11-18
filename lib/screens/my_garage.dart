import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
          "My Garage",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
