import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  const BounceAnimation({
    super.key,
    required this.child,
    required this.delay,
  });

  final Widget child;
  final double delay;

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (2500 * widget.delay).round()),
      vsync: this,
    );

    final Animation<double> curve = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1, curve: Curves.elasticOut));

    offsetAnimation = Tween<double>(begin: 100, end: 0.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offsetAnimation.value),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
