import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CommunitySection extends StatelessWidget {
  CommunitySection({super.key});

  // Asset images
  final List<String> images = [
    "assets/images/community-car-1.png",
    "assets/images/community-car-2.png",
    "assets/images/car1.png",
    "assets/images/car3.png",
    "assets/images/community-car-3.png",
  ];

  final int totalCount = 1200;

  String getImage(int index) {
    if (images.length > index && images[index].isNotEmpty) {
      return images[index];
    }
    return "assets/images/community-car-1.png";
  }

  @override
  Widget build(BuildContext context) {
    final cardList = _buildCards(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Center(
            child: Text(
              "Join a thriving community.",
              style: const TextStyle(
                fontFamily: "Helvetica",
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 25),

          /// CAROUSEL
          CarouselSlider(
            options: CarouselOptions(
              height: 430,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 0.8, 
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
            ),
            items: cardList,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    return [
      _wrapGap(_wideImage(context, getImage(0))),
      _wrapGap(_halfImageStats(context, getImage(1))),
      _wrapGap(_normalImage(context, getImage(2))),
      _wrapGap(_statsSmallImage(context, getImage(3))),
      _wrapGap(_normalImage(context, getImage(4))),
    ];
  }

  Widget _wrapGap(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: child,
    );
  }

  // ------------------ IMAGE WIDGETS ------------------
  Widget _wideImage(BuildContext context, String url) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth > 700 ? 700.0 : screenWidth * 0.9;

    return SizedBox(
      width: imageWidth,
      child: Image.asset(url, height: 420, fit: BoxFit.cover),
    );
  }

  Widget _normalImage(BuildContext context, String url) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth > 300 ? 300.0 : screenWidth * 0.9;

    return SizedBox(
      width: imageWidth,
      child: Image.asset(url, height: 420, fit: BoxFit.cover),
    );
  }

  Widget _halfImageStats(BuildContext context, String url) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth > 300 ? 300.0 : screenWidth * 0.9;

    return SizedBox(
      width: imageWidth,
      child: Column(
        children: [
          Image.asset(url, height: 210, width: imageWidth, fit: BoxFit.cover),
          const SizedBox(height: 20),
          _statsBox(context, imageWidth),
        ],
      ),
    );
  }

  Widget _statsSmallImage(BuildContext context, String url) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth > 300 ? 400.0 : screenWidth * 0.9;

    return SizedBox(
      width: imageWidth,
      child: Column(
        children: [
          _statsBox(context, imageWidth),
          const SizedBox(height: 20),
          Image.asset(url, height: 210, width: imageWidth, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Widget _statsBox(BuildContext context, double width) {
    return Container(
      height: 200,
      width: width,
      color: const Color(0xff19161C),
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$totalCount",
            style: const TextStyle(
              fontFamily: "Helvetica",
              fontSize: 42,
              fontWeight: FontWeight.w400,
              color: Color(0xff3290C2),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "CARS ARE POSTED ON OUR COMMUNITY",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Helvetica",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffEAEAEA),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
