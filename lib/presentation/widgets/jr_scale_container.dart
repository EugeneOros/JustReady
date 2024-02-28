import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class JrPoppingContainer extends HookWidget {
  final Widget child;
  final Function()? onAnimationFinished;

  const JrPoppingContainer({
    super.key,
    required this.child,
    this.onAnimationFinished,
  });

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(duration: const Duration(milliseconds: 400));
    late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.bounceOut);

    useOnce(() {
      scaleController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (onAnimationFinished != null) onAnimationFinished!();
        }
      });
      scaleController.forward();
    });

    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: child,
      ),
    );
  }
}
