import 'package:flutter/material.dart';

class Passion extends StatelessWidget {
  const Passion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,  // background color
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: const Center(
        child: Text(
          "Accelerate Your Passion",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
