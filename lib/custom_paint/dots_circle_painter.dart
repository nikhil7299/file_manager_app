import 'dart:math' as math;
import 'package:file_manager_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class CircleWithDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint dotPaint = Paint()
      ..color = AppColors.progressColor
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 20; i++) {
      if ([14, 15, 16].contains(i)) {
        continue;
      }
      double angle = (i * 2 * math.pi) / 20;
      double x = center.dx + radius * math.cos(angle);
      double y = center.dy + radius * math.sin(angle);
      canvas.drawCircle(Offset(x, y), 1, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
