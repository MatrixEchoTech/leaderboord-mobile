import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnicalDetailsModal extends StatelessWidget {
  const TechnicalDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171C29), // dark background
      appBar: AppBar(
        backgroundColor: Color(0xFF171C29),
        elevation: 0,
        title: Text(
          "Technical Details",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        )
      ),
    );
  }
}
