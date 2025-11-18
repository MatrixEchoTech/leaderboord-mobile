import 'package:flutter/material.dart';
import 'dart:html' as html;

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 48,
        horizontal: isMobile ? 20 : 64,
      ),

      decoration: BoxDecoration(
        color: Colors.black,
        border: const Border(
          top: BorderSide(
            color: Color(0x33FFFFFF), // correct syntax
            width: 1, // border thickness
          ),
        ),
      ),

      child: Column(
        children: [
          // Top section: Contact + Follow
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: isMobile ? double.infinity : screenWidth * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Contact us",
                      style: TextStyle(fontSize: 12, color: Color(0x66FFFFFF)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "+1 (406) 555-0120",
                      style: TextStyle(fontSize: 14, color: Color(0xCCFFFFFF)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "+1 (480) 555-0103",
                      style: TextStyle(fontSize: 14, color: Color(0xCCFFFFFF)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "hello@leaderboord.com",
                      style: TextStyle(fontSize: 14, color: Color(0xCCFFFFFF)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 24 : 0, width: isMobile ? 0 : 24),
              SizedBox(
                width: isMobile ? double.infinity : screenWidth * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Follow us",
                      style: TextStyle(fontSize: 12, color: Color(0x66FFFFFF)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL('https://www.facebook.com'),
                          child: Image.asset(
                            '/images/facebook.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.google.com'),
                          child: Image.asset(
                            '/images/google.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.instagram.com'),
                          child: Image.asset(
                            '/images/instagram.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.youtube.com'),
                          child: Image.asset(
                            '/images/youtube.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            "Leaderboord © 2025 All rights reserved.",
            style: TextStyle(fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
