import 'package:flutter/material.dart';

class PassionSection extends StatefulWidget {
  const PassionSection({super.key});

  @override
  State<PassionSection> createState() => _PassionSectionState();
}

class _PassionSectionState extends State<PassionSection> {
  String selected = "Car Customization Showdown";

  final List<String> buttons = [
    'Car Customization Showdown',
    'Ultimate Racing Modifications',
    'Entry Fees',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 30, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          const Text(
            "Accelerate your passion.",
            style: TextStyle(
              fontFamily: "Helvetica",
              fontWeight: FontWeight.w400,
              fontSize: 28,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          /// TABS
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: buttons.map((label) {
              final bool isSelected = selected == label;

              return GestureDetector(
                onTap: () => setState(() => selected = label),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 14,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xff111111)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xffA962FF)
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 25),

          /// CONTENT AREA
          _buildSelectedContent(),
        ],
      ),
    );
  }

  Widget _buildSelectedContent() {
    if (selected == 'Car Customization Showdown') {
      return _buildSection(
        image: "/images/car1.png",

        text:
            "Join the excitement of the Car Customization Showdown, where enthusiasts showcase their unique modifications and compete for the title of best car. From sleek designs to powerful performance upgrades, this contest celebrates creativity and engineering prowess.",
        lines: const ["Discover more", "Car Modifications", "Latest Trends"],
      );
    }

    if (selected == 'Ultimate Racing Modifications') {
      return _buildSection(
        image: "/images/car2.png",

        text:
            "Experience the thrill of the Nitrocross Championship, where top drivers push their custom-built machines to the limit on challenging tracks. Witness high-speed races, daring maneuvers, and fierce rivalries as teams compete for the ultimate victory. ",
        lines: const [
          "Learn more",
          "Racing Enhancements",
          "Performance Upgrades",
        ],
      );
    }

    return _buildSection(
      image: "/images/car3.png",

      text:
          "Experience the thrill of the Nitrocross Championship—high-speed races, daring maneuvers, and fierce rivalries for ultimate victory.",
      lines: const [
        "Learn More About",
        "Free Entry Fees",
        "the Hottest Designs",
      ],
    );
  }

  Widget _buildSection({
    required String image,

    required String text,
    required List<String> lines,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// IMAGE
        ClipRRect(
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),

        /// TEXT CONTAINER
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xff1A1A1A)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("/images/newLogo.png", height: 30),

              const SizedBox(height: 12),

              Text(
                text,
                style: const TextStyle(
                  fontFamily: "Helvetica",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 16,
                runSpacing: 10,
                children: lines
                    .map(
                      (e) => Text(
                        e,
                        style: const TextStyle(
                          color: Color(0xffA962FF),
                          fontSize: 16,
                          fontFamily: "Helvetica",
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// BRAND LOGOS (SVG FIXED)
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: const Color(0x66261F26)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("/images/jag.png", width: 50),
              Image.asset("/images/bug.png", width: 50),
              Image.asset("/images/ben.png", width: 50),
              Image.asset("/images/odi.png", width: 50),
            ],
          ),
        ),
      ],
    );
  }
}
