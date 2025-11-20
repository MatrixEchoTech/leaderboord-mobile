import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ---------------------------
///  MODEL DATA
/// ---------------------------

class SpecItemModel {
  final String icon;
  final String title;
  final String value;

  SpecItemModel({required this.icon, required this.title, required this.value});
}

List<SpecItemModel> specsData = [
  SpecItemModel(icon: "images/calendar.png", title: "Year", value: "2018"),

  SpecItemModel(
    icon: "images/make-modal.png",
    title: "Make & Model",
    value: "Nissan GT-R R35 ",
  ),

  SpecItemModel(icon: "images/color.png", title: "Color", value: "White"),

  SpecItemModel(
    icon: "images/horsepower.png",
    title: "Horsepower",
    value: "111 hp",
  ),

  SpecItemModel(icon: "images/torque.png", title: "Torque", value: "111 Nm"),

  SpecItemModel(icon: "images/timer.png", title: "0-60 km/h", value: "111s"),

  SpecItemModel(
    icon: "images/top-speed.png",
    title: "Top Speed",
    value: "111 kmh",
  ),

  SpecItemModel(
    icon: "images/mileage.png",
    title: "Mileage",
    value: "111 miles",
  ),

  SpecItemModel(
    icon: "images/fuel.png",
    title: "Fuel Efficiency",
    value: "111 mpg",
  ),
];

/// ---------------------------
///  SPEC ITEM UI
/// ---------------------------

class SpecItem extends StatelessWidget {
  final SpecItemModel item;

  const SpecItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF171C29),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min, // expands only based on content
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.icon, width: 21, height: 20),
          const SizedBox(height: 3),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: const Color(0xFF4C98F1),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),

          // auto-wrap content
          Text(
            item.value,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

/// ---------------------------
///  AUTO-HEIGHT ROW BASED GRID
/// ---------------------------

class CarSpecGrid extends StatelessWidget {
  const CarSpecGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Row> rows = [];

    // Create rows with 2 items each
    for (int i = 0; i < specsData.length; i += 2) {
      final item1 = specsData[i];
      final item2 = (i + 1 < specsData.length) ? specsData[i + 1] : null;

      rows.add(
        Row(
          children: [
            Expanded(child: SpecItem(item: item1)),
            const SizedBox(width: 12),

            // second slot or empty if odd count
            Expanded(
              child: item2 != null ? SpecItem(item: item2) : const SizedBox(),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        for (var r in rows) ...[r, const SizedBox(height: 12)],
      ],
    );
  }
}
