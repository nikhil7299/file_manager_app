import 'package:file_manager_app/common/app_colors.dart';
import 'package:flutter/material.dart';

//?
//?
//?
//?
//?
//? NIKHIL KUMAR
//?
//? Software Engineer
//?
//? @flutter.fury
//?
//?
//?
//?
//?

class CustomFolder extends CustomPainter {
  Path folderClipper({required double radius, required Size size}) {
    // Offset.zero & size == Rect.fromLTWH(0, 0, size.width, size.height);
    final path2 = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)),
      )
      ..moveTo(size.width / 2 + 5 - radius, 0)

      // Path to clip
      ..arcToPoint(
        Offset(size.width / 2, radius - 12),
        radius: Radius.circular(radius),
      )
      ..lineTo(4 * size.width / 6 - 8, size.height / 4 - 4)
      ..arcToPoint(
        Offset(4 * size.width / 6, size.height / 4),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(size.width - radius, size.height / 4)
      ..arcToPoint(Offset(size.width, size.height / 4 + radius),
          radius: Radius.circular(radius))
      ..lineTo(size.width, radius)
      ..arcToPoint(Offset(size.width - radius, 0),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width / 2 + 5 - radius, 0);
    //
    return path2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius2 = size.height / 10;
    final radius0 = size.height / 12;
    // print(radius2);
    // print(radius0);
    const double radius1 = 11;
    final paint0 = Paint()..color = Colors.white.withOpacity(.4);
    final path0 = Path()
      ..moveTo(size.width / 2, size.height / 6)
      ..lineTo(5 * size.width / 6 - 5, 1)
      ..arcToPoint(Offset(5 * size.width / 6 + radius0 - 2, 15),
          radius: Radius.circular(radius0))
      ..lineTo(14 * size.width / 15, size.height / 4 + 10)
      ..lineTo(size.width / 2, size.height / 4 + 10)
      ..close();

    final paint1 = Paint()..color = Colors.white.withOpacity(.4);
    final path1 = Path()
      ..moveTo(size.width / 2, size.height / 6 + 5)
      ..lineTo(14 * size.width / 15, size.height / 8)
      ..arcToPoint(Offset(size.width - 2, size.height / 8 + 15),
          radius: const Radius.circular(radius1))
      ..lineTo(size.width - 10, size.height / 3)
      ..lineTo(size.width / 2, size.height / 3)
      ..close();
    final paint2 = Paint()..color = AppColors.containerColor;
    final path2 = folderClipper(radius: radius2, size: size);
    final boderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = .2
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path0, paint0);
    canvas.drawPath(path1, paint1);
    canvas.clipPath(path2);
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path2, boderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
