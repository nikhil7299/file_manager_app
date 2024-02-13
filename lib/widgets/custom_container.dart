import 'package:file_manager_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;
  final Widget child;
  final EdgeInsetsGeometry padding;
  const CustomContainer({
    super.key,
    this.height,
    this.width,
    required this.borderRadius,
    required this.child,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.white12, width: 2),
      ),
      child: child,
    );
  }
}
