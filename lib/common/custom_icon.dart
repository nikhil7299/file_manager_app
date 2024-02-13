import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Color,
        Colors,
        Container,
        Icon,
        IconData,
        StatelessWidget,
        Widget;

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  const CustomIcon({
    super.key,
    required this.iconData,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
