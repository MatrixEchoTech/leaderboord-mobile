import 'package:flutter/material.dart';

class VotedCommunity extends StatelessWidget {
  final String? makeId;

  const VotedCommunity({super.key, this.makeId});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "VotedCommunity (Cards Here)",
      style: TextStyle(color: Colors.white),
    );
  }
}
