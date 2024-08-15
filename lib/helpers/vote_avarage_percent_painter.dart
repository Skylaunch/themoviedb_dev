import 'dart:math';

import 'package:flutter/material.dart';

class VoteAvaragePercentPainter extends CustomPainter {
  final double percent;

  VoteAvaragePercentPainter({super.repaint, required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundShapePaint = Paint();
    backgroundShapePaint.color = Colors.black;
    canvas.drawOval(Offset.zero & size, backgroundShapePaint);

    final emptyArcPaint = Paint();
    emptyArcPaint.color = const Color(0xFF1F4229);
    emptyArcPaint.strokeWidth = 3;
    emptyArcPaint.style = PaintingStyle.stroke;
    canvas.drawArc(
      const Offset(4.5, 4.5) & Size(size.width - 9, size.height - 9),
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      emptyArcPaint,
    );

    final filledArcPaint = Paint();
    filledArcPaint.color = Colors.green;
    filledArcPaint.strokeWidth = 3;
    filledArcPaint.strokeCap = StrokeCap.round;
    filledArcPaint.style = PaintingStyle.stroke;
    canvas.drawArc(
      const Offset(4.5, 4.5) & Size(size.width - 9, size.height - 9),
      -pi / 2,
      pi * 2 * percent,
      false,
      filledArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
