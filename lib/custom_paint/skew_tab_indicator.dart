import 'package:flutter/material.dart';

class SkewTabIndicator extends Decoration {
  final TabController tabController;
  final double borderRadius;
  final Color color;

  const SkewTabIndicator({
    required this.color,
    required this.tabController,
    required this.borderRadius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SkewTabPainter(
      color: color,
      radius: borderRadius,
      tabController: tabController,
    );
  }
}

class _SkewTabPainter extends BoxPainter {
  final TabController tabController;
  final double radius;
  final Color color;

  _SkewTabPainter({
    required this.color,
    required this.radius,
    required this.tabController,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()..color = color;
    final Path path = Path();
    if (tabController.indexIsChanging) {
      path.addRRect(
        RRect.fromRectAndRadius(
          rect,
          Radius.circular(radius),
        ),
      );
    }
    if (tabController.index == 0 && !tabController.indexIsChanging) {
      path
        ..moveTo(radius, 0)
        ..lineTo(rect.right - radius, 0)
        //
        ..arcToPoint(Offset(rect.right, radius),
            radius: Radius.circular(radius - 1))
        ..lineTo(rect.right - 8, rect.bottom - radius)
        ..arcToPoint(Offset(rect.right - (2 * radius), rect.bottom),
            radius: Radius.circular(1.5 * radius))
        ..lineTo(radius, rect.bottom)
        ..arcToPoint(Offset(0, rect.bottom - radius),
            radius: Radius.circular(radius))
        ..lineTo(0, radius)
        ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));
    } else if (tabController.index == 1 && !tabController.indexIsChanging) {
      path
        ..moveTo(rect.left + 1.5 * radius, 0)
        ..lineTo(rect.right - radius, 0)
        ..arcToPoint(Offset(rect.right, radius),
            radius: Radius.circular(radius))
        ..lineTo(rect.right, rect.bottom - radius)
        ..arcToPoint(Offset(rect.right - radius, rect.bottom),
            radius: Radius.circular(radius))
        ..lineTo(rect.left - radius + 5, rect.bottom)
        //
        ..arcToPoint(Offset(rect.left - radius, rect.bottom - radius),
            radius: Radius.circular(radius - 1))
        ..lineTo(rect.left - 2, radius)
        ..arcToPoint(Offset(rect.left + (1.5 * radius), 0),
            radius: Radius.circular(1.5 * radius));
    }
    path.close();
    canvas.drawPath(path, paint);
  }
}
