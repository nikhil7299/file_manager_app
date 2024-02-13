import 'package:flutter/material.dart';

class BlurCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = const Color.fromARGB(255, 79, 55, 119);
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 72);
    canvas.drawCircle(const Offset(0, 0), 140, paint);
    canvas.drawCircle(Offset(size.width, size.height / 2 - 60), 140, paint);
    canvas.drawCircle(Offset(0, size.height - 60), 120, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BlurCirclePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = const Color.fromARGB(255, 79, 55, 119);
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);
    canvas.drawCircle(const Offset(0, 0), 140, paint);
    canvas.drawCircle(Offset(0, size.height / 2 - 60), 140, paint);
    canvas.drawCircle(Offset(size.width, size.height - 60), 120, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
