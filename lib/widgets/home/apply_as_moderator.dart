import 'package:flutter/material.dart';

class ApplyAsModerator extends StatelessWidget {
  final VoidCallback onClose;

  const ApplyAsModerator({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Apply as a moderator"),
      content: const Text("Modal opened."),
      actions: [
        TextButton(onPressed: onClose, child: const Text("Close")),
      ],
    );
  }
}
