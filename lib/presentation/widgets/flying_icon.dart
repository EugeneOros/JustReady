import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlyingIcon extends HookWidget {
  final double angle; // Angle in radians
  final Widget child;
  final Duration? duration;
  final double rotationSpeed; // Rotation speed in radians per second

  const FlyingIcon({
    super.key,
    required this.child,
    required this.angle,
    this.duration,
    this.rotationSpeed = 0.0, // Default rotation speed is 0.0
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: duration ?? const Duration(seconds: 1));
    final animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );

    final screenSize = MediaQuery.of(context).size;
    final distance = screenSize.width / 2 * sqrt(2); // Diagonal distance to corner

    const initialScale = 0.5;
    const middleScale = 3.5;
    const targetScale = 2.0;

    const initialPosition = Offset(0, 0);
    final targetPosition = Offset(cos(angle) * distance, sin(angle) * distance);

    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final currentPosition = Offset.lerp(initialPosition, targetPosition, animation.value)!;
        final currentRotation = rotationSpeed * animation.value;

        double opacity = 1.0;
        const fadeThreshold = 5 / 6; // Fading out starts during the last 1/6 of the animation
        if (animation.value >= fadeThreshold) {
          opacity = 1.0 - ((animation.value - fadeThreshold) / (1 - fadeThreshold));
        }

        return Transform.translate(
          offset: currentPosition,
          child: Transform.rotate(
            angle: currentRotation,
            child: Transform.scale(
              scale: (animation.value <= 0.5)
                  ? Tween<double>(
                      begin: initialScale,
                      end: middleScale,
                    ).transform(animation.value * 2)
                  : Tween<double>(
                      begin: middleScale,
                      end: targetScale,
                    ).transform((animation.value - 0.5) * 2),
              child: Opacity(
                opacity: opacity.clamp(0.0, 1.0), // Ensure opacity is within valid range
                child: child,
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}
