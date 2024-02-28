import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RotatingWidget extends HookWidget {
  final Widget child;
  final double distanceFromCenter;
  final bool clockwise;
  final Duration duration;
  final double startAngle;

  const RotatingWidget({
    super.key,
    required this.child,
    required this.distanceFromCenter,
    this.clockwise = true,
    this.duration = const Duration(seconds: 5),
    this.startAngle = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final rotationController = useAnimationController(duration: duration);
    final rotationAnimation = Tween<double>(begin: startAngle, end: startAngle + 2 * pi).animate(rotationController);
    final selfRotationController = useAnimationController(duration: const Duration(seconds: 2));
    final selfRotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(selfRotationController);

    useEffect(() {
      rotationController.repeat();
      selfRotationController.repeat();
      return null;
    }, []);

    return AnimatedBuilder(
      animation: Listenable.merge([rotationController, selfRotationController]),
      builder: (context, child) {
        final rotationAngle = (clockwise ? 1 : -1) * rotationAnimation.value;
        final selfRotationAngle = (clockwise ? 1 : -1) * selfRotationAnimation.value;

        final double x = cos(rotationAngle) * distanceFromCenter;
        final double y = sin(rotationAngle) * distanceFromCenter;

        return Transform.translate(
          offset: Offset(x, y),
          child: Transform.rotate(
            angle: selfRotationAngle,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
