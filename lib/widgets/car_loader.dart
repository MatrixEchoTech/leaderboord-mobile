import 'dart:math';
import 'package:flutter/material.dart';

class CarLoader extends StatefulWidget {
  final bool showBackground;

  const CarLoader({
    super.key,
    this.showBackground = true,
  });

  @override
  State<CarLoader> createState() => _CarLoaderState();
}

class _CarLoaderState extends State<CarLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: widget.showBackground
            ? const Color(0xFF0D0D0F).withOpacity(0.9)
            : Colors.transparent,
        child: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: controller.value * 2 * pi,
                child: child,
              );
            },
            child: CustomPaint(
              size: const Size(80, 80),
              painter: _TirePainter(),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//   CUSTOM PAINTER FOR THE TIRE SVG
// ---------------------------------------------------------------------------

class _TirePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    // SVG Colors
    const tireStroke = Color(0xFF1e293b);
    const treadStroke = Color(0xFF4361ee);
    const rimStroke = Color(0xFFf72585);

    // --------------------------
    // OUTER TIRE (Stroke width 6)
    // --------------------------
    canvas.drawCircle(
      Offset(cx, cy),
      28,
      Paint()
        ..color = tireStroke
        ..strokeWidth = 6
        ..style = PaintingStyle.stroke,
    );

    // --------------------------
    // TREAD (DASHED CIRCLE)
    // --------------------------
    Paint treadPaint = Paint()
      ..color = treadStroke
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dash = 4;
    const gap = 6;

    double circumference = 2 * pi * 26;
    int dashCount = (circumference / (dash + gap)).floor();

    for (int i = 0; i < dashCount; i++) {
      double startAngle = (i * (dash + gap)) / 26;
      double sweepAngle = dash / 26;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: 26),
        startAngle,
        sweepAngle,
        false,
        treadPaint,
      );
    }

    // --------------------------
    // RIM (Stroke width 4)
    // --------------------------
    canvas.drawCircle(
      Offset(cx, cy),
      12,
      Paint()
        ..color = rimStroke
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke,
    );

    // --------------------------
    // SPOKES
    // --------------------------
    Paint spoke = Paint()
      ..color = rimStroke
      ..strokeWidth = 2;

    canvas.drawLine(Offset(cx, cy - 12), Offset(cx, cy + 12), spoke);
    canvas.drawLine(Offset(cx - 12, cy), Offset(cx + 12, cy), spoke);
    canvas.drawLine(Offset(cx - 10, cy - 10), Offset(cx + 10, cy + 10), spoke);
    canvas.drawLine(Offset(cx - 10, cy + 10), Offset(cx + 10, cy - 10), spoke);
  }

  @override
  bool shouldRepaint(_) => true;
}
