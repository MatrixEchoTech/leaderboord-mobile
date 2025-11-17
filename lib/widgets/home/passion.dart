import 'package:flutter/material.dart';

class Passion extends StatelessWidget {
  const Passion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: const Text(
        "Accelerate Your Passion.",
        style: TextStyle(
          fontFamily: "Helvetica",
          fontWeight: FontWeight.w400,
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      
    );
    
  }
}
