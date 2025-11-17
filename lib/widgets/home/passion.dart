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
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// CENTERED TITLE + TABS
          Center(
            child: Column(
              children: [
                /// TITLE
                const Text(
                  "Accelerate your passion.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 20),

                /// TABS
                Wrap(
                  alignment: WrapAlignment.center,
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
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

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
        lines: const ["Discover more", "Car Modifications", "Latest Trends "],
      );
    }

    if (selected == 'Ultimate Racing Modifications') {
      return _buildSection(
        image: "/images/car2.png",

        text:
            "Experience the thrill of the Nitrocross Championship, where top drivers push their custom-built machines to the limit on challenging tracks. Witness high-speed races, daring maneuvers, and fierce rivalries as teams compete for the ultimate victory. ",
        lines: const [
          "Learn more",
          "Racing Enhancement",
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
          padding: const EdgeInsets.all(20),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double itemWidth = constraints.maxWidth / 3; // 3 columns

                    return Wrap(
                      spacing: 0,
                      runSpacing: 10,
                      children: lines.map((text) {
                        return SizedBox(
                          width: itemWidth, // 1/3 width
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Color(0xffA962FF),
                              fontSize: 16,
                              fontFamily: "Helvetica",
                            ),
                            textAlign: TextAlign.left,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20, // space between items horizontally
            runSpacing: 15, // space between rows
            children: [
              Image.asset("/images/jag.png", width: 100, height: 40),
              Image.asset("/images/bug.png", width: 100, height: 40),
              Image.asset("/images/ben.png", width: 100, height: 40),
              Image.asset("/images/odi.png", width: 100, height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
